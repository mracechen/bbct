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
import com.get.dao.SwPeriodUserDao;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwPeriodUserServiceImpl implements SwPeriodUserService {

    @Autowired
    private SwPeriodService swPeriodService;

    @Autowired
    private SwPeriodUserDao swPeriodUserDao;

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
    public SwPeriodUserDO get(String tid) {
        return swPeriodUserDao.get(tid);
    }

    @Override
    public List<SwPeriodUserDO> list(Map<String, Object> map) {
        return swPeriodUserDao.list(map);
    }

    @Override
    public List<SwPeriodUserDO> getWaitingResolvePeriod(Date beginDate, Date endDate) {
        return swPeriodUserDao.getWaitingResolvePeriod(beginDate,endDate);
    }

    @Override
    public List<SwPeriodUserDO> getByUserId(Integer userId, Integer status, String delFlag){
        return swPeriodUserDao.getByUserId(userId,status,delFlag);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swPeriodUserDao.count(map);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save(SwPeriodUserDO swPeriodUser) throws Exception{
        SwPeriodDO swPeriodDO = swPeriodService.get(swPeriodUser.getPeriodId());
        List<SwPrincipalUserDO> myPrincipal = swPrincipalUserService.getByUserId(swPeriodUser.getUserId(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        SwPrincipalUserDO swPrincipalUserDO = myPrincipal.get(0);
        SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUserDO.getPrincipalId());
        BigDecimal periodAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                .multiply(new BigDecimal(String.valueOf(swPeriodUser.getEx3())))
                .multiply(new BigDecimal(String.valueOf(swPeriodDO.getAcceleratePercent())))
                .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
        swPeriodUser.setEx2(periodAccelerateNum.intValue());
        if(swPeriodDO == null){
            throw new Exception("定币金异常");
        }
        SwWalletsDO wallet = swWalletsService.getWallet(swPeriodUser.getUserId(), swPeriodDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swPeriodUser.getEx1()))));
        wallet.setUpdateDate(new Date());
        wallet.setFrozenAmount(new BigDecimal("0"));
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swPeriodUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwPeriodUserServiceImpl.save.purchasing.period"),
                swPeriodDO.getCoinTypeId(),
                -swPeriodUser.getEx1(),
                currency.doubleValue() - swPeriodUser.getEx1()
        ));
        return swPeriodUserDao.save(swPeriodUser);
    }

    @Override
    public int update(SwPeriodUserDO swPeriodUser) {
        return swPeriodUserDao.update(swPeriodUser);
    }

    @Override
    public int remove(String tid) {
        SwPeriodUserDO swPeriodUser = new SwPeriodUserDO();
        swPeriodUser.setDelFlag(CommonStatic.DELETE);
        swPeriodUser.setTid(tid);
        return swPeriodUserDao.update(swPeriodUser);
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
