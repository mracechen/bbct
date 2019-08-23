package com.common.utils.i18n;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * @author chenjie
 * */
@Component
public class Languagei18nUtils {

    @Autowired
    private LocaleMessage localeMessage;

    /**
     * 支持手动选择地区语言
     * @return 对应该地区语言翻译后的文本
     * */
    public String getMessage(String code, Locale locale, Object... args){
        return localeMessage.getMessage(code,args,locale);
    }

    /**
     * 支持自动翻译成所有地区语言
     * @return 将所有地区语言对应的译文组成json
     * */
    public String getMessage(String code, Object... args){
        Map<String,String> map = new HashMap<>();
        LanguageEnum[] values = LanguageEnum.values();
        for(LanguageEnum languageEnum:values){
            Locale locale = languageEnum.getLocale();
            String message = localeMessage.getMessage(code, args, locale);
            map.put(languageEnum.name(),message);
        }
        return JSON.toJSONString(map);
    }
}