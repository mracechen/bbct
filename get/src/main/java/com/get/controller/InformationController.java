package com.get.controller;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.get.domain.InformationDO;
import com.get.service.InformationService;

/**
 * 资讯表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-23 19:56:59
 */

@Controller
@RequestMapping("/manager/get/information")
public class InformationController {
    @Autowired
    private InformationService informationService;

    @GetMapping()
    @RequiresPermissions("get:information:information")
    public String Information() {
        return "get/information/information";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:information:information")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<InformationDO> informationList = informationService.list(query);
        int total = informationService.count(query);
        PageUtils pageUtils = new PageUtils(informationList, total);
        return pageUtils;
    }

    @ResponseBody
    @GetMapping("/queryByProperties")
    public List queryByProperties(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        return informationService.list(params);
    }

    @GetMapping("/add")
    @RequiresPermissions("get:information:add")
    String add() {
        return "get/information/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:information:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            InformationDO information = informationService.get(tid);
        model.addAttribute("information", information);
        return "get/information/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:information:add")
    public R save(InformationDO information) {
        information.setTid(IDUtils.randomStr());
        information.setCreateDate(new Date());
        information.setUpdateDate(new Date());
        information.setDelFlag(CommonStatic.NOTDELETE);
        if (informationService.save(information) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:information:edit")
    public R update(InformationDO information) {
        information.setUpdateDate(new Date());
        informationService.update(information);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:information:remove")
    public R remove( String tid) {
        try {
            if (informationService.remove(tid) > 0) {
                return R.ok();
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error("删除失败");
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:information:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
        try {
            informationService.batchRemove(tids);
        }catch (Exception e){
            e.printStackTrace();
            return R.error("删除失败");
        }
        return R.ok();
    }

}
