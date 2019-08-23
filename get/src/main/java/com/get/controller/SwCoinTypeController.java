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
import com.get.domain.SwCoinTypeDO;
import com.get.service.SwCoinTypeService;

/**
 * 平台币种表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:01:32
 */

@Controller
@RequestMapping("/manager/get/swCoinType")
public class SwCoinTypeController {
    @Autowired
    private SwCoinTypeService swCoinTypeService;

    @GetMapping()
    @RequiresPermissions("get:swCoinType:swCoinType")
    public String SwCoinType() {
        return "get/swCoinType/swCoinType";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swCoinType:swCoinType")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwCoinTypeDO> swCoinTypeList = swCoinTypeService.list(query);
        int total = swCoinTypeService.count(query);
        PageUtils pageUtils = new PageUtils(swCoinTypeList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swCoinType:add")
    String add() {
        return "get/swCoinType/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swCoinType:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwCoinTypeDO swCoinType = swCoinTypeService.get(tid);
        model.addAttribute("swCoinType", swCoinType);
        return "get/swCoinType/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swCoinType:add")
    public R save(SwCoinTypeDO swCoinType) {
        swCoinType.setCreateDate(new Date());
        swCoinType.setUpdateDate(new Date());
        swCoinType.setDelFlag(CommonStatic.NOTDELETE);
        if (swCoinTypeService.save(swCoinType) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swCoinType:edit")
    public R update(SwCoinTypeDO swCoinType) {
        swCoinType.setUpdateDate(new Date());
            swCoinTypeService.update(swCoinType);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swCoinType:remove")
    public R remove( String tid) {
        if (swCoinTypeService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swCoinType:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swCoinTypeService.batchRemove(tids);
        return R.ok();
    }

}
