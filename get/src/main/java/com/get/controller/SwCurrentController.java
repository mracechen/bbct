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
import com.get.domain.SwCurrentDO;
import com.get.service.SwCurrentService;

/**
 * 活币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:07:19
 */

@Controller
@RequestMapping("/manager/get/swCurrent")
public class SwCurrentController {
    @Autowired
    private SwCurrentService swCurrentService;

    @GetMapping()
    @RequiresPermissions("get:swCurrent:swCurrent")
    public String SwCurrent() {
        return "get/swCurrent/swCurrent";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swCurrent:swCurrent")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwCurrentDO> swCurrentList = swCurrentService.list(query);
        int total = swCurrentService.count(query);
        PageUtils pageUtils = new PageUtils(swCurrentList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swCurrent:add")
    String add() {
        return "get/swCurrent/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swCurrent:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwCurrentDO swCurrent = swCurrentService.get(tid);
        model.addAttribute("swCurrent", swCurrent);
        return "get/swCurrent/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swCurrent:add")
    public R save(SwCurrentDO swCurrent) {
        swCurrent.setTid(IDUtils.randomStr());
        swCurrent.setCreateDate(new Date());
        swCurrent.setUpdateDate(new Date());
        swCurrent.setDelFlag(CommonStatic.NOTDELETE);
        if (swCurrentService.save(swCurrent) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swCurrent:edit")
    public R update(SwCurrentDO swCurrent) {
        swCurrent.setUpdateDate(new Date());
            swCurrentService.update(swCurrent);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swCurrent:remove")
    public R remove( String tid) {
        if (swCurrentService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swCurrent:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swCurrentService.batchRemove(tids);
        return R.ok();
    }

}
