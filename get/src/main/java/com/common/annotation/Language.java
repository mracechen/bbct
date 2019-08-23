package com.common.annotation;


import java.lang.annotation.*;

/**
 * @author sunYaLong
 * @data 2018/9/12
 */
@Target({ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Language {
}
