package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwBenchmarkingDao;
import com.get.domain.SwBenchmarkingDO;
import com.get.service.SwBenchmarkingService;


@Service
public class SwBenchmarkingServiceImpl implements SwBenchmarkingService {
    @Autowired
    private SwBenchmarkingDao swBenchmarkingDao;

    @Override
    public SwBenchmarkingDO get(String tid) {
        return swBenchmarkingDao.get(tid);
    }

    @Override
    public List<SwBenchmarkingDO> list(Map<String, Object> map) {
        return swBenchmarkingDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swBenchmarkingDao.count(map);
    }

    @Override
    public int save(SwBenchmarkingDO swBenchmarking) {
        return swBenchmarkingDao.save(swBenchmarking);
    }

    @Override
    public int update(SwBenchmarkingDO swBenchmarking) {
        return swBenchmarkingDao.update(swBenchmarking);
    }

    @Override
    public int remove(String tid) {
        SwBenchmarkingDO swBenchmarking = new SwBenchmarkingDO();
        swBenchmarking.setDelFlag(CommonStatic.DELETE);
        swBenchmarking.setTid(tid);
        return swBenchmarkingDao.update(swBenchmarking);
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
