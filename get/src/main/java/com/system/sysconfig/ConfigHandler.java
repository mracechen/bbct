package com.system.sysconfig;

import com.system.sysconfig.configbean.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 配置的执行初始化方法
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class ConfigHandler {

    // 所有的配置类都需要加入这个集合
    public static List<Class> configsClazz = null;

    static {
        configsClazz = new ArrayList<>();
        configsClazz.add(IndexConfig.class);
        configsClazz.add(CoreConfig.class);
        configsClazz.add(AboutUsConfig.class);
        configsClazz.add(TeamConfig.class);
        configsClazz.add(NewsConfig.class);
        configsClazz.add(SettlementCommonConfig.class);
    }
}
