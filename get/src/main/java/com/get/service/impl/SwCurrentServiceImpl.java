package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwCurrentDao;
import com.get.domain.SwCurrentDO;
import com.get.service.SwCurrentService;


@Service
public class SwCurrentServiceImpl implements SwCurrentService {
    @Autowired
    private SwCurrentDao swCurrentDao;

    @Override
    public SwCurrentDO get(String tid) {
        return swCurrentDao.get(tid);
    }

    @Override
    public List<SwCurrentDO> list(Map<String, Object> map) {
        return swCurrentDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swCurrentDao.count(map);
    }

    @Override
    public int save(SwCurrentDO swCurrent) {
        return swCurrentDao.save(swCurrent);
    }

    @Override
    public int update(SwCurrentDO swCurrent) {
        return swCurrentDao.update(swCurrent);
    }

    @Override
    public int remove(String tid) {
        SwCurrentDO swCurrent = new SwCurrentDO();
        swCurrent.setDelFlag(CommonStatic.DELETE);
        swCurrent.setTid(tid);
        return swCurrentDao.update(swCurrent);
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
