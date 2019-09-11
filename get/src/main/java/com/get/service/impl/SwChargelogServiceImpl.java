package com.get.service.impl;

import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.SwAccountRecordDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwChargelogDao;
import com.get.domain.SwChargelogDO;
import com.get.service.SwChargelogService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwChargelogServiceImpl implements SwChargelogService {
    @Autowired
    private SwChargelogDao swChargelogDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Override
    public SwChargelogDO get(String tid) {
        return swChargelogDao.get(tid);
    }

    @Override
    public SwChargelogDO getByTxid(String txid) {
        return swChargelogDao.getByTxid(txid);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void confirmCharge(SwChargelogDO swChargelogDO) throws Exception{
        if(swChargelogDO.getStatus().equals(CommonStatic.TRANSFER_SUCCESS)){
            BigDecimal amount = swChargelogDO.getAmount();
            String coinId = swChargelogDO.getCoinId();
            SwWalletsDO wallet = swWalletsService.getWallet(swChargelogDO.getUserId(), coinId);
            if(wallet == null){
                throw new Exception("钱包异常");
            }
            BigDecimal currency = wallet.getCurrency();
            wallet.setCurrency(amount);
            wallet.setUpdateDate(new Date());
            swWalletsService.update(wallet);
            swAccountRecordService.save(SwAccountRecordDO.create(
                    swChargelogDO.getUserId(),
                    RecordEnum.charge.getType(),
                    RecordEnum.charge.getDesc(),
                    coinId,
                    amount.doubleValue(),
                    currency.add(amount).doubleValue()
            ));
        }
        swChargelogDao.update(swChargelogDO);
    }

    @Override
    public List<SwChargelogDO> list(Map<String, Object> map) {
        return swChargelogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swChargelogDao.count(map);
    }

    @Override
    public int save(SwChargelogDO swChargelog) {
        return swChargelogDao.save(swChargelog);
    }

    @Override
    public int update(SwChargelogDO swChargelog) {
        return swChargelogDao.update(swChargelog);
    }

    @Override
    public int remove(String tid) {
        SwChargelogDO swChargelog = new SwChargelogDO();
        swChargelog.setDelFlag(CommonStatic.DELETE);
        swChargelog.setTid(tid);
        return swChargelogDao.update(swChargelog);
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
