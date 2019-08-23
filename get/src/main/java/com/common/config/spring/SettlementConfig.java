package com.common.config.spring;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 结算时配置
 *
 * @author sunYaLong
 * @data 2018/10/27
 */
@Component
@ConfigurationProperties(prefix = "configs.settlement")
@Getter
@Setter
public class SettlementConfig {
    String interceptInterface;
    String adminMobile;

}
