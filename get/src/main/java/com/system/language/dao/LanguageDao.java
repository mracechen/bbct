package com.system.language.dao;

import com.system.language.domain.LanguageDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 国际化语言表
 *
 * @author chglee
 * @date 2018-09-05 16:07:36
 */
@Mapper
public interface LanguageDao {

    LanguageDO get(String tid);

    List<LanguageDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(LanguageDO language);

    int update(LanguageDO language);

    int remove(String tid);

    int batchRemove(String[] tids);

    /**
     * 根据id批量查询
     *
     * @param list
     * @return
     */
    List<LanguageDO> listBatchTid(List<String> list);

    /**
     * 搜索方法
     *
     * @param languageDO
     * @return
     */
    List<LanguageDO> search(LanguageDO languageDO);
}
