package com.system.sysconfig.configbean;


import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 系统基本配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class SettlementCommonConfig {



    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "SettlementCommonConfig-";

    /**
     * 后台系统全名
     */
    private ConfigDO BackWebsiteFullName = null;

    public ConfigDO getBackWebsiteFullName() {
        if (BackWebsiteFullName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "BackWebsiteFullName");
            BackWebsiteFullName = new ConfigDO("BackWebsiteFullName", cacheValue);
        }
        return BackWebsiteFullName;
    }

    /**
     * 后台系统小名
     */
    private ConfigDO BackWebsiteSubName = null;

    public ConfigDO getBackWebsiteSubName() {
        if (BackWebsiteSubName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "BackWebsiteSubName");
            BackWebsiteSubName = new ConfigDO("BackWebsiteSubName", cacheValue);
        }
        return BackWebsiteSubName;
    }

    /**
     * 后台系统全名
     */
    private ConfigDO WebsiteURL = null;

    public ConfigDO getWebsiteURL() {
        if (WebsiteURL == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "WebsiteURL");
            WebsiteURL = new ConfigDO("WebsiteURL", cacheValue);
        }
        return WebsiteURL;
    }


    /**
     * 管理员登录开启手机号码验证
     */
    private ConfigDO IsEnableAdminLoginMobileCheck = null;

    public ConfigDO getIsEnableAdminLoginMobileCheck() {
        if (IsEnableAdminLoginMobileCheck == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IsEnableAdminLoginMobileCheck");
            IsEnableAdminLoginMobileCheck = new ConfigDO("IsEnableAdminLoginMobileCheck", cacheValue);
        }
        return IsEnableAdminLoginMobileCheck;
    }

    /**
     * 网站LOGO
     */
    private ConfigDO WebsiteLogo = null;

    public ConfigDO getWebsiteLogo() {
        if (WebsiteLogo == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "WebsiteLogo");
            WebsiteLogo = new ConfigDO("WebsiteLogo", cacheValue);
        }
        return WebsiteLogo;
    }

    /**
     * 网站LOGO
     */
    private ConfigDO SystemAccountId = null;

    public ConfigDO getSystemAccountId() {
        if (SystemAccountId == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SystemAccountId");
            SystemAccountId = new ConfigDO("SystemAccountId", cacheValue);
        }
        return SystemAccountId;
    }


    /**
     * 是否开启币库功能
     * */
    private ConfigDO OpenCoinRepo = null;

    public ConfigDO getOpenCoinRepo() {
        if (OpenCoinRepo == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "OpenCoinRepo");
            OpenCoinRepo = new ConfigDO("OpenCoinRepo", cacheValue);
        }
        return OpenCoinRepo;
    }

    /**
     * 是否拦截所有请求  1-拦截  0-不拦截
     * */
    private ConfigDO FilterInterface = null;

    public ConfigDO getFilterInterface() {
        if (FilterInterface == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "FilterInterface");
            FilterInterface = new ConfigDO("FilterInterface", cacheValue);
        }
        return FilterInterface;
    }
}
