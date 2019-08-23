package com.common.basicskills.controller;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.domain.PageDO;
import com.common.basicskills.service.LogService;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RequestMapping("${backPathPrefix}/common/log")
@Controller
public class LogController {
    @Autowired
    LogService logService;
    String prefix = "common/log";

    @GetMapping()
    String log() {
        return prefix + "/log";
    }

    @ResponseBody
    @GetMapping("/list")
    PageDO<LogDO> list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        PageDO<LogDO> page = logService.queryList(query);
        return page;
    }

    @ResponseBody
    @PostMapping("/remove")
    R remove(Long id) {
        if (logService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @ResponseBody
    @PostMapping("/batchRemove")
    R batchRemove(@RequestParam("ids[]") Long[] ids) {
        int r = logService.batchRemove(ids);
        if (r > 0) {
            return R.ok();
        }
        return R.error();
    }
}
