package com.get.service.impl;

import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwCurrentUserDao;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwCurrentUserServiceImpl implements SwCurrentUserService {
    @Autowired
    private SwCurrentUserDao swCurrentUserDao;

    @Autowired
    private SwCurrentService swCurrentService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwPrincipalUserService swPrincipalUserService;

    @Autowired
    private SwPrincipalService swPrincipalService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Override
    public SwCurrentUserDO get(String tid) {
        return swCurrentUserDao.get(tid);
    }

    @Override
    public List<SwCurrentUserDO> getWaitingResolveCurrent(Date beginDate, Date endDate) {
        return swCurrentUserDao.getWaitingResolveCurrent(beginDate,endDate);
    }

    @Override
    public List<SwCurrentUserDO> getByUserId(Integer userId, Integer status, String delFlag){
        return swCurrentUserDao.getByUserId(userId,status,delFlag);
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
    @Transactional(rollbackFor = Exception.class)
    public int save(SwCurrentUserDO swCurrentUser) throws Exception {
        SwCurrentDO swCurrentDO = swCurrentService.get(swCurrentUser.getCurrentId());
        List<SwPrincipalUserDO> myPrincipal = swPrincipalUserService.getByUserId(swCurrentUser.getUserId(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        SwPrincipalUserDO swPrincipalUserDO = myPrincipal.get(0);
        SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUserDO.getPrincipalId());
        BigDecimal currentAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                .multiply(new BigDecimal(String.valueOf(swCurrentUser.getEx3())))
                .multiply(new BigDecimal(String.valueOf(swCurrentDO.getAcceleratePercent())))
                .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
        swCurrentUser.setEx2(currentAccelerateNum.intValue());
        if(swCurrentDO == null){
            throw new Exception("活币金异常");
        }
        SwWalletsDO wallet = swWalletsService.getWallet(swCurrentUser.getUserId(), swCurrentDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swCurrentUser.getEx1()))));
        wallet.setUpdateDate(new Date());
        wallet.setFrozenAmount(new BigDecimal("0"));
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swCurrentUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwCurrentUserServiceImpl.save.purchasing.current"),
                swCurrentDO.getCoinTypeId(),
                -swCurrentUser.getEx1(),
                currency.doubleValue() - swCurrentUser.getEx1()
        ));
        return swCurrentUserDao.save(swCurrentUser);
    }

    @Override
    public int update(SwCurrentUserDO swCurrentUser) {
        return swCurrentUserDao.update(swCurrentUser);
    }

    @Override
    public int cancel(SwCurrentUserDO swCurrentUser) throws Exception {
        SwCurrentDO swCurrentDO = swCurrentService.get(swCurrentUser.getCurrentId());
        SwWalletsDO wallet = swWalletsService.getWallet(swCurrentUser.getUserId(), swCurrentDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(new BigDecimal(String.valueOf(swCurrentUser.getEx1())));
        wallet.setUpdateDate(new Date());
        wallet.setFrozenAmount(new BigDecimal("0"));
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swCurrentUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwPrincipalUserServiceImpl.save.cancel.current"),
                swCurrentDO.getCoinTypeId(),
                swCurrentUser.getEx1(),
                currency.doubleValue() + swCurrentUser.getEx1()
        ));
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
