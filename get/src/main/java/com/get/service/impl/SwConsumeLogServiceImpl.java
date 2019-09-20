package com.get.service.impl;

import com.common.utils.StringUtils;
import com.common.utils.i18n.Languagei18nUtils;
import com.get.dao.SwConsumeLogDao;
import com.get.dao.SwUserBasicDao;
import com.get.dao.SwWalletsDao;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class SwConsumeLogServiceImpl implements SwConsumeLogService {
    @Autowired
    private SwConsumeLogDao swConsumeLogDao;

    @Autowired
    private SwWalletsDao swWalletsDao;

    @Autowired
    private SwUserBasicDao swUserBasicDao;

    @Autowired
    private SwCoinTypeService swCoinTypeService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwTransferRecordService swTransferRecordService;

    @Override
    public SwConsumeLogDO get(String tid) {
        return swConsumeLogDao.get(tid);
    }

    @Override
    public List<SwConsumeLogDO> list(Map<String, Object> map) {
        return swConsumeLogDao.list(map);
    }
    @Override
    public List<SwConsumeLogDO> checkDrawCondition(Date beginDate, Date endDate, Integer payUser) {
        return swConsumeLogDao.checkDrawCondition(beginDate,endDate,payUser);
    }

    @Override
    public List<SwConsumeLogDO> list1(Map<String, Object> map) {
        return swConsumeLogDao.list1(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swConsumeLogDao.count(map);
    }

    @Override
    public int save(SwConsumeLogDO swConsumeLog) {
        return swConsumeLogDao.save(swConsumeLog);
    }

    @Override
    public int update(SwConsumeLogDO swConsumeLog) {
        return swConsumeLogDao.update(swConsumeLog);
    }

    @Override
    public int remove(String tid) {
        SwConsumeLogDO swConsumeLog = new SwConsumeLogDO();
        swConsumeLog.setDelFlag(CommonStatic.DELETE);
        swConsumeLog.setTid(tid);
        return swConsumeLogDao.update(swConsumeLog);
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
    public String transfer(SwUserBasicDO user, Integer userId, double amount, String coinId, String remark, String tradingPassword) {

        if(StringUtils.isBlank(userId) || StringUtils.isBlank(amount) || StringUtils.isBlank(coinId)){
            return "system.failed.operation";
        }
        Boolean aBoolean = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), tradingPassword);
        if (!aBoolean) {
            return "system.password.error";
        }
        //转账
        SwWalletsDO walletsDO = swWalletsService.getWallet(user.getTid(), coinId);
        if (walletsDO == null) {
            return "system.wallet.error";
        }
        if (walletsDO.getCurrency() == null || walletsDO.getCurrency().doubleValue() < amount) {
            return "system.balance.not.enough";
        }
        SwUserBasicDO swUserBasicDOReceive = swUserBasicService.get(userId);
        SwWalletsDO walletsDOReceive = swWalletsService.getWallet(swUserBasicDOReceive.getTid(), coinId);
        if (walletsDOReceive == null) {
            return "system.wallet.error";
        }
        //转账记录
        swTransferRecordService.save(SwTransferRecordDO.create(user.getTid(),userId,coinId,amount,StringUtils.isBlank(remark)?"transfer to - "+userId:remark,CommonStatic.TRANSFER));
        //收款记录
        swTransferRecordService.save(SwTransferRecordDO.create(user.getTid(),userId,coinId,amount,StringUtils.isBlank(remark)?"receive from - "+user.getTid():remark,CommonStatic.RECEIVE));

        //记录转账账户流水
        remark = languagei18nUtils.getMessage("system.transfer",swUserBasicDOReceive.getUsername());
        SwAccountRecordDO accountRecordTransfer = SwAccountRecordDO.create(
                user.getTid(),
                RecordEnum.transfer.getType(),
                remark,
                coinId,
                -amount,
                walletsDO.getCurrency().doubleValue() + (-amount)
        );
        swAccountRecordService.save(accountRecordTransfer);

        //记录收款账户流水
        String receiveRemark = languagei18nUtils.getMessage("system.receivables",user.getUsername());
        SwAccountRecordDO accountRecordReceive = SwAccountRecordDO.create(
                swUserBasicDOReceive.getTid(),
                RecordEnum.receivables.getType(),
                receiveRemark,
                coinId,
                amount,
                walletsDOReceive.getCurrency().doubleValue() + amount
        );
        swAccountRecordService.save(accountRecordReceive);
        walletsDO.setCurrency(new BigDecimal( -amount).setScale(NumberStatic.BigDecimal_Scale_Num, NumberStatic.BigDecimal_Scale_Model));
        int updateTransfer = swWalletsService.update(walletsDO);
        walletsDOReceive.setCurrency(new BigDecimal(amount).setScale(NumberStatic.BigDecimal_Scale_Num, NumberStatic.BigDecimal_Scale_Model));
        int updateReceive = swWalletsService.update(walletsDOReceive);
        if(updateTransfer < 1 || updateReceive < 1){
            return "system.failed.operation";
        }else{
            return "";
        }
    }

    @Override
    public List<SwConsumeLogDO> getConsumeRecord(Map<String, Object> map) {
        return swConsumeLogDao.getConsumeRecord(map);
    }

    @Override
    public SwConsumeLogDO getConsumeRecordDetail(String consumeId) {
        return swConsumeLogDao.getConsumeRecordDetail(consumeId);
    }
}
