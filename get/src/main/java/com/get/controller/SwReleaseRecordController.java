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
import com.get.domain.SwReleaseRecordDO;
import com.get.service.SwReleaseRecordService;

/**
 * 释放记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:23:28
 */

@Controller
@RequestMapping("/manager/get/swReleaseRecord")
public class SwReleaseRecordController {
    @Autowired
    private SwReleaseRecordService swReleaseRecordService;

    @GetMapping()
    @RequiresPermissions("get:swReleaseRecord:swReleaseRecord")
    public String SwReleaseRecord() {
        return "get/swReleaseRecord/swReleaseRecord";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swReleaseRecord:swReleaseRecord")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwReleaseRecordDO> swReleaseRecordList = swReleaseRecordService.list(query);
        int total = swReleaseRecordService.count(query);
        PageUtils pageUtils = new PageUtils(swReleaseRecordList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swReleaseRecord:add")
    String add() {
        return "get/swReleaseRecord/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swReleaseRecord:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwReleaseRecordDO swReleaseRecord = swReleaseRecordService.get(tid);
        model.addAttribute("swReleaseRecord", swReleaseRecord);
        return "get/swReleaseRecord/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swReleaseRecord:add")
    public R save(SwReleaseRecordDO swReleaseRecord) {
        swReleaseRecord.setCreateDate(new Date());
        swReleaseRecord.setUpdateDate(new Date());
        swReleaseRecord.setDelFlag(CommonStatic.NOTDELETE);
        if (swReleaseRecordService.save(swReleaseRecord) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swReleaseRecord:edit")
    public R update(SwReleaseRecordDO swReleaseRecord) {
        swReleaseRecord.setUpdateDate(new Date());
            swReleaseRecordService.update(swReleaseRecord);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swReleaseRecord:remove")
    public R remove( String tid) {
        if (swReleaseRecordService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swReleaseRecord:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swReleaseRecordService.batchRemove(tids);
        return R.ok();
    }

}
