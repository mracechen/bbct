package com.get.controller;

import com.common.utils.IDUtils;
import com.get.domain.SwRuleDetailDO;
import com.get.service.SwRuleDetailService;
import com.get.statuc.CommonStatic;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 推荐人奖励规则详情表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:46:50
 */

@Controller
@RequestMapping("/manager/get/swRuleDetail")
public class SwRuleDetailController {
    @Autowired
    private SwRuleDetailService swRuleDetailService;

    @GetMapping()
    @RequiresPermissions("get:swRuleDetail:swRuleDetail")
    public String SwRuleDetail() {
        return "get/swRuleDetail/swRuleDetail";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swRuleDetail:swRuleDetail")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwRuleDetailDO> swRuleDetailList = swRuleDetailService.list(query);
        int total = swRuleDetailService.count(query);
        PageUtils pageUtils = new PageUtils(swRuleDetailList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swRuleDetail:add")
    String add() {
        return "get/swRuleDetail/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swRuleDetail:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwRuleDetailDO swRuleDetail = swRuleDetailService.get(tid);
        model.addAttribute("swRuleDetail", swRuleDetail);
        return "get/swRuleDetail/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swRuleDetail:add")
    public R save(SwRuleDetailDO swRuleDetail) {
        swRuleDetail.setTid(IDUtils.randomStr());
        swRuleDetail.setCreateDate(new Date());
        swRuleDetail.setUpdateDate(new Date());
        swRuleDetail.setDelFlag(CommonStatic.NOTDELETE);
        if (swRuleDetailService.save(swRuleDetail) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swRuleDetail:edit")
    public R update(SwRuleDetailDO swRuleDetail) {
        swRuleDetail.setUpdateDate(new Date());
            swRuleDetailService.update(swRuleDetail);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swRuleDetail:remove")
    public R remove(String tid) {
        if (swRuleDetailService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swRuleDetail:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swRuleDetailService.batchRemove(tids);
        return R.ok();
    }

}
