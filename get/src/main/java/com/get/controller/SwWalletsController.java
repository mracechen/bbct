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

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwWalletsDO;
import com.get.service.SwWalletsService;

/**
 * 钱包表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:41:45
 */

@Controller
@RequestMapping("/manager/get/swWallets")
public class SwWalletsController {
    @Autowired
    private SwWalletsService swWalletsService;

    @GetMapping()
    @RequiresPermissions("get:swWallets:swWallets")
    public String SwWallets() {
        return "get/swWallets/swWallets";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swWallets:swWallets")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwWalletsDO> swWalletsList = swWalletsService.list(query);
        int total = swWalletsService.count(query);
        PageUtils pageUtils = new PageUtils(swWalletsList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swWallets:add")
    String add() {
        return "get/swWallets/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swWallets:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwWalletsDO swWallets = swWalletsService.get(tid);
        model.addAttribute("swWallets", swWallets);
        return "get/swWallets/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swWallets:add")
    public R save(SwWalletsDO swWallets) {
        swWallets.setCreateDate(new Date());
        swWallets.setUpdateDate(new Date());
        swWallets.setDelFlag(CommonStatic.NOTDELETE);
        if (swWalletsService.save(swWallets) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swWallets:edit")
    public R update(SwWalletsDO swWallets) {
        swWallets.setUpdateDate(new Date());
        SwWalletsDO swWalletsDO = swWalletsService.get(swWallets.getTid());
        if(swWallets.getCurrency() != null){
            BigDecimal actualChangeCurrency = swWallets.getCurrency().subtract(swWalletsDO.getCurrency());
            swWallets.setCurrency(actualChangeCurrency);
        }
        if(swWallets.getFrozenAmount() != null){
            BigDecimal actualChangeFrozenAmount = swWallets.getFrozenAmount().subtract(swWalletsDO.getFrozenAmount());
            swWallets.setFrozenAmount(actualChangeFrozenAmount);
        }
        swWalletsService.update(swWallets);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swWallets:remove")
    public R remove( String tid) {
        if (swWalletsService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swWallets:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swWalletsService.batchRemove(tids);
        return R.ok();
    }

}
