package com.get.controller;

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
import java.util.List;
import java.util.Map;
import com.get.domain.QuartzDO;
import com.get.service.QuartzService;

/**
 * 定时任务表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-31 17:33:23
 */

@Controller
@RequestMapping("/manager/get/quartz")
public class QuartzController {
    @Autowired
    private QuartzService quartzService;

    @GetMapping()
    @RequiresPermissions("get:quartz:quartz")
    public String Quartz() {
        return "get/quartz/quartz";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:quartz:quartz")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<QuartzDO> quartzList = quartzService.list(query);
        int total = quartzService.count(query);
        PageUtils pageUtils = new PageUtils(quartzList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:quartz:add")
    String add() {
        return "get/quartz/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:quartz:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            QuartzDO quartz = quartzService.get(tid);
        model.addAttribute("quartz", quartz);
        return "get/quartz/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:quartz:add")
    public R save(QuartzDO quartz) {
        quartz.setCreateDate(new Date());
        quartz.setUpdateDate(new Date());
        quartz.setDelFlag(CommonStatic.NOTDELETE);
        if (quartzService.save(quartz) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:quartz:edit")
    public R update(QuartzDO quartz) {
        quartz.setUpdateDate(new Date());
            quartzService.update(quartz);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:quartz:remove")
    public R remove( String tid) {
        if (quartzService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:quartz:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            quartzService.batchRemove(tids);
        return R.ok();
    }

}
