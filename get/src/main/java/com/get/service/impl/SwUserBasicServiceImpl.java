package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwUserBasicDao;
import com.get.domain.SwUserBasicDO;
import com.get.service.SwUserBasicService;


@Service
public class SwUserBasicServiceImpl implements SwUserBasicService {
    @Autowired
    private SwUserBasicDao swUserBasicDao;

    @Override
    public SwUserBasicDO get(Integer tid) {
        return swUserBasicDao.get(tid);
    }

    @Override
    public List<SwUserBasicDO> list(Map<String, Object> map) {
        return swUserBasicDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swUserBasicDao.count(map);
    }

    @Override
    public int save(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.save(swUserBasic);
    }

    @Override
    public int update(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int remove(Integer tid) {
        SwUserBasicDO swUserBasic = new SwUserBasicDO();
        swUserBasic.setDelFlag(CommonStatic.DELETE);
        swUserBasic.setTid(tid);
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int batchRemove(Integer[]tids) {
        int count = 0;
        for(Integer ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
