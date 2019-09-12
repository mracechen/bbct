package com.get.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
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
     * 批量审核
     */
    @ResponseBody
    @RequestMapping("/batchAuth")
    @RequiresPermissions("get:swWithlog:edit")
    public R batchAuth(@RequestParam("ids") String ids,Integer status){
        JSONArray jsonArray = JSON.parseArray(ids);
        List<SwWithlogDO> byIds = swWithlogService.getByIds(jsonArray.toJavaList(String.class));
        for(SwWithlogDO withLogDO:byIds){
            if(!withLogDO.getEx2().equals(CommonStatic.CHECK_WAITING)){
                return R.error("选择的记录中存在无法审核的数据");
            }
        }
        new Thread(() -> {
            System.out.println("进入另一个线程！！！！！！！");
            for(SwWithlogDO withLogDO:byIds){
                try {
                    if(status == 1){
                        withLogDO.setEx2("1");
                    }else{
                        withLogDO.setEx2("2");
                    }
                    swWithlogService.check(withLogDO);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        return R.ok();
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
