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
import com.get.domain.SwTransferRecordDO;
import com.get.service.SwTransferRecordService;

/**
 * 转账记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:28:18
 */

@Controller
@RequestMapping("/manager/get/swTransferRecord")
public class SwTransferRecordController {
    @Autowired
    private SwTransferRecordService swTransferRecordService;

    @GetMapping()
    @RequiresPermissions("get:swTransferRecord:swTransferRecord")
    public String SwTransferRecord() {
        return "get/swTransferRecord/swTransferRecord";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swTransferRecord:swTransferRecord")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwTransferRecordDO> swTransferRecordList = swTransferRecordService.list(query);
        int total = swTransferRecordService.count(query);
        PageUtils pageUtils = new PageUtils(swTransferRecordList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swTransferRecord:add")
    String add() {
        return "get/swTransferRecord/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swTransferRecord:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwTransferRecordDO swTransferRecord = swTransferRecordService.get(tid);
        model.addAttribute("swTransferRecord", swTransferRecord);
        return "get/swTransferRecord/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swTransferRecord:add")
    public R save(SwTransferRecordDO swTransferRecord) {
        swTransferRecord.setCreateDate(new Date());
        swTransferRecord.setUpdateDate(new Date());
        swTransferRecord.setDelFlag(CommonStatic.NOTDELETE);
        if (swTransferRecordService.save(swTransferRecord) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swTransferRecord:edit")
    public R update(SwTransferRecordDO swTransferRecord) {
        swTransferRecord.setUpdateDate(new Date());
            swTransferRecordService.update(swTransferRecord);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swTransferRecord:remove")
    public R remove( String tid) {
        if (swTransferRecordService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swTransferRecord:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swTransferRecordService.batchRemove(tids);
        return R.ok();
    }

}
