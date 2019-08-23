package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwEvangelistDao;
import com.get.domain.SwEvangelistDO;
import com.get.service.SwEvangelistService;


@Service
public class SwEvangelistServiceImpl implements SwEvangelistService {
    @Autowired
    private SwEvangelistDao swEvangelistDao;

    @Override
    public SwEvangelistDO get(String tid) {
        return swEvangelistDao.get(tid);
    }

    @Override
    public List<SwEvangelistDO> list(Map<String, Object> map) {
        return swEvangelistDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swEvangelistDao.count(map);
    }

    @Override
    public int save(SwEvangelistDO swEvangelist) {
        return swEvangelistDao.save(swEvangelist);
    }

    @Override
    public int update(SwEvangelistDO swEvangelist) {
        return swEvangelistDao.update(swEvangelist);
    }

    @Override
    public int remove(String tid) {
        SwEvangelistDO swEvangelist = new SwEvangelistDO();
        swEvangelist.setDelFlag(CommonStatic.DELETE);
        swEvangelist.setTid(tid);
        return swEvangelistDao.update(swEvangelist);
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
