package com.system.language.controller;

import com.get.statuc.CommonStatic;
import com.common.utils.IDUtils;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import com.system.language.domain.LanguageDO;
import com.system.language.service.LanguageService;
import com.system.languagecat.domain.LanguageCategoryDO;
import com.system.languagecat.service.LanguageCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 国际化语言表
 *
 * @author chglee
 * @date 2018-09-05 16:07:36
 */

@Controller
@RequestMapping("${backPathPrefix}/language/language")
public class LanguageController {

    @Autowired
    private LanguageService languageService;

    @Autowired
    private LanguageCategoryService languageCategoryService;

    @GetMapping()
    @RequiresPermissions("language:language:language")
    String Language() {
        return "language/language/language";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("language:language:language")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<LanguageDO> languageList = languageService.list(query);
        int total = languageService.count(query);
        PageUtils pageUtils = new PageUtils(languageList, total);
        return pageUtils;
    }


    @GetMapping("/add")
    @RequiresPermissions("language:language:add")
    String add(Model model) {
        Map<String, Object> queryList = new HashMap<>();
        queryList.put("isEnable", CommonStatic.OPEN);
        List<LanguageCategoryDO> categoryDOS = languageCategoryService.list(queryList);
        model.addAttribute("categorys", categoryDOS);
        return "language/language/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("language:language:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
        LanguageDO language = languageService.get(tid);
        model.addAttribute("language", language);
        return "language/language/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("language:language:add")
    public R save(LanguageDO language) {
        language.setTid(IDUtils.randomStr());
        language.setCreateDate(new Date());
        language.setUpdateDate(new Date());

        if (languageService.save(language) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("language:language:edit")
    public R update(LanguageDO language) {
        language.setCreateDate(null);
        language.setUpdateDate(new Date());
        languageService.update(language);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("language:language:remove")
    public R remove(String tid) {
        if (languageService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("language:language:batchRemove")
    public R remove(@RequestParam("ids[]") String[] tids) {
        languageService.batchRemove(tids);
        return R.ok();
    }

}
