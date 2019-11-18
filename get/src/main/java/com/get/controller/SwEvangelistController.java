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
import com.get.domain.SwEvangelistDO;
import com.get.service.SwEvangelistService;

/**
 * 优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:14:25
 */

@Controller
@RequestMapping("/manager/get/swEvangelist")
public class SwEvangelistController {
    @Autowired
    private SwEvangelistService swEvangelistService;

    @GetMapping()
    @RequiresPermissions("get:swEvangelist:swEvangelist")
    public String SwEvangelist() {
        return "get/swEvangelist/swEvangelist";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swEvangelist:swEvangelist")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwEvangelistDO> swEvangelistList = swEvangelistService.list(query);
        int total = swEvangelistService.count(query);
        PageUtils pageUtils = new PageUtils(swEvangelistList, total);
        return pageUtils;
    }

    @ResponseBody
    @GetMapping("/all")
    public List<SwEvangelistDO> all(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        return swEvangelistService.list(params);
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swEvangelist:add")
    String add() {
        return "get/swEvangelist/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swEvangelist:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwEvangelistDO swEvangelist = swEvangelistService.get(tid);
        model.addAttribute("swEvangelist", swEvangelist);
        return "get/swEvangelist/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swEvangelist:add")
    public R save(SwEvangelistDO swEvangelist) {
        swEvangelist.setTid(IDUtils.randomStr());
        swEvangelist.setCreateDate(new Date());
        swEvangelist.setUpdateDate(new Date());
        swEvangelist.setDelFlag(CommonStatic.NOTDELETE);
        if (swEvangelistService.save(swEvangelist) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swEvangelist:edit")
    public R update(SwEvangelistDO swEvangelist) {
        swEvangelist.setUpdateDate(new Date());
            swEvangelistService.update(swEvangelist);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelist:remove")
    public R remove( String tid) {
        if (swEvangelistService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelist:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swEvangelistService.batchRemove(tids);
        return R.ok();
    }

}
