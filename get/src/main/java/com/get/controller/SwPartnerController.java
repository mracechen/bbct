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
import com.get.domain.SwPartnerDO;
import com.get.service.SwPartnerService;

/**
 * 升币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:20:06
 */

@Controller
@RequestMapping("/manager/get/swPartner")
public class SwPartnerController {
    @Autowired
    private SwPartnerService swPartnerService;

    @GetMapping()
    @RequiresPermissions("get:swPartner:swPartner")
    public String SwPartner() {
        return "get/swPartner/swPartner";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPartner:swPartner")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwPartnerDO> swPartnerList = swPartnerService.list(query);
        int total = swPartnerService.count(query);
        PageUtils pageUtils = new PageUtils(swPartnerList, total);
        return pageUtils;
    }

    @ResponseBody
    @GetMapping("/all")
    public List<SwPartnerDO> all(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        return swPartnerService.list(params);
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPartner:add")
    String add() {
        return "get/swPartner/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPartner:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPartnerDO swPartner = swPartnerService.get(tid);
        model.addAttribute("swPartner", swPartner);
        return "get/swPartner/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPartner:add")
    public R save(SwPartnerDO swPartner) {
        swPartner.setTid(IDUtils.randomStr());
        swPartner.setCreateDate(new Date());
        swPartner.setUpdateDate(new Date());
        swPartner.setDelFlag(CommonStatic.NOTDELETE);
        if (swPartnerService.save(swPartner) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swPartner:edit")
    public R update(SwPartnerDO swPartner) {
        swPartner.setUpdateDate(new Date());
            swPartnerService.update(swPartner);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPartner:remove")
    public R remove( String tid) {
        if (swPartnerService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPartner:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPartnerService.batchRemove(tids);
        return R.ok();
    }

}
