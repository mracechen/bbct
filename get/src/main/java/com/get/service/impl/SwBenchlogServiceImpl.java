package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwBenchlogDao;
import com.get.domain.SwBenchlogDO;
import com.get.service.SwBenchlogService;


@Service
public class SwBenchlogServiceImpl implements SwBenchlogService {
    @Autowired
    private SwBenchlogDao swBenchlogDao;

    @Override
    public SwBenchlogDO get(String tid) {
        return swBenchlogDao.get(tid);
    }

    @Override
    public List<SwBenchlogDO> list(Map<String, Object> map) {
        return swBenchlogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swBenchlogDao.count(map);
    }

    @Override
    public int save(SwBenchlogDO swBenchlog) {
        return swBenchlogDao.save(swBenchlog);
    }

    @Override
    public int update(SwBenchlogDO swBenchlog) {
        return swBenchlogDao.update(swBenchlog);
    }

    @Override
    public int remove(String tid) {
        SwBenchlogDO swBenchlog = new SwBenchlogDO();
        swBenchlog.setDelFlag(CommonStatic.DELETE);
        swBenchlog.setTid(tid);
        return swBenchlogDao.update(swBenchlog);
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
