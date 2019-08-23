package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 新闻配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class NewsConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "NewsConfig-";

    /**
     * 新闻配置 轮播大标题
     */
    private ConfigDO AboutUSBigTitle = null;
    /**
     * 新闻配置 轮播小标题
     */
    private ConfigDO AboutUSSmallTitle = null;

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
}
