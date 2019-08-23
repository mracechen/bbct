package com.common.utils;

import java.lang.reflect.Field;

/**
 * @author sunYaLong
 * @data 2018/9/6
 */
public class ReflectUtils {

    /**
     * 获得config配置类的前缀信息
     *
     * @param clazz
     * @return
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public static String getPrefix(Class clazz) throws NoSuchFieldException, IllegalAccessException, InstantiationException {
        Object o = clazz.newInstance();
        Field prefix = clazz.getField("prefix");
        Object o1 = prefix.get(o);
        return (String) o1;
    }
}
