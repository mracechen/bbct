package com.get.controller;

import com.get.domain.SwFiatCoinDO;
import com.get.service.SwFiatCoinService;
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
 * 
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:54:01
 */

@Controller
@RequestMapping("/manager/get/swFiatCoin")
public class SwFiatCoinController {
    @Autowired
    private SwFiatCoinService swFiatCoinService;

    @GetMapping()
    @RequiresPermissions("get:swFiatCoin:swFiatCoin")
    public String SwFiatCoin() {
        return "get/swFiatCoin/swFiatCoin";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swFiatCoin:swFiatCoin")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwFiatCoinDO> swFiatCoinList = swFiatCoinService.list(query);
        int total = swFiatCoinService.count(query);
        PageUtils pageUtils = new PageUtils(swFiatCoinList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swFiatCoin:add")
    String add() {
        return "get/swFiatCoin/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("get:swFiatCoin:edit")
    String edit(@PathVariable("id") Integer id, Model model) {
            SwFiatCoinDO swFiatCoin = swFiatCoinService.get(id);
        model.addAttribute("swFiatCoin", swFiatCoin);
        return "get/swFiatCoin/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swFiatCoin:add")
    public R save(SwFiatCoinDO swFiatCoin) {
        swFiatCoin.setCreateTime(new Date());
        swFiatCoin.setUpdateTime(new Date());
        if (swFiatCoinService.save(swFiatCoin) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swFiatCoin:edit")
    public R update(SwFiatCoinDO swFiatCoin) {
        swFiatCoin.setUpdateTime(new Date());
            swFiatCoinService.update(swFiatCoin);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swFiatCoin:remove")
    public R remove(Integer id) {
        if (swFiatCoinService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swFiatCoin:batchRemove")
    public R remove(@RequestParam("ids[]") Integer[]ids) {
            swFiatCoinService.batchRemove(ids);
        return R.ok();
    }

}
