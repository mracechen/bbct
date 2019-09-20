package com.get.controller;

import com.common.utils.StringUtils;
import com.get.domain.SwAccountRecordDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwCoinTypeService;
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
 * 账户记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:53:13
 */

@Controller
@RequestMapping("/manager/get/swAccountRecord")
public class SwAccountRecordController {
    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    SwCoinTypeService swCoinTypeService;

    @GetMapping()
    @RequiresPermissions("get:swAccountRecord:swAccountRecord")
    public String SwAccountRecord(Model model) {
        model.addAttribute("maps", swCoinTypeService.getCoinTypeMap());
        return "get/swAccountRecord/swAccountRecord";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swAccountRecord:swAccountRecord")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        if(params.get("createStartDate") != null && StringUtils.isNotBlank(params.get("createStartDate").toString())){
            String createStartDate = params.get("createStartDate").toString();

            params.put("beginDate",createStartDate + " 00:00:00");
        }
        if(params.get("createEndDate") != null && StringUtils.isNotBlank(params.get("createEndDate").toString())){
            String createEndDate = params.get("createEndDate").toString();
            params.put("endDate",createEndDate + " 23:59:59");
        }
        //查询列表数据
        Query query = new Query(params);
        List<SwAccountRecordDO> swAccountRecordList = swAccountRecordService.list(query);
        Map<String, String> coinTypeMap = swCoinTypeService.getCoinTypeMap();
        for (SwAccountRecordDO accountRecordDO : swAccountRecordList) {
            for (String s : coinTypeMap.keySet()) {
                if(accountRecordDO.getCoinTypeId().equals(s)){
                    accountRecordDO.setCoinTypeId(coinTypeMap.get(s));
                }
            }
        }
        int total = swAccountRecordService.count(query);
        PageUtils pageUtils = new PageUtils(swAccountRecordList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swAccountRecord:add")
    String add() {
        return "get/swAccountRecord/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swAccountRecord:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwAccountRecordDO swAccountRecord = swAccountRecordService.get(tid);
        model.addAttribute("swAccountRecord", swAccountRecord);
        return "get/swAccountRecord/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swAccountRecord:add")
    public R save(SwAccountRecordDO swAccountRecord) {
        swAccountRecord.setCreateDate(new Date());
        swAccountRecord.setUpdateDate(new Date());
        swAccountRecord.setDelFlag(CommonStatic.NOTDELETE);
        if (swAccountRecordService.save(swAccountRecord) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swAccountRecord:edit")
    public R update(SwAccountRecordDO swAccountRecord) {
        swAccountRecord.setUpdateDate(new Date());
            swAccountRecordService.update(swAccountRecord);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swAccountRecord:remove")
    public R remove(String tid) {
        if (swAccountRecordService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swAccountRecord:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swAccountRecordService.batchRemove(tids);
        return R.ok();
    }

}
