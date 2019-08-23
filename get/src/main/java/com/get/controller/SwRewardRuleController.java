package com.get.controller;

import com.common.utils.IDUtils;
import com.get.domain.SwRewardRuleDO;
import com.get.service.SwRewardRuleService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 推荐人奖励规则表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:49:08
 */

@Controller
@RequestMapping("/manager/get/swRewardRule")
public class SwRewardRuleController {
    @Autowired
    private SwRewardRuleService swRewardRuleService;

    @GetMapping()
    @RequiresPermissions("get:swRewardRule:swRewardRule")
    public String SwRewardRule() {
        return "get/swRewardRule/swRewardRule";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swRewardRule:swRewardRule")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        //查询列表数据
        Query query = new Query(params);
        List<SwRewardRuleDO> swRewardRuleList = swRewardRuleService.list(query);
        int total = swRewardRuleService.count(query);
        PageUtils pageUtils = new PageUtils(swRewardRuleList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swRewardRule:add")
    String add() {
        return "get/swRewardRule/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swRewardRule:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwRewardRuleDO swRewardRule = swRewardRuleService.get(tid);
        model.addAttribute("swRewardRule", swRewardRule);
        return "get/swRewardRule/edit";
    }


    @ResponseBody
    @GetMapping("/queryAll")
    @RequiresPermissions("get:swRewardRule:swRewardRule")
    public List<SwRewardRuleDO> queryAll(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        return swRewardRuleService.list(params);
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swRewardRule:add")
    public R save(SwRewardRuleDO swRewardRule) {
        String code = null;
        //生成一个不重复的code
        do{
            String randemStr = IDUtils.getRandemStr(6);
            Map<String,Object> params = new HashMap<>();
            params.put("code",randemStr);
            List<SwRewardRuleDO> list = swRewardRuleService.list(params);
            if(list == null || list.size() == 0){
                code = randemStr;
            }
        }while (code == null);
        swRewardRule.setTid(IDUtils.randomStr());
        swRewardRule.setCode(code);
        swRewardRule.setCreateDate(new Date());
        swRewardRule.setUpdateDate(new Date());
        swRewardRule.setDelFlag(CommonStatic.NOTDELETE);
        if (swRewardRuleService.save(swRewardRule) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swRewardRule:edit")
    public R update(SwRewardRuleDO swRewardRule) {
        swRewardRule.setUpdateDate(new Date());
            swRewardRuleService.update(swRewardRule);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swRewardRule:remove")
    public R remove(String tid) {
        if (swRewardRuleService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swRewardRule:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swRewardRuleService.batchRemove(tids);
        return R.ok();
    }

}
