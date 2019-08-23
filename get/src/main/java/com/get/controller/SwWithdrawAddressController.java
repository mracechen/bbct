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
import com.get.domain.SwWithdrawAddressDO;
import com.get.service.SwWithdrawAddressService;

/**
 * 提现地址
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:33:36
 */

@Controller
@RequestMapping("/manager/get/swWithdrawAddress")
public class SwWithdrawAddressController {
    @Autowired
    private SwWithdrawAddressService swWithdrawAddressService;

    @GetMapping()
    @RequiresPermissions("get:swWithdrawAddress:swWithdrawAddress")
    public String SwWithdrawAddress() {
        return "get/swWithdrawAddress/swWithdrawAddress";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swWithdrawAddress:swWithdrawAddress")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwWithdrawAddressDO> swWithdrawAddressList = swWithdrawAddressService.list(query);
        int total = swWithdrawAddressService.count(query);
        PageUtils pageUtils = new PageUtils(swWithdrawAddressList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swWithdrawAddress:add")
    String add() {
        return "get/swWithdrawAddress/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swWithdrawAddress:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwWithdrawAddressDO swWithdrawAddress = swWithdrawAddressService.get(tid);
        model.addAttribute("swWithdrawAddress", swWithdrawAddress);
        return "get/swWithdrawAddress/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swWithdrawAddress:add")
    public R save(SwWithdrawAddressDO swWithdrawAddress) {
        swWithdrawAddress.setCreateDate(new Date());
        swWithdrawAddress.setUpdateDate(new Date());
        swWithdrawAddress.setDelFlag(CommonStatic.NOTDELETE);
        if (swWithdrawAddressService.save(swWithdrawAddress) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swWithdrawAddress:edit")
    public R update(SwWithdrawAddressDO swWithdrawAddress) {
        swWithdrawAddress.setUpdateDate(new Date());
            swWithdrawAddressService.update(swWithdrawAddress);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swWithdrawAddress:remove")
    public R remove( String tid) {
        if (swWithdrawAddressService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swWithdrawAddress:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swWithdrawAddressService.batchRemove(tids);
        return R.ok();
    }

}
