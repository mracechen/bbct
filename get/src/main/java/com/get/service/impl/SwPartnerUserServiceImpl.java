package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPartnerUserDao;
import com.get.domain.SwPartnerUserDO;
import com.get.service.SwPartnerUserService;


@Service
public class SwPartnerUserServiceImpl implements SwPartnerUserService {
    @Autowired
    private SwPartnerUserDao swPartnerUserDao;

    @Override
    public SwPartnerUserDO get(String tid) {
        return swPartnerUserDao.get(tid);
    }

    @Override
    public List<SwPartnerUserDO> list(Map<String, Object> map) {
        return swPartnerUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPartnerUserDao.count(map);
    }

    @Override
    public int save(SwPartnerUserDO swPartnerUser) {
        return swPartnerUserDao.save(swPartnerUser);
    }

    @Override
    public int update(SwPartnerUserDO swPartnerUser) {
        return swPartnerUserDao.update(swPartnerUser);
    }

    @Override
    public int remove(String tid) {
        SwPartnerUserDO swPartnerUser = new SwPartnerUserDO();
        swPartnerUser.setDelFlag(CommonStatic.DELETE);
        swPartnerUser.setTid(tid);
        return swPartnerUserDao.update(swPartnerUser);
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
