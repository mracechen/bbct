package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwCoinTypeDao;
import com.get.domain.SwCoinTypeDO;
import com.get.service.SwCoinTypeService;


@Service
public class SwCoinTypeServiceImpl implements SwCoinTypeService {
    @Autowired
    private SwCoinTypeDao swCoinTypeDao;

    @Override
    public SwCoinTypeDO get(String tid) {
        return swCoinTypeDao.get(tid);
    }

    @Override
    public List<SwCoinTypeDO> list(Map<String, Object> map) {
        return swCoinTypeDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swCoinTypeDao.count(map);
    }

    @Override
    public int save(SwCoinTypeDO swCoinType) {
        return swCoinTypeDao.save(swCoinType);
    }

    @Override
    public int update(SwCoinTypeDO swCoinType) {
        return swCoinTypeDao.update(swCoinType);
    }

    @Override
    public int remove(String tid) {
        SwCoinTypeDO swCoinType = new SwCoinTypeDO();
        swCoinType.setDelFlag(CommonStatic.DELETE);
        swCoinType.setTid(tid);
        return swCoinTypeDao.update(swCoinType);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
