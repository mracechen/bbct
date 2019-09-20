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
import com.get.domain.SwPrincipalUserDO;
import com.get.service.SwPrincipalUserService;

/**
 * 用户持有固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:28:52
 */

@Controller
@RequestMapping("/manager/get/swPrincipalUser")
public class SwPrincipalUserController {
    @Autowired
    private SwPrincipalUserService swPrincipalUserService;

    @GetMapping()
    @RequiresPermissions("get:swPrincipalUser:swPrincipalUser")
    public String SwPrincipalUser() {
        return "get/swPrincipalUser/swPrincipalUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPrincipalUser:swPrincipalUser")
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
        List<SwPrincipalUserDO> swPrincipalUserList = swPrincipalUserService.list(query);
        int total = swPrincipalUserService.count(query);
        PageUtils pageUtils = new PageUtils(swPrincipalUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPrincipalUser:add")
    String add() {
        return "get/swPrincipalUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPrincipalUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPrincipalUserDO swPrincipalUser = swPrincipalUserService.get(tid);
        model.addAttribute("swPrincipalUser", swPrincipalUser);
        return "get/swPrincipalUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPrincipalUser:add")
    public R save(SwPrincipalUserDO swPrincipalUser) {
        try {
            swPrincipalUser.setCreateDate(new Date());
            swPrincipalUser.setUpdateDate(new Date());
            swPrincipalUser.setDelFlag(CommonStatic.NOTDELETE);
            if (swPrincipalUserService.save(swPrincipalUser) > 0) {
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
    @RequiresPermissions("get:swPrincipalUser:edit")
    public R update(SwPrincipalUserDO swPrincipalUser) {
        swPrincipalUser.setUpdateDate(new Date());
            swPrincipalUserService.update(swPrincipalUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPrincipalUser:remove")
    public R remove( String tid) {
        if (swPrincipalUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPrincipalUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPrincipalUserService.batchRemove(tids);
        return R.ok();
    }

}
