package com.get.controller;

import com.get.domain.MailRecordDO;
import com.get.service.MailRecordService;
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
 * 邮箱注册码表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:50:52
 */

@Controller
@RequestMapping("/manager/get/mailRecord")
public class MailRecordController {
    @Autowired
    private MailRecordService mailRecordService;

    @GetMapping()
    @RequiresPermissions("get:mailRecord:mailRecord")
    public String MailRecord() {
        return "get/mailRecord/mailRecord";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:mailRecord:mailRecord")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<MailRecordDO> mailRecordList = mailRecordService.list(query);
        int total = mailRecordService.count(query);
        PageUtils pageUtils = new PageUtils(mailRecordList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:mailRecord:add")
    String add() {
        return "get/mailRecord/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:mailRecord:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            MailRecordDO mailRecord = mailRecordService.get(tid);
        model.addAttribute("mailRecord", mailRecord);
        return "get/mailRecord/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:mailRecord:add")
    public R save(MailRecordDO mailRecord) {
        mailRecord.setCreateDate(new Date());
        mailRecord.setUpdateDate(new Date());
        mailRecord.setDelFlag(CommonStatic.NOTDELETE);
        if (mailRecordService.save(mailRecord) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:mailRecord:edit")
    public R update(MailRecordDO mailRecord) {
        mailRecord.setUpdateDate(new Date());
            mailRecordService.update(mailRecord);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:mailRecord:remove")
    public R remove(String tid) {
        if (mailRecordService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:mailRecord:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            mailRecordService.batchRemove(tids);
        return R.ok();
    }

}
