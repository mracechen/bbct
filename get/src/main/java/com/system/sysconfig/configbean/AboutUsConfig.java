package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 关于我们配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class AboutUsConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "AboutUsConfig-";

    /**
     * 关于我们 轮播大标题
     */
    private ConfigDO AboutUSBigTitle = null;
    /**
     * 关于我们 轮播小标题
     */
    private ConfigDO AboutUSSmallTitle = null;
    /**
     * 关于我们 第一个模块名称
     */
    private ConfigDO AboutUSOneName = null;
    /**
     * 关于我们 第一个模块展示图
     */
    private ConfigDO AboutUSOneImage = null;
    /**
     * 关于我们 第一个模块详情介绍
     */
    private ConfigDO AboutUSOneText = null;
    /**
     * 关于我们 第二个模块名称
     */
    private ConfigDO AboutUSTwoName = null;
    /**
     * 关于我们 第二个模块展示图
     */
    private ConfigDO AboutUSTwoImage = null;
    /**
     * 关于我们 第二个模块详情介绍
     */
    private ConfigDO AboutUSTwoText = null;
    /**
     * 关于我们 第三个模块名称
     */
    private ConfigDO AboutUSThreeName = null;
    /**
     * 关于我们 第三个模块展示图
     */
    private ConfigDO AboutUSThreeImage = null;
    /**
     * 关于我们 第三个模块详情介绍
     */
    private ConfigDO AboutUSThreeText = null;
    /**
     * 关于我们 第四个模块名称
     */
    private ConfigDO AboutUSFourName = null;
    /**
     * 关于我们 第四个模块展示图
     */
    private ConfigDO AboutUSFourImage = null;
    /**
     * 关于我们 第四个模块详情介绍
     */
    private ConfigDO AboutUSFourText = null;

    public ConfigDO getAboutUSBigTitle() {
        if (AboutUSBigTitle == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSBigTitle");
            AboutUSBigTitle = new ConfigDO("AboutUSBigTitle", cacheValue);
        }
        return AboutUSBigTitle;
    }

    public ConfigDO getAboutUSSmallTitle() {
        if (AboutUSSmallTitle == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSSmallTitle");
            AboutUSSmallTitle = new ConfigDO("AboutUSSmallTitle", cacheValue);
        }
        return AboutUSSmallTitle;
    }

    public ConfigDO getAboutUSOneName() {
        if (AboutUSOneName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSOneName");
            AboutUSOneName = new ConfigDO("AboutUSOneName", cacheValue);
        }
        return AboutUSOneName;
    }

    public ConfigDO getAboutUSOneImage() {
        if (AboutUSOneImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSOneImage");
            AboutUSOneImage = new ConfigDO("AboutUSOneImage", cacheValue);
        }
        return AboutUSOneImage;
    }

    public ConfigDO getAboutUSOneText() {
        if (AboutUSOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSOneText");
            AboutUSOneText = new ConfigDO("AboutUSOneText", cacheValue);
        }
        return AboutUSOneText;
    }

    public ConfigDO getAboutUSTwoName() {
        if (AboutUSTwoName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSTwoName");
            AboutUSTwoName = new ConfigDO("AboutUSTwoName", cacheValue);
        }
        return AboutUSTwoName;
    }

    public ConfigDO getAboutUSTwoImage() {
        if (AboutUSTwoImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSTwoImage");
            AboutUSTwoImage = new ConfigDO("AboutUSTwoImage", cacheValue);
        }
        return AboutUSTwoImage;
    }

    public ConfigDO getAboutUSTwoText() {
        if (AboutUSTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSTwoText");
            AboutUSTwoText = new ConfigDO("AboutUSTwoText", cacheValue);
        }
        return AboutUSTwoText;
    }

    public ConfigDO getAboutUSThreeName() {
        if (AboutUSThreeName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSThreeName");
            AboutUSThreeName = new ConfigDO("AboutUSThreeName", cacheValue);
        }
        return AboutUSThreeName;
    }

    public ConfigDO getAboutUSThreeImage() {
        if (AboutUSThreeImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSThreeImage");
            AboutUSThreeImage = new ConfigDO("AboutUSThreeImage", cacheValue);
        }
        return AboutUSThreeImage;
    }

    public ConfigDO getAboutUSThreeText() {
        if (AboutUSThreeText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSThreeText");
            AboutUSThreeText = new ConfigDO("AboutUSThreeText", cacheValue);
        }
        return AboutUSThreeText;
    }

    public ConfigDO getAboutUSFourName() {
        if (AboutUSFourName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFourName");
            AboutUSFourName = new ConfigDO("AboutUSFourName", cacheValue);
        }
        return AboutUSFourName;
    }

    public ConfigDO getAboutUSFourImage() {
        if (AboutUSFourImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFourImage");
            AboutUSFourImage = new ConfigDO("AboutUSFourImage", cacheValue);
        }
        return AboutUSFourImage;
    }

    public ConfigDO getAboutUSFourText() {
        if (AboutUSFourText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFourText");
            AboutUSFourText = new ConfigDO("AboutUSFourText", cacheValue);
        }
        return AboutUSFourText;
    }


}
