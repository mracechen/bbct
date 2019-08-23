package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwCurrentUserDao;
import com.get.domain.SwCurrentUserDO;
import com.get.service.SwCurrentUserService;


@Service
public class SwCurrentUserServiceImpl implements SwCurrentUserService {
    @Autowired
    private SwCurrentUserDao swCurrentUserDao;

    @Override
    public SwCurrentUserDO get(String tid) {
        return swCurrentUserDao.get(tid);
    }

    @Override
    public List<SwCurrentUserDO> list(Map<String, Object> map) {
        return swCurrentUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swCurrentUserDao.count(map);
    }

    @Override
    public int save(SwCurrentUserDO swCurrentUser) {
        return swCurrentUserDao.save(swCurrentUser);
    }

    @Override
    public int update(SwCurrentUserDO swCurrentUser) {
        return swCurrentUserDao.update(swCurrentUser);
    }

    @Override
    public int remove(String tid) {
        SwCurrentUserDO swCurrentUser = new SwCurrentUserDO();
        swCurrentUser.setDelFlag(CommonStatic.DELETE);
        swCurrentUser.setTid(tid);
        return swCurrentUserDao.update(swCurrentUser);
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
