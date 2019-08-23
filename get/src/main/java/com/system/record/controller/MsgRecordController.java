package com.system.record.controller;

import com.common.utils.*;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import com.system.record.domain.MsgRecordDO;
import com.system.record.service.MsgRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * 发送短信记录表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-23 15:01:42
 */

@Controller
@RequestMapping("${backPathPrefix}/record/msgRecord")
public class MsgRecordController {
    @Autowired
    private MsgRecordService msgRecordService;

    @GetMapping()
    @RequiresPermissions("record:msgRecord:msgRecord")
    public String msgRecord() {
        return "record/msgRecord/msgRecord";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("record:msgRecord:msgRecord")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        String createDate = (String) params.get("createEndDate");
        if(StringUtils.isNotBlank(createDate)){
            createDate = DateUtils.timeAddOne(createDate);
            params.put("createEndDate",createDate);
        }
        //查询列表数据
        Query query = new Query(params);
        List<MsgRecordDO> msgRecordList = msgRecordService.list(query);
        int total = msgRecordService.count(query);
        PageUtils pageUtils = new PageUtils(msgRecordList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("record:msgRecord:add")
    String add() {
        return "record/msgRecord/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("record:msgRecord:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
        MsgRecordDO msgRecord = msgRecordService.get(tid);
        model.addAttribute("msgRecord", msgRecord);
        return "record/msgRecord/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("record:msgRecord:add")
    public R save(MsgRecordDO msgRecord) {
        if (msgRecordService.save(msgRecord) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("record:msgRecord:edit")
    public R update(MsgRecordDO msgRecord) {
        msgRecordService.update(msgRecord);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("record:msgRecord:remove")
    public R remove(String tid) {
        if (msgRecordService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("record:msgRecord:batchRemove")
    public R remove(@RequestParam("ids[]") String[] tids) {
        msgRecordService.batchRemove(tids);
        return R.ok();
    }

}
