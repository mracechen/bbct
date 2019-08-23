package com.common.utils;

import com.common.utils.backup.service.MysqlBackupService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author
 */
@Controller
@RequestMapping(value = "${backPathPrefix}/common/settlementTest")
public class SettlementTest {

    @Autowired
    private MysqlBackupService mysqlBackupService;

    @Value("${configs.settlement.sqlFileName}")
    private String sqlFileName;

    @GetMapping()
    @RequiresPermissions("common:settlementTest:settlementTest")
    String SettlementTest() {
        return "common/settlementTest/test";
    }

    @ResponseBody
    @GetMapping(value = "test")
    public Object test(Date startTime, Date endTime) {
        try {
            String endBt = DateUtils.dateFormat(DateUtils.dateAddDays(endTime, 0), DateUtils.DATE_PATTERN_ONE);
            int index = 0;
            while (true) {
                String startBt = DateUtils.dateFormat(DateUtils.dateAddDays(startTime, index), DateUtils.DATE_PATTERN_ONE);
                if (Integer.parseInt(startBt) > Integer.parseInt(endBt)) {
                    break;
                }
                index++;
            }
        } catch (Exception e) {
            return Result.error("结算失败");
        }
        return Result.ok();
    }

    @ResponseBody
    @GetMapping(value = "dbRecover")
    public Object dbRecover() {
        if (StringUtils.isBlank(sqlFileName)) {
            return Result.error("测试数据库SQL文件名没有配置！");
        }
        mysqlBackupService.dbRecover(sqlFileName);
        return Result.ok();
    }
}
