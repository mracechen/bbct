package com.system.languagecat.service;

import com.system.languagecat.domain.LanguageCategoryDO;

import java.util.List;
import java.util.Map;

/**
 * 语言分类
 *
 * @author sunyalong
 * @email 1992lcg@163.com
 * @date 2018-09-13 11:59:36
 */
public interface LanguageCategoryService {

    LanguageCategoryDO get(String status);

    List<LanguageCategoryDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(LanguageCategoryDO languageCategory);

    int update(LanguageCategoryDO languageCategory);

    int remove(String status);

    int batchRemove(String[] statuss);
}
