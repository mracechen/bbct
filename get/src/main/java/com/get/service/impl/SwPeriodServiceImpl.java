package com.get.service.impl;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPeriodDao;
import com.get.domain.SwPeriodDO;
import com.get.service.SwPeriodService;


@Service
public class SwPeriodServiceImpl implements SwPeriodService {
    @Autowired
    private SwPeriodDao swPeriodDao;

    @Override
    public SwPeriodDO get(String tid) {
        return swPeriodDao.get(tid);
    }

    @Override
    public List<SwPeriodDO> list(Map<String, Object> map) {
        return swPeriodDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPeriodDao.count(map);
    }

    @Override
    public int save(SwPeriodDO swPeriod) {
        if(swPeriod.getTid() == null){
            swPeriod.setTid(IDUtils.randomStr());
        }
        return swPeriodDao.save(swPeriod);
    }

    @Override
    public int update(SwPeriodDO swPeriod) {
        return swPeriodDao.update(swPeriod);
    }

    @Override
    public int remove(String tid) {
        SwPeriodDO swPeriod = new SwPeriodDO();
        swPeriod.setDelFlag(CommonStatic.DELETE);
        swPeriod.setTid(tid);
        return swPeriodDao.update(swPeriod);
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
