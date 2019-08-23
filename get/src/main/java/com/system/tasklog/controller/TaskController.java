package com.system.tasklog.controller;

import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import com.system.tasklog.domain.TaskDO;
import com.system.tasklog.service.TaskService;

/**
 * 系统定时任务, 废弃sys_task表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-11-24 13:45:42
 */

@Controller
@RequestMapping("${backPathPrefix}/tasklog/task")
public class TaskController {
    @Autowired
    private TaskService taskService;

    @GetMapping()
    @RequiresPermissions("tasklog:task:task")
    public String StringTask() {
        return "tasklog/task/task";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("tasklog:task:task")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<TaskDO> taskList = taskService.list(query);
        int total = taskService.count(query);
        PageUtils pageUtils = new PageUtils(taskList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("tasklog:task:add")
    String add() {
        return "tasklog/task/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("tasklog:task:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            TaskDO task = taskService.get(tid);
        model.addAttribute("task", task);
        return "tasklog/task/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("tasklog:task:add")
    public R save(TaskDO task) {
        if (taskService.save(task) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tasklog:task:edit")
    public R update(TaskDO task) {
            taskService.update(task);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("tasklog:task:remove")
    public R remove( String tid) {
        if (taskService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("tasklog:task:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            taskService.batchRemove(tids);
        return R.ok();
    }

}
