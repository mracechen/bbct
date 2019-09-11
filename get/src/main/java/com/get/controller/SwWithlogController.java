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
import com.get.domain.SwWithlogDO;
import com.get.service.SwWithlogService;

/**
 * 提币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */

@Controller
@RequestMapping("/manager/get/swWithlog")
public class SwWithlogController {
    @Autowired
    private SwWithlogService swWithlogService;

    @GetMapping()
    @RequiresPermissions("get:swWithlog:swWithlog")
    public String SwWithlog() {
        return "get/swWithlog/swWithlog";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swWithlog:swWithlog")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwWithlogDO> swWithlogList = swWithlogService.list(query);
        int total = swWithlogService.count(query);
        PageUtils pageUtils = new PageUtils(swWithlogList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swWithlog:add")
    String add() {
        return "get/swWithlog/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swWithlog:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwWithlogDO swWithlog = swWithlogService.get(tid);
        model.addAttribute("swWithlog", swWithlog);
        return "get/swWithlog/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swWithlog:add")
    public R save(SwWithlogDO swWithlog) {
        swWithlog.setCreateDate(new Date());
        swWithlog.setUpdateDate(new Date());
        swWithlog.setDelFlag(CommonStatic.NOTDELETE);
        if (swWithlogService.save(swWithlog) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swWithlog:edit")
    public R update(SwWithlogDO swWithlog) {
        try {
            swWithlog.setUpdateDate(new Date());
            swWithlogService.check(swWithlog);
        }catch (Exception e){
            e.printStackTrace();
        }
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swWithlog:remove")
    public R remove( String tid) {
        if (swWithlogService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swWithlog:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swWithlogService.batchRemove(tids);
        return R.ok();
    }

}
