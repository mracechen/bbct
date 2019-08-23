package com.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 百度翻译接口的基本配置
 *
 * @author sunYaLong
 * @data 2018/9/7
 */
@Component
@ConfigurationProperties(prefix = "configs.translate")
public class TranslateConfig {

    private String url;

    private String appid;

    private String secretKey;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }
}
