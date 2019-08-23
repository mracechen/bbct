package com.system.base.controller;

import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import com.system.base.domain.SecurityManagerDO;
import com.system.base.service.SecurityManagerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-16 18:51:21
 */

@Controller
@RequestMapping("${backPathPrefix}/base/securityManager")
public class SecurityManagerController {
    @Autowired
    private SecurityManagerService securityManagerService;

    @GetMapping()
    @RequiresPermissions("base:securityManager:securityManager")
    public String StringSecurityManager() {
        return "base/securityManager/securityManager";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("base:securityManager:securityManager")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<SecurityManagerDO> securityManagerList = securityManagerService.list(query);
        int total = securityManagerService.count(query);
        PageUtils pageUtils = new PageUtils(securityManagerList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("base:securityManager:add")
    String add() {
        return "base/securityManager/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("base:securityManager:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
        SecurityManagerDO securityManager = securityManagerService.get(tid);
        model.addAttribute("securityManager", securityManager);
        return "base/securityManager/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("base:securityManager:add")
    public R save(SecurityManagerDO securityManager) throws IOException {
        if (securityManagerService.save(securityManager) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("base:securityManager:edit")
    public R update(SecurityManagerDO securityManager) {
        securityManagerService.update(securityManager);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("base:securityManager:remove")
    public R remove(String tid) {
        if (securityManagerService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("base:securityManager:batchRemove")
    public R remove(@RequestParam("ids[]") String[] tids) {
        securityManagerService.batchRemove(tids);
        return R.ok();
    }

}
