package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwChargelogDao;
import com.get.domain.SwChargelogDO;
import com.get.service.SwChargelogService;


@Service
public class SwChargelogServiceImpl implements SwChargelogService {
    @Autowired
    private SwChargelogDao swChargelogDao;

    @Override
    public SwChargelogDO get(String tid) {
        return swChargelogDao.get(tid);
    }

    @Override
    public List<SwChargelogDO> list(Map<String, Object> map) {
        return swChargelogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swChargelogDao.count(map);
    }

    @Override
    public int save(SwChargelogDO swChargelog) {
        return swChargelogDao.save(swChargelog);
    }

    @Override
    public int update(SwChargelogDO swChargelog) {
        return swChargelogDao.update(swChargelog);
    }

    @Override
    public int remove(String tid) {
        SwChargelogDO swChargelog = new SwChargelogDO();
        swChargelog.setDelFlag(CommonStatic.DELETE);
        swChargelog.setTid(tid);
        return swChargelogDao.update(swChargelog);
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
