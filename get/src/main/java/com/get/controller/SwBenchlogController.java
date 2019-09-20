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
import com.get.domain.SwBenchlogDO;
import com.get.service.SwBenchlogService;

/**
 * 对标记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:48:52
 */

@Controller
@RequestMapping("/manager/get/swBenchlog")
public class SwBenchlogController {
    @Autowired
    private SwBenchlogService swBenchlogService;

    @GetMapping()
    @RequiresPermissions("get:swBenchlog:swBenchlog")
    public String SwBenchlog() {
        return "get/swBenchlog/swBenchlog";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swBenchlog:swBenchlog")
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
        List<SwBenchlogDO> swBenchlogList = swBenchlogService.list(query);
        int total = swBenchlogService.count(query);
        PageUtils pageUtils = new PageUtils(swBenchlogList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swBenchlog:add")
    String add() {
        return "get/swBenchlog/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swBenchlog:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwBenchlogDO swBenchlog = swBenchlogService.get(tid);
        model.addAttribute("swBenchlog", swBenchlog);
        return "get/swBenchlog/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swBenchlog:add")
    public R save(SwBenchlogDO swBenchlog) {
        try {
            swBenchlog.setCreateDate(new Date());
            swBenchlog.setUpdateDate(new Date());
            swBenchlog.setDelFlag(CommonStatic.NOTDELETE);
            if (swBenchlogService.save(swBenchlog) > 0) {
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
    @RequiresPermissions("get:swBenchlog:edit")
    public R update(SwBenchlogDO swBenchlog) {
        swBenchlog.setUpdateDate(new Date());
            swBenchlogService.update(swBenchlog);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swBenchlog:remove")
    public R remove( String tid) {
        if (swBenchlogService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swBenchlog:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swBenchlogService.batchRemove(tids);
        return R.ok();
    }

}
