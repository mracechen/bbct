package com.system.language.service;

import com.system.language.domain.LanguageDO;

import java.util.List;
import java.util.Map;

/**
 * 国际化语言表
 *
 * @author chglee
 * @date 2018-09-05 16:07:36
 */
public interface LanguageService {

    LanguageDO get(String tid);

    List<LanguageDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(LanguageDO language);

    int update(LanguageDO language);

    int remove(String tid);

    int batchRemove(String[] tids);

    /**
     * 翻译语言的接口,调用这个接口如果,需要翻译的文本不存在的话,会调用百度翻译,将翻译后的值保持到数据库和reids
     *
     * @param zhText
     * @param toStatus
     * @return
     */
    String toTranslate(String zhText, String toStatus);

    List<LanguageDO> search(LanguageDO languageDO);
}
