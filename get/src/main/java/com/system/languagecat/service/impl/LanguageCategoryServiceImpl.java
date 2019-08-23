package com.system.languagecat.service.impl;

import com.system.languagecat.dao.LanguageCategoryDao;
import com.system.languagecat.domain.LanguageCategoryDO;
import com.system.languagecat.service.LanguageCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class LanguageCategoryServiceImpl implements LanguageCategoryService {
    @Autowired
    private LanguageCategoryDao languageCategoryDao;

    @Override
    public LanguageCategoryDO get(String status) {
        return languageCategoryDao.get(status);
    }

    @Override
    public List<LanguageCategoryDO> list(Map<String, Object> map) {
        return languageCategoryDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return languageCategoryDao.count(map);
    }

    @Override
    public int save(LanguageCategoryDO languageCategory) {
        languageCategory.setCreateDate(new Date());
        languageCategory.setUpdateDate(new Date());
        return languageCategoryDao.save(languageCategory);
    }

    @Override
    public int update(LanguageCategoryDO languageCategory) {
        languageCategory.setCreateDate(null);
        languageCategory.setUpdateDate(new Date());
        return languageCategoryDao.update(languageCategory);
    }

    @Override
    public int remove(String status) {
        return languageCategoryDao.remove(status);
    }

    @Override
    public int batchRemove(String[] statuss) {
        return languageCategoryDao.batchRemove(statuss);
    }

}
