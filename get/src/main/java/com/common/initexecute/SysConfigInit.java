package com.common.initexecute;

import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;
import com.system.sysconfig.service.ConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 全局配置添加到缓存的方法
 *
 * @author sunYaLong
 * @data 2018/9/5
 */
@Component
public class SysConfigInit {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private ConfigService configService;

    public void execute() {
        logger.info("初始化全局配置值到缓存");
        List<ConfigDO> list = configService.list(null);
        for (ConfigDO configDO : list) {
            redisUtils.set(configDO.getFieldName(), configDO.getFieldValue());
        }
        logger.info("初始化全局配置共: " + list.size() + "条");
    }
}
