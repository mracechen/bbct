package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwPrincipalUserDao;
import com.get.domain.SwPrincipalUserDO;
import com.get.service.SwPrincipalUserService;


@Service
public class SwPrincipalUserServiceImpl implements SwPrincipalUserService {
    @Autowired
    private SwPrincipalUserDao swPrincipalUserDao;

    @Override
    public SwPrincipalUserDO get(String tid) {
        return swPrincipalUserDao.get(tid);
    }

    @Override
    public SwPrincipalUserDO getByUserId(Integer userId, Integer status, String delFlag) {
        return swPrincipalUserDao.getByUserId(userId,status,delFlag);
    }

    @Override
    public List<SwPrincipalUserDO> getWaitingResolvePrincipal() {
        return swPrincipalUserDao.getWaitingResolvePrincipal();
    }

    @Override
    public List<SwPrincipalUserDO> list(Map<String, Object> map) {
        return swPrincipalUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPrincipalUserDao.count(map);
    }

    @Override
    public int save(SwPrincipalUserDO swPrincipalUser) {
        return swPrincipalUserDao.save(swPrincipalUser);
    }

    @Override
    public int update(SwPrincipalUserDO swPrincipalUser) {
        return swPrincipalUserDao.update(swPrincipalUser);
    }

    @Override
    public int remove(String tid) {
        SwPrincipalUserDO swPrincipalUser = new SwPrincipalUserDO();
        swPrincipalUser.setDelFlag(CommonStatic.DELETE);
        swPrincipalUser.setTid(tid);
        return swPrincipalUserDao.update(swPrincipalUser);
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
