package com.common.initexecute;

import com.common.utils.i18n.Languagei18nUtils;
import com.system.base.service.SecurityManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * spring 容器加载完成后执行的方法
 *
 * @author sunYaLong
 * @data 2018/9/5
 */
@Component
public class InitExecute implements ApplicationListener<ContextRefreshedEvent>{

//    @Autowired
//    LanguageInit languageInit;

    @Autowired
    SysConfigInit sysConfigInit;

    @Autowired
    ApplicationConfigInit applicationConfigInit;
    @Autowired
    SecurityManagerService securityManagerService;

    private Languagei18nUtils languagei18nUtils;

    /**
     * spring boot容器加载完成后执行
     *
     * @param event
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if(event.getApplicationContext().getParent() == null){
            // 执行非spring 管理的类需要初始化的配置
            applicationConfigInit.execute();
            // 执行全局配置缓存的方法
            sysConfigInit.execute();
            // 执行国际化语言缓存redis的方法
//            languageInit.execute();
        }
    }
}
