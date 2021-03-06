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
import com.get.dao.SwPrincipalUserDao;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwPrincipalUserServiceImpl implements SwPrincipalUserService {
    @Autowired
    private SwPrincipalUserDao swPrincipalUserDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwCurrentUserService swCurrentUserService;

    @Autowired
    private SwPeriodUserService swPeriodUserService;

    @Autowired
    private SwPrincipalService swPrincipalService;

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwCurrentService swCurrentService;

    @Autowired
    private SwPeriodService swPeriodService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Override
    public SwPrincipalUserDO get(String tid) {
        return swPrincipalUserDao.get(tid);
    }

    @Override
    public List<SwPrincipalUserDO> getByUserId(Integer userId, Integer status, String delFlag) {
        return swPrincipalUserDao.getByUserId(userId,status,delFlag);
    }

    @Override
    public List<SwPrincipalUserDO> getWaitingResolvePrincipal(Date beginDate, Date endDate) {
        return swPrincipalUserDao.getWaitingResolvePrincipal(beginDate,endDate);
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
    @Transactional(rollbackFor = Exception.class)
    public int save(SwPrincipalUserDO swPrincipalUser) throws Exception{
        SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUser.getPrincipalId());
        SwWalletsDO wallet = swWalletsService.getWallet(swPrincipalUser.getUserId(), swPrincipalDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))));
        wallet.setUpdateDate(new Date());
        wallet.setFrozenAmount(new BigDecimal("0"));
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swPrincipalUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwPrincipalUserServiceImpl.save.purchasing.principal"),
                swPrincipalDO.getCoinTypeId(),
                -swPrincipalDO.getPrincipalNum(),
                currency.doubleValue() -swPrincipalDO.getPrincipalNum()
        ));
        SwUserBasicDO swUserBasicDO = swUserBasicService.get(swPrincipalUser.getUserId());
        //如果他之前已经购买过活币金或者是定币金，那么要将他们的释放时间重置，适配新购买的固币金
        //不仅如此，还要将活币金或者是定币金导加速释放固币金的数量改变，新买的固币金×原来购买活币金或定币金的倍率
        List<SwCurrentUserDO> myCurrent = swCurrentUserService.getByUserId(swUserBasicDO.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        if(myCurrent != null && myCurrent.size() > 1){
            throw new Exception("用户活币金数据异常，用户ID："+swUserBasicDO.getTid());
        }
        if(myCurrent != null && myCurrent.size() == 1){
            SwCurrentUserDO swCurrentUserDO = myCurrent.get(0);
            //用户固币金下次释放额度=固币金基本额度×购买活币金倍率×释放倍率
            //BigDecimal currentAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum())).multiply(new BigDecimal(String.valueOf(swCurrentUserDO.getEx3())));
            SwCurrentDO swCurrentDO = swCurrentService.get(swCurrentUserDO.getCurrentId());
            BigDecimal abstractCurrentNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                    .multiply(new BigDecimal(String.valueOf(swCurrentUserDO.getEx3())));
            //释放数量核算
            if(abstractCurrentNum.compareTo(new BigDecimal(String.valueOf(swCurrentUserDO.getEx1()))) < 0){
                BigDecimal currentAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                        .multiply(new BigDecimal(String.valueOf(swCurrentUserDO.getEx3())))
                        .multiply(new BigDecimal(String.valueOf(swCurrentDO.getAcceleratePercent())))
                        .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
                swCurrentUserDO.setEx2(currentAccelerateNum.intValue());
            }
            swCurrentUserDO.setReleaseTime(swPrincipalUser.getCreateDate());
            swCurrentUserService.update(swCurrentUserDO);
        }
        List<SwPeriodUserDO> myPeriod = swPeriodUserService.getByUserId(swUserBasicDO.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        if(myPeriod != null && myPeriod.size() > 1){
            throw new Exception("用户定币金数据异常，用户ID："+swUserBasicDO.getTid());
        }
        if(myPeriod != null && myPeriod.size() == 1){
            SwPeriodUserDO swPeriodUserDO = myPeriod.get(0);
            //用户固币金下次释放额度=固币金基本额度×购买定币金倍率×释放倍率
            //BigDecimal periodAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum())).multiply(new BigDecimal(String.valueOf(swPeriodUserDO.getEx3())));
            SwPeriodDO swPeriodDO = swPeriodService.get(swPeriodUserDO.getPeriodId());
            BigDecimal abstractPeriodNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                    .multiply(new BigDecimal(String.valueOf(swPeriodUserDO.getEx3())));
            if(abstractPeriodNum.compareTo(new BigDecimal(String.valueOf(swPeriodUserDO.getEx1()))) < 0){
                BigDecimal periodAccelerateNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                        .multiply(new BigDecimal(String.valueOf(swPeriodUserDO.getEx3())))
                        .multiply(new BigDecimal(String.valueOf(swPeriodDO.getAcceleratePercent())))
                        .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
                swPeriodUserDO.setEx2(periodAccelerateNum.intValue());
            }
            swPeriodUserDO.setReleaseTime(swPrincipalUser.getCreateDate());
            swPeriodUserService.update(swPeriodUserDO);
        }
        return swPrincipalUserDao.save(swPrincipalUser);
    }

    @Override
    public int update(SwPrincipalUserDO swPrincipalUser) {
        return swPrincipalUserDao.update(swPrincipalUser);
    }

    @Override
    public int cancel(SwPrincipalUserDO swPrincipalUser) throws Exception {
        SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUser.getPrincipalId());
        SwWalletsDO wallet = swWalletsService.getWallet(swPrincipalUser.getUserId(), swPrincipalDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        //手续费
        BigDecimal chargeNum = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum())).multiply(new BigDecimal(String.valueOf(swPrincipalDO.getChargePercent())));
        //实际返给他的金额
        BigDecimal subtract = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum())).subtract(chargeNum);
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(subtract);
        wallet.setUpdateDate(new Date());
        wallet.setFrozenAmount(new BigDecimal("0"));
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swPrincipalUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwPrincipalUserServiceImpl.save.cancel.principal"),
                swPrincipalDO.getCoinTypeId(),
                subtract.doubleValue(),
                currency.add(subtract).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model).doubleValue()
        ));
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
