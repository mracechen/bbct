package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 团队配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class TeamConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "TeamConfig-";

    /**
     * 第一个模块名称
     */
    private ConfigDO TeamOneName = null;
    /**
     * 第一个模块图片
     */
    private ConfigDO TeamOneImage = null;
    /**
     * 第一个模块详情介绍
     */
    private ConfigDO TeamOneText = null;
    /**
     * 第二个模块名称
     */
    private ConfigDO TeamTwoName = null;
    /**
     * 第二个模块图片
     */
    private ConfigDO TeamTwoImage = null;
    /**
     * 第二个模块详情介绍
     */
    private ConfigDO TeamTwoText = null;
    /**
     * 第三个模块名称
     */
    private ConfigDO TeamThreeName = null;
    /**
     * 第三个模块图片
     */
    private ConfigDO TeamThreeImage = null;
    /**
     * 第三个模块详情介绍
     */
    private ConfigDO TeamThreeText = null;

    public ConfigDO getTeamOneName() {
        if (TeamOneName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamOneName");
            TeamOneName = new ConfigDO("TeamOneName", cacheValue);
        }
        return TeamOneName;
    }

    public ConfigDO getTeamOneImage() {
        if (TeamOneImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamOneImage");
            TeamOneImage = new ConfigDO("TeamOneImage", cacheValue);
        }
        return TeamOneImage;
    }

    public ConfigDO getTeamOneText() {
        if (TeamOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamOneText");
            TeamOneText = new ConfigDO("TeamOneText", cacheValue);
        }
        return TeamOneText;
    }

    public ConfigDO getTeamTwoName() {
        if (TeamTwoName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamTwoName");
            TeamTwoName = new ConfigDO("TeamTwoName", cacheValue);
        }
        return TeamTwoName;
    }

    public ConfigDO getTeamTwoImage() {
        if (TeamTwoImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamTwoImage");
            TeamTwoImage = new ConfigDO("TeamTwoImage", cacheValue);
        }
        return TeamTwoImage;
    }

    public ConfigDO getTeamTwoText() {
        if (TeamTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamTwoText");
            TeamTwoText = new ConfigDO("TeamTwoText", cacheValue);
        }
        return TeamTwoText;
    }

    public ConfigDO getTeamThreeName() {
        if (TeamThreeName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamThreeName");
            TeamThreeName = new ConfigDO("TeamThreeName", cacheValue);
        }
        return TeamThreeName;
    }

    public ConfigDO getTeamThreeImage() {
        if (TeamThreeImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamThreeImage");
            TeamThreeImage = new ConfigDO("TeamThreeImage", cacheValue);
        }
        return TeamThreeImage;
    }

    public ConfigDO getTeamThreeText() {
        if (TeamThreeText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "TeamThreeText");
            TeamThreeText = new ConfigDO("TeamThreeText", cacheValue);
        }
        return TeamThreeText;
    }


}
