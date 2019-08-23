package com.system.base.controller;

import com.common.basicskills.controller.BaseController;
import com.common.basicskills.domain.Tree;
import com.common.config.Constant;
import com.get.statuc.R;
import com.system.base.domain.DeptDO;
import com.system.base.service.DeptService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理
 *
 * @author chglee
 * @date 2017-09-27 14:40:36
 */

@Controller
@RequestMapping("${backPathPrefix}/system/sysDept")
public class DeptController extends BaseController {
    private String prefix = "system/dept";
    @Autowired
    private DeptService sysDeptService;

    @GetMapping()
    @RequiresPermissions("system:sysDept:sysDept")
    String dept() {
        return prefix + "/dept";
    }

    @ApiOperation(value = "获取部门列表", notes = "")
    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("system:sysDept:sysDept")
    public List<DeptDO> list() {
        Map<String, Object> query = new HashMap<>(16);
        List<DeptDO> sysDeptList = sysDeptService.list(query);
        return sysDeptList;
    }

    @GetMapping("/add/{pId}")
    @RequiresPermissions("system:sysDept:add")
    String add(@PathVariable("pId") Long pId, Model model) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "总部门");
        } else {
            model.addAttribute("pName", sysDeptService.get(pId).getName());
        }
        return prefix + "/add";
    }

    @GetMapping("/edit/{deptId}")
    @RequiresPermissions("system:sysDept:edit")
    String edit(@PathVariable("deptId") Long deptId, Model model) {
        DeptDO sysDept = sysDeptService.get(deptId);
        model.addAttribute("sysDept", sysDept);
        if (Constant.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
            model.addAttribute("parentDeptName", "无");
        } else {
            DeptDO parDept = sysDeptService.get(sysDept.getParentId());
            model.addAttribute("parentDeptName", parDept.getName());
        }
        return prefix + "/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("system:sysDept:add")
    public R save(DeptDO sysDept) {
        // 查询上级部门ID相同的部门 的所有排序号
        List<Integer> sortIds = sysDeptService.findSortIdByParentId(sysDept.getParentId());
        Integer sort = sysDept.getOrderNum();
        if(sortIds.contains(sort)){
            return R.error("排序号不可重复,已经存在的排序号有:"+sortIds.toString());
        }
        if (sysDeptService.save(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("system:sysDept:edit")
    public R update(DeptDO sysDept) {
        if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
            return R.error(1, "演示系统不允许修改,完整体验请部署程序");
        }
        if (sysDeptService.update(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("system:sysDept:remove")
    public R remove(Long deptId) {
        if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
            return R.error(1, "演示系统不允许修改,完整体验请部署程序");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("parentId", deptId);
        if (sysDeptService.count(map) > 0) {
            return R.error(1, "包含下级部门,不允许修改");
        }
        if (sysDeptService.checkDeptHasUser(deptId)) {
            if (sysDeptService.remove(deptId) > 0) {
                return R.ok();
            }
        } else {
            return R.error(1, "部门包含用户,不允许修改");
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("system:sysDept:batchRemove")
    public R remove(@RequestParam("ids[]") Long[] deptIds) {
        if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
            return R.error(1, "演示系统不允许修改,完整体验请部署程序");
        }
        sysDeptService.batchRemove(deptIds);
        return R.ok();
    }

    @GetMapping("/tree")
    @ResponseBody
    public Tree<DeptDO> tree() {
        Tree<DeptDO> tree = new Tree<DeptDO>();
        tree = sysDeptService.getTree();
        return tree;
    }

    @GetMapping("/treeView")
    String treeView() {
        return prefix + "/deptTree";
    }

}
