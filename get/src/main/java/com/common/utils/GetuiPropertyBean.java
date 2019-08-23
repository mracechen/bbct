package com.common.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
@ConfigurationProperties(prefix = "configs.push.getui")
public class GetuiPropertyBean {

    /** 静态获取配置*/
    public static String s_appId;

    public static String s_appKey;

    public static String s_masterSecret;

    public static String s_host;

    /** 非静态获取配置*/
    private String appId;

    private String appKey;

    private String masterSecret;

    private String host;

    @PostConstruct
    public void initconf() {
        s_appId = appId;
        s_appKey = appKey;
        s_masterSecret = masterSecret;
        s_host = host;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getMasterSecret() {
        return masterSecret;
    }

    public void setMasterSecret(String masterSecret) {
        this.masterSecret = masterSecret;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }
}