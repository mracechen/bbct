package com.get.service.impl;

import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.SwAccountRecordDO;
import com.get.domain.SwPeriodDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwPeriodService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwPeriodUserDao;
import com.get.domain.SwPeriodUserDO;
import com.get.service.SwPeriodUserService;
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
