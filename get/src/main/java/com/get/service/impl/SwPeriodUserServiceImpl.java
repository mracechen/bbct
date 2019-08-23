package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPeriodUserDao;
import com.get.domain.SwPeriodUserDO;
import com.get.service.SwPeriodUserService;


@Service
public class SwPeriodUserServiceImpl implements SwPeriodUserService {
    @Autowired
    private SwPeriodUserDao swPeriodUserDao;

    @Override
    public SwPeriodUserDO get(String tid) {
        return swPeriodUserDao.get(tid);
    }

    @Override
    public List<SwPeriodUserDO> list(Map<String, Object> map) {
        return swPeriodUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPeriodUserDao.count(map);
    }

    @Override
    public int save(SwPeriodUserDO swPeriodUser) {
        return swPeriodUserDao.save(swPeriodUser);
    }

    @Override
    public int update(SwPeriodUserDO swPeriodUser) {
        return swPeriodUserDao.update(swPeriodUser);
    }

    @Override
    public int remove(String tid) {
        SwPeriodUserDO swPeriodUser = new SwPeriodUserDO();
        swPeriodUser.setDelFlag(CommonStatic.DELETE);
        swPeriodUser.setTid(tid);
        return swPeriodUserDao.update(swPeriodUser);
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
