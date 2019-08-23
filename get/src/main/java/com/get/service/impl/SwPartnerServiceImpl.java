package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPartnerDao;
import com.get.domain.SwPartnerDO;
import com.get.service.SwPartnerService;


@Service
public class SwPartnerServiceImpl implements SwPartnerService {
    @Autowired
    private SwPartnerDao swPartnerDao;

    @Override
    public SwPartnerDO get(String tid) {
        return swPartnerDao.get(tid);
    }

    @Override
    public List<SwPartnerDO> list(Map<String, Object> map) {
        return swPartnerDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPartnerDao.count(map);
    }

    @Override
    public int save(SwPartnerDO swPartner) {
        return swPartnerDao.save(swPartner);
    }

    @Override
    public int update(SwPartnerDO swPartner) {
        return swPartnerDao.update(swPartner);
    }

    @Override
    public int remove(String tid) {
        SwPartnerDO swPartner = new SwPartnerDO();
        swPartner.setDelFlag(CommonStatic.DELETE);
        swPartner.setTid(tid);
        return swPartnerDao.update(swPartner);
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
