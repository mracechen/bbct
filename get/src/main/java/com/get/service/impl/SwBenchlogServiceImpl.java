package com.get.service.impl;

import com.common.utils.IDUtils;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.get.dao.SwBenchlogDao;
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
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwEvangelistService swEvangelistService;

    @Autowired
    private SwPartnerService swPartnerService;

    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

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
    public int save(SwBenchlogDO swBenchlog) throws Exception{
        SwUserBasicDO swUserBasicDO = swUserBasicService.get(swBenchlog.getUserId());
        //扣除兑换使用币种
        SwWalletsDO sourceCoinWallet = swWalletsService.getWallet(swBenchlog.getUserId(), swBenchlog.getSourceCoinId());
        BigDecimal sourceCoinCurrenty = sourceCoinWallet.getCurrency();
        sourceCoinWallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swBenchlog.getSourceNum()))));
        sourceCoinWallet.setUpdateDate(new Date());
        sourceCoinWallet.setFrozenAmount(new BigDecimal("0"));
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
        targetCoinWallet.setFrozenAmount(new BigDecimal("0"));
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
        //是布道者的话，就把对标得到的bbct全部自动给他买优币金，是合伙人的话，就把对标得到的bbct全部自动给他买升币金
        if(swUserBasicDO.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
            Map<String,Object> map = new HashMap<>();
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwEvangelistDO> list = swEvangelistService.list(map);
            if(list == null || list.size() != 1){
                throw new Exception("优币金异常，对标失败！");
            }
            SwEvangelistDO swEvangeDO = list.get(0);
            //校验对标所得bbct数量和购买优币金的金额数目是否匹配
            if(!swBenchlog.getTargetNum().equals(swEvangeDO.getEvangelistNum())){
                throw new Exception("对标金额异常，自动购买优币金失败！");
            }
            SwEvangelistUserDO swEvangelistUserDO = new SwEvangelistUserDO();
            swEvangelistUserDO.setTid(IDUtils.randomStr());
            swEvangelistUserDO.setCreateDate(new Date());
            swEvangelistUserDO.setUpdateDate(new Date());
            swEvangelistUserDO.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistUserDO.setUserId(swBenchlog.getUserId());
            swEvangelistUserDO.setStatus(CommonStatic.NO_RELEASE);
            swEvangelistUserDO.setEvangelistId(swEvangeDO.getTid());
            BigDecimal multiply = new BigDecimal(String.valueOf(swEvangeDO.getEvangelistNum() == null?"0":swEvangeDO.getEvangelistNum()))
                    .multiply(new BigDecimal(String.valueOf(swEvangeDO.getPercent() == null?"0":swEvangeDO.getPercent())))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            swEvangelistUserDO.setTotalNum(multiply.doubleValue());
            swEvangelistUserDO.setLeftNum(multiply.doubleValue());
            swEvangelistUserService.save(swEvangelistUserDO);
        }else if(swUserBasicDO.getUserType().equals(CommonStatic.USER_TYPE_PARTNER)){
            Map<String,Object> map = new HashMap<>();
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwPartnerDO> list = swPartnerService.list(map);
            if(list == null || list.size() != 1){
                throw new Exception("升币金异常，对标失败！");
            }
            SwPartnerDO swPartnerDO = list.get(0);
            //校验对标所得bbct数量和购买升币金的金额数目是否匹配
            if(!swBenchlog.getTargetNum().equals(swPartnerDO.getPartnerNum())){
                throw new Exception("对标金额异常，自动购买升币金失败！");
            }
            SwPartnerUserDO swPartnerUser = new SwPartnerUserDO();
            swPartnerUser.setTid(IDUtils.randomStr());
            swPartnerUser.setCreateDate(new Date());
            swPartnerUser.setUpdateDate(new Date());
            swPartnerUser.setDelFlag(CommonStatic.NOTDELETE);
            swPartnerUser.setUserId(swBenchlog.getUserId());
            swPartnerUser.setPartnerId(swPartnerDO.getTid());
            swPartnerUser.setStatus(CommonStatic.NO_RELEASE);
            double userTotal = new BigDecimal(
                    String.valueOf(swPartnerDO.getPartnerNum() == null ? 0 : swPartnerDO.getPartnerNum())
            ).multiply(
                    new BigDecimal(String.valueOf(swPartnerDO.getPercent() == null ? 0 : swPartnerDO.getPercent()))
            ).doubleValue();
            swPartnerUser.setTotalNum(userTotal);
            swPartnerUser.setLeftNum(userTotal);
            swPartnerUserService.save(swPartnerUser);
        }
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
