package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 首页核心业务配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class CoreConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "CoreConfig-";

    /**
     * 核心业务背景图 CoreBackGroundImg
     */
    private ConfigDO CoreBackGroundImg = null;
    /**
     * 核心业务文字展示 CoreTextName
     */
    private ConfigDO CoreTextName = null;
    /**
     * 核心业务按钮名称 CoreButtonName
     */
    private ConfigDO CoreButtonName = null;
    /**
     * 按钮跳转地址 CoreButtonLinked
     */
    private ConfigDO CoreButtonLinked = null;

    public ConfigDO getCoreBackGroundImg() {
        if (CoreBackGroundImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreBackGroundImg");
            CoreBackGroundImg = new ConfigDO("CoreBackGroundImg", cacheValue);
        }
        return CoreBackGroundImg;
    }

    public ConfigDO getCoreTextName() {
        if (CoreTextName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreTextName");
            CoreTextName = new ConfigDO("CoreTextName", cacheValue);
        }
        return CoreTextName;
    }

    public ConfigDO getCoreButtonName() {
        if (CoreButtonName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreButtonName");
            CoreButtonName = new ConfigDO("CoreButtonName", cacheValue);
        }
        return CoreButtonName;
    }

    public ConfigDO getCoreButtonLinked() {
        if (CoreButtonLinked == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreButtonLinked");
            CoreButtonLinked = new ConfigDO("CoreButtonLinked", cacheValue);
        }
        return CoreButtonLinked;
    }


}
