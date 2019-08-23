package com.system.languagecat.controller;

import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import com.system.languagecat.domain.LanguageCategoryDO;
import com.system.languagecat.service.LanguageCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 语言分类
 *
 * @author sunyalong
 * @email 1992lcg@163.com
 * @date 2018-09-13 11:59:36
 */

@Controller
@RequestMapping("${backPathPrefix}/languagecat/languageCategory")
public class LanguageCategoryController {
    @Autowired
    private LanguageCategoryService languageCategoryService;

    @GetMapping()
    @RequiresPermissions("languagecat:languageCategory:languageCategory")
    String LanguageCategory() {
        return "languagecat/languageCategory/languageCategory";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("languagecat:languageCategory:languageCategory")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<LanguageCategoryDO> languageCategoryList = languageCategoryService.list(query);
        int total = languageCategoryService.count(query);
        PageUtils pageUtils = new PageUtils(languageCategoryList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("languagecat:languageCategory:add")
    String add() {
        return "languagecat/languageCategory/add";
    }

    @GetMapping("/edit/{status}")
    @RequiresPermissions("languagecat:languageCategory:edit")
    String edit(@PathVariable("status") String status, Model model) {
        LanguageCategoryDO languageCategory = languageCategoryService.get(status);
        model.addAttribute("languageCategory", languageCategory);
        return "languagecat/languageCategory/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("languagecat:languageCategory:add")
    public R save(LanguageCategoryDO languageCategory) {
        if (languageCategoryService.save(languageCategory) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("languagecat:languageCategory:edit")
    public R update(LanguageCategoryDO languageCategory) {
        languageCategoryService.update(languageCategory);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("languagecat:languageCategory:remove")
    public R remove(String status) {
        if (languageCategoryService.remove(status) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("languagecat:languageCategory:batchRemove")
    public R remove(@RequestParam("ids[]") String[] statuss) {
        languageCategoryService.batchRemove(statuss);
        return R.ok();
    }

}
