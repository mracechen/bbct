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
import com.get.domain.SwEvangelistUserDO;
import com.get.service.SwEvangelistUserService;

/**
 * 用户持有优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:18:09
 */

@Controller
@RequestMapping("/manager/get/swEvangelistUser")
public class SwEvangelistUserController {
    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

    @GetMapping()
    @RequiresPermissions("get:swEvangelistUser:swEvangelistUser")
    public String SwEvangelistUser() {
        return "get/swEvangelistUser/swEvangelistUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swEvangelistUser:swEvangelistUser")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwEvangelistUserDO> swEvangelistUserList = swEvangelistUserService.list(query);
        int total = swEvangelistUserService.count(query);
        PageUtils pageUtils = new PageUtils(swEvangelistUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swEvangelistUser:add")
    String add() {
        return "get/swEvangelistUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swEvangelistUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwEvangelistUserDO swEvangelistUser = swEvangelistUserService.get(tid);
        model.addAttribute("swEvangelistUser", swEvangelistUser);
        return "get/swEvangelistUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swEvangelistUser:add")
    public R save(SwEvangelistUserDO swEvangelistUser) {
        try {
            swEvangelistUser.setCreateDate(new Date());
            swEvangelistUser.setUpdateDate(new Date());
            swEvangelistUser.setDelFlag(CommonStatic.NOTDELETE);
            if (swEvangelistUserService.save(swEvangelistUser) > 0) {
                return R.ok();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swEvangelistUser:edit")
    public R update(SwEvangelistUserDO swEvangelistUser) {
        swEvangelistUser.setUpdateDate(new Date());
            swEvangelistUserService.update(swEvangelistUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistUser:remove")
    public R remove( String tid) {
        if (swEvangelistUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swEvangelistUserService.batchRemove(tids);
        return R.ok();
    }

}
