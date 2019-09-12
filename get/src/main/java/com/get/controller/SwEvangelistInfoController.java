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
import com.get.domain.SwEvangelistInfoDO;
import com.get.service.SwEvangelistInfoService;

/**
 * 布道者资料申请表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-26 20:24:44
 */

@Controller
@RequestMapping("/manager/get/swEvangelistInfo")
public class SwEvangelistInfoController {
    @Autowired
    private SwEvangelistInfoService swEvangelistInfoService;

    @GetMapping()
    @RequiresPermissions("get:swEvangelistInfo:swEvangelistInfo")
    public String SwEvangelistInfo() {
        return "get/swEvangelistInfo/swEvangelistInfo";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swEvangelistInfo:swEvangelistInfo")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwEvangelistInfoDO> swEvangelistInfoList = swEvangelistInfoService.list(query);
        int total = swEvangelistInfoService.count(query);
        PageUtils pageUtils = new PageUtils(swEvangelistInfoList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swEvangelistInfo:add")
    String add() {
        return "get/swEvangelistInfo/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swEvangelistInfo:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwEvangelistInfoDO swEvangelistInfo = swEvangelistInfoService.get(tid);
        model.addAttribute("swEvangelistInfo", swEvangelistInfo);
        return "get/swEvangelistInfo/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swEvangelistInfo:add")
    public R save(SwEvangelistInfoDO swEvangelistInfo) {
        swEvangelistInfo.setCreateDate(new Date());
        swEvangelistInfo.setUpdateDate(new Date());
        swEvangelistInfo.setDelFlag(CommonStatic.NOTDELETE);
        if (swEvangelistInfoService.save(swEvangelistInfo) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swEvangelistInfo:edit")
    public R update(SwEvangelistInfoDO swEvangelistInfo) {
        try {
            swEvangelistInfo.setUpdateDate(new Date());
            String check = swEvangelistInfoService.check(swEvangelistInfo);
            if(StringUtils.isNotBlank(check)){
                return R.error(check);
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error("审核失败，系统异常！");
        }
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistInfo:remove")
    public R remove( String tid) {
        if (swEvangelistInfoService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistInfo:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swEvangelistInfoService.batchRemove(tids);
        return R.ok();
    }

}
