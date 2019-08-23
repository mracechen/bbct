package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwWithlogDao;
import com.get.domain.SwWithlogDO;
import com.get.service.SwWithlogService;


@Service
public class SwWithlogServiceImpl implements SwWithlogService {
    @Autowired
    private SwWithlogDao swWithlogDao;

    @Override
    public SwWithlogDO get(String tid) {
        return swWithlogDao.get(tid);
    }

    @Override
    public List<SwWithlogDO> list(Map<String, Object> map) {
        return swWithlogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swWithlogDao.count(map);
    }

    @Override
    public int save(SwWithlogDO swWithlog) {
        return swWithlogDao.save(swWithlog);
    }

    @Override
    public int update(SwWithlogDO swWithlog) {
        return swWithlogDao.update(swWithlog);
    }

    @Override
    public int remove(String tid) {
        SwWithlogDO swWithlog = new SwWithlogDO();
        swWithlog.setDelFlag(CommonStatic.DELETE);
        swWithlog.setTid(tid);
        return swWithlogDao.update(swWithlog);
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
