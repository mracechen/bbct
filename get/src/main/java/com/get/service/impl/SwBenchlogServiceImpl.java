package com.get.service.impl;

import com.common.utils.IDUtils;
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
import com.get.dao.SwBenchlogDao;
import com.get.domain.SwBenchlogDO;
import com.get.service.SwBenchlogService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwBenchlogServiceImpl implements SwBenchlogService {
    @Autowired
    private SwBenchlogDao swBenchlogDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Override
    public SwBenchlogDO get(String tid) {
        return swBenchlogDao.get(tid);
    }

    @Override
    public List<SwBenchlogDO> list(Map<String, Object> map) {
        return swBenchlogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swBenchlogDao.count(map);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save(SwBenchlogDO swBenchlog){
        //扣除兑换使用币种
        SwWalletsDO sourceCoinWallet = swWalletsService.getWallet(swBenchlog.getUserId(), swBenchlog.getSourceCoinId());
        BigDecimal sourceCoinCurrenty = sourceCoinWallet.getCurrency();
        sourceCoinWallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swBenchlog.getSourceNum()))));
        sourceCoinWallet.setUpdateDate(new Date());
        swWalletsService.update(sourceCoinWallet);
        //记录扣除记录
        swAccountRecordService.save(SwAccountRecordDO.create(
                swBenchlog.getUserId(),
                RecordEnum.benchmarking.getType(),
                RecordEnum.benchmarking.getDesc(),
                swBenchlog.getSourceCoinId(),
                -swBenchlog.getSourceNum(),
                sourceCoinCurrenty.doubleValue() - swBenchlog.getSourceNum()
        ));
        //充值目标币种
        SwWalletsDO targetCoinWallet = swWalletsService.getWallet(swBenchlog.getUserId(), swBenchlog.getTargetCoinId());
        BigDecimal targetCoinCurrenty = targetCoinWallet.getCurrency();
        targetCoinWallet.setCurrency(new BigDecimal(String.valueOf(swBenchlog.getTargetNum())));
        targetCoinWallet.setUpdateDate(new Date());
        swWalletsService.update(targetCoinWallet);
        //记录充值记录
        swAccountRecordService.save(SwAccountRecordDO.create(
                swBenchlog.getUserId(),
                RecordEnum.benchmarking.getType(),
                RecordEnum.benchmarking.getDesc(),
                swBenchlog.getTargetCoinId(),
                swBenchlog.getTargetNum(),
                targetCoinCurrenty.doubleValue() + swBenchlog.getTargetNum()
        ));
        return swBenchlogDao.save(swBenchlog);
    }

    @Override
    public int update(SwBenchlogDO swBenchlog) {
        return swBenchlogDao.update(swBenchlog);
    }

    @Override
    public int remove(String tid) {
        SwBenchlogDO swBenchlog = new SwBenchlogDO();
        swBenchlog.setDelFlag(CommonStatic.DELETE);
        swBenchlog.setTid(tid);
        return swBenchlogDao.update(swBenchlog);
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
