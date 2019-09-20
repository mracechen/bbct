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
import com.get.domain.SwCurrentUserDO;
import com.get.service.SwCurrentUserService;

/**
 * 用户持有活币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:12:24
 */

@Controller
@RequestMapping("/manager/get/swCurrentUser")
public class SwCurrentUserController {
    @Autowired
    private SwCurrentUserService swCurrentUserService;

    @GetMapping()
    @RequiresPermissions("get:swCurrentUser:swCurrentUser")
    public String SwCurrentUser() {
        return "get/swCurrentUser/swCurrentUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swCurrentUser:swCurrentUser")
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
        List<SwCurrentUserDO> swCurrentUserList = swCurrentUserService.list(query);
        int total = swCurrentUserService.count(query);
        PageUtils pageUtils = new PageUtils(swCurrentUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swCurrentUser:add")
    String add() {
        return "get/swCurrentUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swCurrentUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwCurrentUserDO swCurrentUser = swCurrentUserService.get(tid);
        model.addAttribute("swCurrentUser", swCurrentUser);
        return "get/swCurrentUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swCurrentUser:add")
    public R save(SwCurrentUserDO swCurrentUser) {
        try {
            swCurrentUser.setCreateDate(new Date());
            swCurrentUser.setUpdateDate(new Date());
            swCurrentUser.setDelFlag(CommonStatic.NOTDELETE);
            if (swCurrentUserService.save(swCurrentUser) > 0) {
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
    @RequiresPermissions("get:swCurrentUser:edit")
    public R update(SwCurrentUserDO swCurrentUser) {
        swCurrentUser.setUpdateDate(new Date());
            swCurrentUserService.update(swCurrentUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swCurrentUser:remove")
    public R remove( String tid) {
        if (swCurrentUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swCurrentUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swCurrentUserService.batchRemove(tids);
        return R.ok();
    }

}
