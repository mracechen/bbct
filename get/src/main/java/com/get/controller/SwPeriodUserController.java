package com.get.controller;

import com.common.utils.StringUtils;
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
import com.get.domain.SwPeriodUserDO;
import com.get.service.SwPeriodUserService;

/**
 * 用户持有定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:25:02
 */

@Controller
@RequestMapping("/manager/get/swPeriodUser")
public class SwPeriodUserController {
    @Autowired
    private SwPeriodUserService swPeriodUserService;

    @GetMapping()
    @RequiresPermissions("get:swPeriodUser:swPeriodUser")
    public String SwPeriodUser() {
        return "get/swPeriodUser/swPeriodUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPeriodUser:swPeriodUser")
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
        List<SwPeriodUserDO> swPeriodUserList = swPeriodUserService.list(query);
        int total = swPeriodUserService.count(query);
        PageUtils pageUtils = new PageUtils(swPeriodUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPeriodUser:add")
    String add() {
        return "get/swPeriodUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPeriodUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPeriodUserDO swPeriodUser = swPeriodUserService.get(tid);
        model.addAttribute("swPeriodUser", swPeriodUser);
        return "get/swPeriodUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPeriodUser:add")
    public R save(SwPeriodUserDO swPeriodUser) {
        try {
            swPeriodUser.setCreateDate(new Date());
            swPeriodUser.setUpdateDate(new Date());
            swPeriodUser.setDelFlag(CommonStatic.NOTDELETE);
            if (swPeriodUserService.save(swPeriodUser) > 0) {
                return R.ok();
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swPeriodUser:edit")
    public R update(SwPeriodUserDO swPeriodUser) {
        swPeriodUser.setUpdateDate(new Date());
            swPeriodUserService.update(swPeriodUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPeriodUser:remove")
    public R remove( String tid) {
        if (swPeriodUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPeriodUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPeriodUserService.batchRemove(tids);
        return R.ok();
    }

}
