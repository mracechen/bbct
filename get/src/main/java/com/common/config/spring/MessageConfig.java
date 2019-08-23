package com.common.config.spring;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 发送短信配置信息
 *
 * @author sunYaLong
 * @data 2018/10/27
 */
@Component
@ConfigurationProperties(prefix = "configs.msg")
@Getter
@Setter
public class MessageConfig {

    boolean checkCheckCode;
    String apikey;
    String URI_SEND_SMS;
    String URI_GET_USER_INFO;
}
