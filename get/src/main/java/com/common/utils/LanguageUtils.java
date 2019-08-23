package com.common.utils;

import com.common.annotation.Language;
import com.system.language.service.impl.LanguageServiceImpl;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 语言工具类
 *
 * @author sunYaLong
 * @data 2018/9/12
 */
public class LanguageUtils {

    /**
     * 设置客户端语言
     *
     * @param request
     * @param response
     * @return
     */
    public static void setLanguage(HttpServletRequest request, HttpServletResponse response, String language) {
        CookieUtils.addCookie(response, "Language", language, 60 * 60 * 60 * 60);
    }

    /**
     * 获得客户端语言
     *
     * @param request
     * @param response
     * @return
     */
    public static String getLanguage(HttpServletRequest request, HttpServletResponse response) {
        String language = CookieUtils.getUid(request, "Language");
        if (StringUtils.isBlank(language)) {
            CookieUtils.addCookie(response, "Language", "zh", 60 * 60 * 60 * 60);
            language = "zh";
        }
        return language;
    }

    /**
     * 对一个中文字符串翻译成指定的语言标识
     *
     * @param zhText 中文字符串
     * @param status 指定的字符串标识
     * @return
     */
    public static String toTranslate(String zhText, String status) {
        LanguageServiceImpl languageService = (LanguageServiceImpl) ContextUtils.getBean(LanguageServiceImpl.class);
        return languageService.toTranslate(zhText, status);
    }

    /**
     * 将指定对象翻译后返回
     *
     * @param objs
     * @param status
     * @return
     */
    public static Object toTranslate(Object[] objs, String status) throws IllegalAccessException {
        List<Object> list = new ArrayList<>(); // key , value为展示内容
        for (Object o : objs) {
            Object result = toTranslate(o, status);
            list.add(result);
        }
        return list;
    }

    public static void toTranslate(List objs, String status, boolean islist) throws IllegalAccessException {
        if (!islist) {
            toTranslate(objs, status);
            return;
        }
        for (Object o : objs) {
            toTranslate(o, status);
        }
    }

    /**
     * 翻译接口
     *
     * @param obj
     * @param status
     * @return
     * @throws IllegalAccessException
     */
    public static Object toTranslate(Object obj, String status) throws IllegalAccessException {
        if (obj == null) {
            return null;
        }
        Class<?> objClazz = obj.getClass();
        Field[] declaredFields = objClazz.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            Language annotation = declaredField.getAnnotation(Language.class);
            if (annotation != null) {
                declaredField.setAccessible(true);
                // 获得翻译前的中文结果
                String zhText = (String) declaredField.get(obj);
                if (zhText == null) {
                    continue;
                }
                if (zhText.endsWith(".jpg") || zhText.endsWith(".png") || zhText.endsWith(".gif") || "0".equals(zhText) || "1".equals(zhText) || zhText.endsWith(".html")) {
                    return obj;
                }
                // 翻译后的结果
                String postTranslation = toTranslate(zhText, status);
                declaredField.set(obj, postTranslation);
            }
        }
        return obj;
    }

}
