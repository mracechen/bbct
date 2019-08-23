package com.common.initexecute;

import com.common.filter.SecurityFilter;
import com.common.utils.MessageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 执行非spring 管理的类需要初始化的配置
 *
 * @author sunYaLong
 * @data 2018/9/5
 */
@Component
public class ApplicationConfigInit {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public void execute() {
        logger.info("执行非spring 管理的类需要初始化的配置");
        // 执行发送短信配置
        MessageUtils.setConfig();
        SecurityFilter.setConfig();
    }
}
