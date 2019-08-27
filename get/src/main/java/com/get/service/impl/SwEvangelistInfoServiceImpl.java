package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwEvangelistInfoDao;
import com.get.domain.SwEvangelistInfoDO;
import com.get.service.SwEvangelistInfoService;


@Service
public class SwEvangelistInfoServiceImpl implements SwEvangelistInfoService {
    @Autowired
    private SwEvangelistInfoDao swEvangelistInfoDao;

    @Override
    public SwEvangelistInfoDO get(String tid) {
        return swEvangelistInfoDao.get(tid);
    }

    @Override
    public List<SwEvangelistInfoDO> list(Map<String, Object> map) {
        return swEvangelistInfoDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swEvangelistInfoDao.count(map);
    }

    @Override
    public int save(SwEvangelistInfoDO swEvangelistInfo) {
        return swEvangelistInfoDao.save(swEvangelistInfo);
    }

    @Override
    public int update(SwEvangelistInfoDO swEvangelistInfo) {
        return swEvangelistInfoDao.update(swEvangelistInfo);
    }

    @Override
    public int remove(String tid) {
        SwEvangelistInfoDO swEvangelistInfo = new SwEvangelistInfoDO();
        swEvangelistInfo.setDelFlag(CommonStatic.DELETE);
        swEvangelistInfo.setTid(tid);
        return swEvangelistInfoDao.update(swEvangelistInfo);
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
