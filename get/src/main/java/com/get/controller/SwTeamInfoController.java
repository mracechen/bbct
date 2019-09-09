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
import com.get.domain.SwTeamInfoDO;
import com.get.service.SwTeamInfoService;

/**
 * 社群表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-09 20:25:15
 */

@Controller
@RequestMapping("/manager/get/swTeamInfo")
public class SwTeamInfoController {
    @Autowired
    private SwTeamInfoService swTeamInfoService;

    @GetMapping()
    @RequiresPermissions("get:swTeamInfo:swTeamInfo")
    public String SwTeamInfo() {
        return "get/swTeamInfo/swTeamInfo";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swTeamInfo:swTeamInfo")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwTeamInfoDO> swTeamInfoList = swTeamInfoService.list(query);
        int total = swTeamInfoService.count(query);
        PageUtils pageUtils = new PageUtils(swTeamInfoList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swTeamInfo:add")
    String add() {
        return "get/swTeamInfo/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swTeamInfo:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwTeamInfoDO swTeamInfo = swTeamInfoService.get(tid);
        model.addAttribute("swTeamInfo", swTeamInfo);
        return "get/swTeamInfo/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swTeamInfo:add")
    public R save(SwTeamInfoDO swTeamInfo) {
        swTeamInfo.setCreateDate(new Date());
        swTeamInfo.setUpdateDate(new Date());
        swTeamInfo.setDelFlag(CommonStatic.NOTDELETE);
        if (swTeamInfoService.save(swTeamInfo) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swTeamInfo:edit")
    public R update(SwTeamInfoDO swTeamInfo) {
        swTeamInfo.setUpdateDate(new Date());
            swTeamInfoService.update(swTeamInfo);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swTeamInfo:remove")
    public R remove( String tid) {
        if (swTeamInfoService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swTeamInfo:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swTeamInfoService.batchRemove(tids);
        return R.ok();
    }

}
