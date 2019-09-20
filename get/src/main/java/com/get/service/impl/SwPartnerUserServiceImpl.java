package com.get.service.impl;

import com.get.domain.SwAccountRecordDO;
import com.get.domain.SwPartnerDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwPartnerService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwPartnerUserDao;
import com.get.domain.SwPartnerUserDO;
import com.get.service.SwPartnerUserService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwPartnerUserServiceImpl implements SwPartnerUserService {
    @Autowired
    private SwPartnerUserDao swPartnerUserDao;

    @Override
    public SwPartnerUserDO get(String tid) {
        return swPartnerUserDao.get(tid);
    }

    @Override
    public List<SwPartnerUserDO> list(Map<String, Object> map) {
        return swPartnerUserDao.list(map);
    }
    @Override
    public SwPartnerUserDO getByUserId(Integer userId, Integer status, String delFlag) {
        return swPartnerUserDao.getByUserId(userId,status,delFlag);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPartnerUserDao.count(map);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save(SwPartnerUserDO swPartnerUser){
        return swPartnerUserDao.save(swPartnerUser);
    }

    @Override
    public int update(SwPartnerUserDO swPartnerUser) {
        return swPartnerUserDao.update(swPartnerUser);
    }

    @Override
    public int remove(String tid) {
        SwPartnerUserDO swPartnerUser = new SwPartnerUserDO();
        swPartnerUser.setDelFlag(CommonStatic.DELETE);
        swPartnerUser.setTid(tid);
        return swPartnerUserDao.update(swPartnerUser);
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
