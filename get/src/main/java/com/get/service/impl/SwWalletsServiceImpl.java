package com.get.service.impl;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwWalletsDao;
import com.get.domain.SwWalletsDO;
import com.get.service.SwWalletsService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwWalletsServiceImpl implements SwWalletsService {
    @Autowired
    private SwWalletsDao swWalletsDao;

    @Override
    public SwWalletsDO get(String tid) {
        return swWalletsDao.get(tid);
    }

    @Override
    public List<SwWalletsDO> list(Map<String, Object> map) {
        return swWalletsDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swWalletsDao.count(map);
    }

    @Override
    public int save(SwWalletsDO swWallets) {
        return swWalletsDao.save(swWallets);
    }

    @Override
    public int update(SwWalletsDO swWallets) {
        return swWalletsDao.update(swWallets);
    }

    @Override
    public int remove(String tid) {
        SwWalletsDO swWallets = new SwWalletsDO();
        swWallets.setDelFlag(CommonStatic.DELETE);
        swWallets.setTid(tid);
        return swWalletsDao.update(swWallets);
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
    @Transactional(rollbackFor = Exception.class)
    public SwWalletsDO createWallet(Integer userID, String coinTypeId){
        SwWalletsDO swWalletsDO = new SwWalletsDO();
        swWalletsDO.setTid(IDUtils.randomStr());
        swWalletsDO.setCurrency(new BigDecimal("0"));
        swWalletsDO.setFrozenAmount(new BigDecimal("0"));
        swWalletsDO.setCreateDate(new Date());
        swWalletsDO.setUpdateDate(new Date());
        swWalletsDO.setDelFlag(CommonStatic.NOTDELETE);
        swWalletsDO.setIsActive(CommonStatic.ACTIVE);
        swWalletsDO.setUserId(userID);
        swWalletsDO.setCoinTypeId(coinTypeId);
        return swWalletsDO;
    }

    @Override
    public SwWalletsDO getWallet(Integer user_id, String coin_id) {
        return swWalletsDao.getWallet(user_id,coin_id);
    }
}
