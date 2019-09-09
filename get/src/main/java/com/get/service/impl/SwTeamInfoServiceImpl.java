package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwTeamInfoDao;
import com.get.domain.SwTeamInfoDO;
import com.get.service.SwTeamInfoService;


@Service
public class SwTeamInfoServiceImpl implements SwTeamInfoService {
    @Autowired
    private SwTeamInfoDao swTeamInfoDao;

    @Override
    public SwTeamInfoDO get(String tid) {
        return swTeamInfoDao.get(tid);
    }

    @Override
    public List<SwTeamInfoDO> list(Map<String, Object> map) {
        return swTeamInfoDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swTeamInfoDao.count(map);
    }

    @Override
    public int save(SwTeamInfoDO swTeamInfo) {
        return swTeamInfoDao.save(swTeamInfo);
    }

    @Override
    public int update(SwTeamInfoDO swTeamInfo) {
        return swTeamInfoDao.update(swTeamInfo);
    }

    @Override
    public int remove(String tid) {
        SwTeamInfoDO swTeamInfo = new SwTeamInfoDO();
        swTeamInfo.setDelFlag(CommonStatic.DELETE);
        swTeamInfo.setTid(tid);
        return swTeamInfoDao.update(swTeamInfo);
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
