package com.get.controller;

import com.common.utils.IDUtils;
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
import com.get.domain.SwPrincipalDO;
import com.get.service.SwPrincipalService;

/**
 * 固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:27:04
 */

@Controller
@RequestMapping("/manager/get/swPrincipal")
public class SwPrincipalController {
    @Autowired
    private SwPrincipalService swPrincipalService;

    @GetMapping()
    @RequiresPermissions("get:swPrincipal:swPrincipal")
    public String SwPrincipal() {
        return "get/swPrincipal/swPrincipal";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPrincipal:swPrincipal")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwPrincipalDO> swPrincipalList = swPrincipalService.list(query);
        int total = swPrincipalService.count(query);
        PageUtils pageUtils = new PageUtils(swPrincipalList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPrincipal:add")
    String add() {
        return "get/swPrincipal/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPrincipal:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPrincipalDO swPrincipal = swPrincipalService.get(tid);
        model.addAttribute("swPrincipal", swPrincipal);
        return "get/swPrincipal/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPrincipal:add")
    public R save(SwPrincipalDO swPrincipal) {
        swPrincipal.setTid(IDUtils.randomStr());
        swPrincipal.setCreateDate(new Date());
        swPrincipal.setUpdateDate(new Date());
        swPrincipal.setDelFlag(CommonStatic.NOTDELETE);
        if (swPrincipalService.save(swPrincipal) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swPrincipal:edit")
    public R update(SwPrincipalDO swPrincipal) {
        swPrincipal.setUpdateDate(new Date());
            swPrincipalService.update(swPrincipal);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPrincipal:remove")
    public R remove( String tid) {
        if (swPrincipalService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPrincipal:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPrincipalService.batchRemove(tids);
        return R.ok();
    }

}
