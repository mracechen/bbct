package com.get.controller;

import com.get.domain.AppInfo;
import com.get.service.AppInfoService;
import com.get.statuc.CommonStatic;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * app更新记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-04-09 16:12:52
 */

@Controller
@RequestMapping("/manager/get/appInfo")
public class AppInfoController {
    @Autowired
    private AppInfoService appInfoService;

    @GetMapping()
    @RequiresPermissions("get:appInfo:appInfo")
    public String AppInfo() {
        return "get/appInfo/appInfo";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:appInfo:appInfo")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<AppInfo> appInfoList = appInfoService.list(query);
        int total = appInfoService.count(query);
        PageUtils pageUtils = new PageUtils(appInfoList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:appInfo:add")
    String add() {
        return "get/appInfo/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("get:appInfo:edit")
    String edit(@PathVariable("id") Integer id, Model model) {
            AppInfo appInfo = appInfoService.get(id);
        model.addAttribute("appInfo", appInfo);
        return "get/appInfo/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:appInfo:add")
    public R save(AppInfo appInfo) {
        appInfo.setCreateTime(new Date());
//        appInfo.se(new Date());
//        appInfo.setDelFlag(CommonStatic.NOTDELETE);
        if (appInfoService.save(appInfo) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:appInfo:edit")
    public R update(AppInfo appInfo) {
//        appInfo.setUpdateDate(new Date());
            appInfoService.update(appInfo);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:appInfo:remove")
    public R remove(Integer id) {
        if (appInfoService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:appInfo:batchRemove")
    public R remove(@RequestParam("ids[]") Integer[]ids) {
            appInfoService.batchRemove(ids);
        return R.ok();
    }

}
