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
import com.get.domain.SwBenchmarkingDO;
import com.get.service.SwBenchmarkingService;

/**
 * 对标项目表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:56:30
 */

@Controller
@RequestMapping("/manager/get/swBenchmarking")
public class SwBenchmarkingController {
    @Autowired
    private SwBenchmarkingService swBenchmarkingService;

    @GetMapping()
    @RequiresPermissions("get:swBenchmarking:swBenchmarking")
    public String SwBenchmarking() {
        return "get/swBenchmarking/swBenchmarking";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swBenchmarking:swBenchmarking")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwBenchmarkingDO> swBenchmarkingList = swBenchmarkingService.list(query);
        int total = swBenchmarkingService.count(query);
        PageUtils pageUtils = new PageUtils(swBenchmarkingList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swBenchmarking:add")
    String add() {
        return "get/swBenchmarking/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swBenchmarking:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwBenchmarkingDO swBenchmarking = swBenchmarkingService.get(tid);
        model.addAttribute("swBenchmarking", swBenchmarking);
        return "get/swBenchmarking/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swBenchmarking:add")
    public R save(SwBenchmarkingDO swBenchmarking) {
        swBenchmarking.setCreateDate(new Date());
        swBenchmarking.setUpdateDate(new Date());
        swBenchmarking.setDelFlag(CommonStatic.NOTDELETE);
        if (swBenchmarkingService.save(swBenchmarking) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swBenchmarking:edit")
    public R update(SwBenchmarkingDO swBenchmarking) {
        swBenchmarking.setUpdateDate(new Date());
            swBenchmarkingService.update(swBenchmarking);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swBenchmarking:remove")
    public R remove( String tid) {
        if (swBenchmarkingService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swBenchmarking:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swBenchmarkingService.batchRemove(tids);
        return R.ok();
    }

}
