package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwEvangelistUserDao;
import com.get.domain.SwEvangelistUserDO;
import com.get.service.SwEvangelistUserService;


@Service
public class SwEvangelistUserServiceImpl implements SwEvangelistUserService {
    @Autowired
    private SwEvangelistUserDao swEvangelistUserDao;

    @Override
    public SwEvangelistUserDO get(String tid) {
        return swEvangelistUserDao.get(tid);
    }

    @Override
    public List<SwEvangelistUserDO> list(Map<String, Object> map) {
        return swEvangelistUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swEvangelistUserDao.count(map);
    }

    @Override
    public int save(SwEvangelistUserDO swEvangelistUser) {
        return swEvangelistUserDao.save(swEvangelistUser);
    }

    @Override
    public int update(SwEvangelistUserDO swEvangelistUser) {
        return swEvangelistUserDao.update(swEvangelistUser);
    }

    @Override
    public int remove(String tid) {
        SwEvangelistUserDO swEvangelistUser = new SwEvangelistUserDO();
        swEvangelistUser.setDelFlag(CommonStatic.DELETE);
        swEvangelistUser.setTid(tid);
        return swEvangelistUserDao.update(swEvangelistUser);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

    @Override
    public SwEvangelistUserDO getByUserId(Integer userId, Integer status, String delFlag) {
        return swEvangelistUserDao.getByUserId(userId,status,delFlag);
    }

}
