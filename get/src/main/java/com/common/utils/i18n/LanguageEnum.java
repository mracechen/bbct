package com.common.utils.i18n;

import java.util.Locale;

/**
 * 每次添加一种新的语言，必须同时添加一个该语言对应的翻译文件
 * 文件命名为：messages_语言_国家.properties
 * */
public enum LanguageEnum {
    zh(Locale.SIMPLIFIED_CHINESE,"简体中文"),
    en(Locale.US,"英文");

    private Locale locale;
    private String desc;

    public Locale getLocale(){
        return locale;
    }
    public String getDesc(){
        return desc;
    }
    LanguageEnum(Locale locale, String desc){
        this.locale = locale;
        this.desc = desc;
    }
}