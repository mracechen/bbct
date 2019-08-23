package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 系统公共配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class CommonConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "CommonConfig-";

    /**
     * 页脚配置-联系电话
     */
    private ConfigDO Mobile = null;
    /**
     * 页脚配置-Email
     */
    private ConfigDO Email = null;
    /**
     * 页脚配置-Address 公司地址
     */
    private ConfigDO Address = null;
    /**
     * 页脚配置-RRPublicImg  瑞银RR社区公众号二维码
     */
    private ConfigDO RRPublicImg = null;
    /**
     * 页脚配置-RRPublicImg  瑞银RR社区公众号二维码名称
     */
    private ConfigDO RRPublicImgName = null;
    /**
     * 页脚配置-ZYHPublicImg  集团公众号二维码
     */
    private ConfigDO ZYHPublicImg = null;
    /**
     * 页脚配置-ZYHPublicImg  集团公众号二维码名称
     */
    private ConfigDO ZYHPublicImgName = null;
    /**
     * LogoImg  官网LOGO
     */
    private ConfigDO LogoImg = null;
    /**
     * CompanyCopyright  公司官网版权
     */
    private ConfigDO CompanyCopyright = null;
    /**
     * 是否启用微信图片
     */
    private ConfigDO IsEnableWaiXinImg = null;
    /**
     * 是否启用微信图片
     */
    private ConfigDO Contact = null;

    public ConfigDO getMobile() {
        if (Mobile == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Mobile");
            Mobile = new ConfigDO("Mobile", cacheValue);
        }
        return Mobile;
    }

    public ConfigDO getEmail() {
        if (Email == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Email");
            Email = new ConfigDO("Email", cacheValue);
        }
        return Email;
    }

    public ConfigDO getAddress() {
        if (Address == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Address");
            Address = new ConfigDO("Address", cacheValue);
        }
        return Address;
    }

    public ConfigDO getRRPublicImg() {
        if (RRPublicImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "RRPublicImg");
            RRPublicImg = new ConfigDO("RRPublicImg", cacheValue);
        }
        return RRPublicImg;
    }

    public ConfigDO getRRPublicImgName() {
        if (RRPublicImgName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "RRPublicImgName");
            RRPublicImgName = new ConfigDO("RRPublicImgName", cacheValue);
        }
        return RRPublicImgName;
    }

    public ConfigDO getZYHPublicImg() {
        if (ZYHPublicImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ZYHPublicImg");
            ZYHPublicImg = new ConfigDO("ZYHPublicImg", cacheValue);
        }
        return ZYHPublicImg;
    }

    public ConfigDO getZYHPublicImgName() {
        if (ZYHPublicImgName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ZYHPublicImgName");
            ZYHPublicImgName = new ConfigDO("ZYHPublicImgName", cacheValue);
        }
        return ZYHPublicImgName;
    }

    public ConfigDO getLogoImg() {
        if (LogoImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "LogoImg");
            LogoImg = new ConfigDO("LogoImg", cacheValue);
        }
        return LogoImg;
    }

    public ConfigDO getCompanyCopyright() {
        if (CompanyCopyright == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CompanyCopyright");
            CompanyCopyright = new ConfigDO("CompanyCopyright", cacheValue);
        }
        return CompanyCopyright;
    }

    public ConfigDO getIsEnableWaiXinImg() {
        if (IsEnableWaiXinImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IsEnableWaiXinImg");
            IsEnableWaiXinImg = new ConfigDO("IsEnableWaiXinImg", cacheValue);
        }
        return IsEnableWaiXinImg;
    }

    public ConfigDO getContact() {
        if (Contact == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Contact");
            Contact = new ConfigDO("Contact", cacheValue);
        }
        return Contact;
    }


}
