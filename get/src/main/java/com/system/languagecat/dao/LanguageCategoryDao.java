package com.system.languagecat.dao;

import com.system.languagecat.domain.LanguageCategoryDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 语言分类
 *
 * @author sunyalong
 * @email 1992lcg@163.com
 * @date 2018-09-13 11:59:36
 */
@Mapper
public interface LanguageCategoryDao {

    LanguageCategoryDO get(String status);

    List<LanguageCategoryDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(LanguageCategoryDO languageCategory);

    int update(LanguageCategoryDO languageCategory);

    int remove(String status);

    int batchRemove(String[] statuss);
}
