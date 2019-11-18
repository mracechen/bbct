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
import com.get.domain.SwUserBasicDO;
import com.get.service.SwUserBasicService;

/**
 * 用户基本表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:39:28
 */

@Controller
@RequestMapping("/manager/get/swUserBasic")
public class SwUserBasicController {
    @Autowired
    private SwUserBasicService swUserBasicService;

    @GetMapping()
    @RequiresPermissions("get:swUserBasic:swUserBasic")
    public String SwUserBasic() {
        return "get/swUserBasic/swUserBasic";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swUserBasic:swUserBasic")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        if(params.get("createStartDate") != null && StringUtils.isNotBlank(params.get("createStartDate").toString())){
            String createStartDate = params.get("createStartDate").toString();

            params.put("createStartDate",createStartDate + " 00:00:00");
        }
        if(params.get("createEndDate") != null && StringUtils.isNotBlank(params.get("createEndDate").toString())){
            String createEndDate = params.get("createEndDate").toString();
            params.put("createEndDate",createEndDate + " 23:59:59");
        }
        Query query = new Query(params);
        List<SwUserBasicDO> swUserBasicList = swUserBasicService.list(query);
        int total = swUserBasicService.count(query);
        PageUtils pageUtils = new PageUtils(swUserBasicList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swUserBasic:add")
    String add() {
        return "get/swUserBasic/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swUserBasic:edit")
    String edit(@PathVariable("tid") Integer tid, Model model) {
            SwUserBasicDO swUserBasic = swUserBasicService.get(tid);
        model.addAttribute("swUserBasic", swUserBasic);
        return "get/swUserBasic/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swUserBasic:add")
    public R save(SwUserBasicDO swUserBasic) {
        swUserBasic.setCreateDate(new Date());
        swUserBasic.setUpdateDate(new Date());
        swUserBasic.setDelFlag(CommonStatic.NOTDELETE);
        if (swUserBasicService.save(swUserBasic) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swUserBasic:edit")
    public R update(SwUserBasicDO swUserBasic) {
        try {
            swUserBasic.setUpdateDate(new Date());
            int i = swUserBasicService.adminUpdate(swUserBasic);
            if(i > 0){
                return R.ok();
            }else{
                return R.error("该用户不满足条件，修改失败");
            }
        }catch (Exception e){
            return R.error("操作拒绝");
        }
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swUserBasic:remove")
    public R remove( Integer tid) {
        if (swUserBasicService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swUserBasic:batchRemove")
    public R remove(@RequestParam("ids[]") Integer[]tids) {
            swUserBasicService.batchRemove(tids);
        return R.ok();
    }

}
