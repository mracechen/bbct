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
import com.get.domain.SwPeriodDO;
import com.get.service.SwPeriodService;

/**
 * 定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:23:16
 */

@Controller
@RequestMapping("/manager/get/swPeriod")
public class SwPeriodController {
    @Autowired
    private SwPeriodService swPeriodService;

    @GetMapping()
    @RequiresPermissions("get:swPeriod:swPeriod")
    public String SwPeriod() {
        return "get/swPeriod/swPeriod";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPeriod:swPeriod")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwPeriodDO> swPeriodList = swPeriodService.list(query);
        int total = swPeriodService.count(query);
        PageUtils pageUtils = new PageUtils(swPeriodList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPeriod:add")
    String add() {
        return "get/swPeriod/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPeriod:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPeriodDO swPeriod = swPeriodService.get(tid);
        model.addAttribute("swPeriod", swPeriod);
        return "get/swPeriod/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPeriod:add")
    public R save(SwPeriodDO swPeriod) {
        swPeriod.setCreateDate(new Date());
        swPeriod.setUpdateDate(new Date());
        swPeriod.setDelFlag(CommonStatic.NOTDELETE);
        if (swPeriodService.save(swPeriod) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swPeriod:edit")
    public R update(SwPeriodDO swPeriod) {
        swPeriod.setUpdateDate(new Date());
            swPeriodService.update(swPeriod);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPeriod:remove")
    public R remove( String tid) {
        if (swPeriodService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPeriod:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPeriodService.batchRemove(tids);
        return R.ok();
    }

}
