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
import com.get.domain.SwChargelogDO;
import com.get.service.SwChargelogService;

/**
 * 充币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:20:59
 */

@Controller
@RequestMapping("/manager/get/swChargelog")
public class SwChargelogController {
    @Autowired
    private SwChargelogService swChargelogService;

    @GetMapping()
    @RequiresPermissions("get:swChargelog:swChargelog")
    public String SwChargelog() {
        return "get/swChargelog/swChargelog";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swChargelog:swChargelog")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwChargelogDO> swChargelogList = swChargelogService.list(query);
        int total = swChargelogService.count(query);
        PageUtils pageUtils = new PageUtils(swChargelogList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swChargelog:add")
    String add() {
        return "get/swChargelog/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swChargelog:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwChargelogDO swChargelog = swChargelogService.get(tid);
        model.addAttribute("swChargelog", swChargelog);
        return "get/swChargelog/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swChargelog:add")
    public R save(SwChargelogDO swChargelog) {
        swChargelog.setCreateDate(new Date());
        swChargelog.setUpdateDate(new Date());
        swChargelog.setDelFlag(CommonStatic.NOTDELETE);
        if (swChargelogService.save(swChargelog) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swChargelog:edit")
    public R update(SwChargelogDO swChargelog) {
        swChargelog.setUpdateDate(new Date());
            swChargelogService.update(swChargelog);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swChargelog:remove")
    public R remove( String tid) {
        if (swChargelogService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swChargelog:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swChargelogService.batchRemove(tids);
        return R.ok();
    }

}
