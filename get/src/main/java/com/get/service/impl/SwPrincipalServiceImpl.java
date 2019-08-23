package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPrincipalDao;
import com.get.domain.SwPrincipalDO;
import com.get.service.SwPrincipalService;


@Service
public class SwPrincipalServiceImpl implements SwPrincipalService {
    @Autowired
    private SwPrincipalDao swPrincipalDao;

    @Override
    public SwPrincipalDO get(String tid) {
        return swPrincipalDao.get(tid);
    }

    @Override
    public List<SwPrincipalDO> list(Map<String, Object> map) {
        return swPrincipalDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPrincipalDao.count(map);
    }

    @Override
    public int save(SwPrincipalDO swPrincipal) {
        return swPrincipalDao.save(swPrincipal);
    }

    @Override
    public int update(SwPrincipalDO swPrincipal) {
        return swPrincipalDao.update(swPrincipal);
    }

    @Override
    public int remove(String tid) {
        SwPrincipalDO swPrincipal = new SwPrincipalDO();
        swPrincipal.setDelFlag(CommonStatic.DELETE);
        swPrincipal.setTid(tid);
        return swPrincipalDao.update(swPrincipal);
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
