package com.common.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 获得spring的上下文对象
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
@Component
public class ContextUtils implements ApplicationContextAware {

    public static ApplicationContext applicationContext;

    public ContextUtils() {
    }

    public static Object getBean(Class clazz) {
        return applicationContext.getBean(clazz);
    }

    public static Object getObject(String id) {
        return applicationContext.getBean(id);
    }

    @Override
    public void setApplicationContext(ApplicationContext arg0) throws BeansException {
        applicationContext = arg0;
    }

}
