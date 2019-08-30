package com.get.controller;

import com.get.domain.SwConsumeLogDO;
import com.get.service.SwConsumeLogService;
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
 * 消费记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-05 15:45:41
 */

@Controller
@RequestMapping("/manager/get/swConsumeLog")
public class SwConsumeLogController {
    @Autowired
    private SwConsumeLogService swConsumeLogService;

    @GetMapping()
    @RequiresPermissions("get:swConsumeLog:swConsumeLog")
    public String SwConsumeLog() {
        return "get/swConsumeLog/swConsumeLog";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swConsumeLog:swConsumeLog")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwConsumeLogDO> swConsumeLogList = swConsumeLogService.list(query);
        int total = swConsumeLogService.count(query);
        PageUtils pageUtils = new PageUtils(swConsumeLogList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swConsumeLog:add")
    String add() {
        return "get/swConsumeLog/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swConsumeLog:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwConsumeLogDO swConsumeLog = swConsumeLogService.get(tid);
        model.addAttribute("swConsumeLog", swConsumeLog);
        return "get/swConsumeLog/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swConsumeLog:add")
    public R save(SwConsumeLogDO swConsumeLog) {
        swConsumeLog.setCreateDate(new Date());
        swConsumeLog.setUpdateDate(new Date());
        swConsumeLog.setDelFlag(CommonStatic.NOTDELETE);
        if (swConsumeLogService.save(swConsumeLog) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swConsumeLog:edit")
    public R update(SwConsumeLogDO swConsumeLog) {
        swConsumeLog.setUpdateDate(new Date());
            swConsumeLogService.update(swConsumeLog);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swConsumeLog:remove")
    public R remove(String tid) {
        if (swConsumeLogService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swConsumeLog:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swConsumeLogService.batchRemove(tids);
        return R.ok();
    }

}
