package com.common.task;

import com.common.utils.DateUtils;
import com.common.utils.IDUtils;
import com.common.utils.UserListHelper;
import com.common.utils.UserUtils;
import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

/**
 * 【活币金和定币金】给【固币金和优币金和升币金】加速任务
 * */
@EnableScheduling
@Component
public class releaseTask {

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwPrincipalService swPrincipalService;

    @Autowired
    private SwPrincipalUserService swPrincipalUserService;

    @Autowired
    private SwCurrentUserService swCurrentUserService;

    @Autowired
    private SwCurrentService swCurrentService;

    @Autowired
    private SwPeriodUserService swPeriodUserService;

    @Autowired
    private SwPeriodService swPeriodService;

    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

    @Autowired
    private SwEvangelistService swEvangelistService;

    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Autowired
    private SwPartnerService swPartnerService;

    @Autowired
    private SwReleaseRecordService swReleaseRecordService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwRuleDetailService swRuleDetailService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Value("${configs.generateReleaseCode}")
    private String generateReleaseCode;

    @Value("${configs.generateNum}")
    private Integer generateNum;

    private Map<String,Object> userProduct = new HashMap<>();

    Log log = LogFactory.getLog(releaseTask.class);

    @Scheduled(cron = "0 * * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void all(){
        try {
            String formatDateOnMinute = getFormatDateOnMinute(DateUtils.dateAddDays(new Date(),-1));
            Date yesterdayThisTime = DateUtils.dateParse(formatDateOnMinute, "yyyy-MM-dd HH:mm:ss");

//            List<SwPrincipalUserDO> waitingResolvePrincipal = swPrincipalUserService.getWaitingResolvePrincipal();
//            waitingResolvePrincipal.forEach(e->{
//                String now = getFormatDateOnMinute(new Date());
//                String createDate = getFormatDateOnMinute(DateUtils.dateAddDays(e.getCreateDate(),e.getLeftTerm()));
//
//            });

            //活币金加速
            //获取昨天这个点之前未释放的用户的活币金
            List<SwCurrentUserDO> waitingResolveCurrent = swCurrentUserService.getWaitingResolveCurrent(null, yesterdayThisTime);
            waitingResolveCurrent.forEach(e->{
                log.info("用户["+e.getUserId()+ "]的活币金"+e.getTid()+"开始执行加速操作");
                String sign = IDUtils.randomStr();
                String currentId = e.getCurrentId();
                SwCurrentDO swCurrentDO;
                if(userProduct.containsKey(currentId)){
                    swCurrentDO = (SwCurrentDO)userProduct.get(currentId);
                }else{
                    swCurrentDO = swCurrentService.get(currentId);
                    userProduct.put(currentId,swCurrentDO);
                }
                Double acceleratePercent = swCurrentDO.getAcceleratePercent();
                //本次将要释放的数量
                BigDecimal releaseNum = new BigDecimal(e.getEx1().toString()).multiply(new BigDecimal(acceleratePercent.toString()));
                //修改释放时间，释放时间往后推一天（如果查出来的是昨天的数据，往后推一天就是今天了）
                SwCurrentUserDO swCurrentUserDO = new SwCurrentUserDO();
                swCurrentUserDO.setTid(e.getTid());
                Date releaseTime = e.getReleaseTime();
                Date nextReleaseDay = DateUtils.dateAddDays(releaseTime, 1);
                swCurrentUserDO.setReleaseTime(nextReleaseDay);
                swCurrentUserDO.setUpdateDate(new Date());
                swCurrentUserService.update(swCurrentUserDO);
                //判断该用户有没有持有固币金（或者优币金，升币金，三者互斥），有的话加速下放自己的固币金（固币金减少，相应的钱放到钱包，添加释放记录，添加资金记录）
                Integer userId = e.getUserId();
                //给定币金加速
                try {
                    Boolean aBoolean = releasePrincipal(CommonStatic.CURRENT_CAUSE_RELEASE, userId, userId, releaseNum,"活币金",e.getTid(),sign);
                    //如果没有，则给优币金或升币金加速
                    if(!aBoolean){
                        aBoolean = releaseEvangelist(CommonStatic.CURRENT_CAUSE_RELEASE, userId, userId, releaseNum,"活币金",e.getTid(),sign);
                    }
                    if(!aBoolean){
                        aBoolean = releasePartner(CommonStatic.CURRENT_CAUSE_RELEASE, userId, userId, releaseNum,"活币金",e.getTid(),sign);
                    }
                    if(!aBoolean){
                        log.info("用户["+userId+"]的活币金"+e.getTid()+"没有给自己任何产品加速");
                    }
                }catch (Exception e1){
                    log.error("用户["+userId+"]的活币金"+e.getTid()+"给自己加速的时候出现异常！！！");
                    e1.printStackTrace();
                }
                //获取该用户加速范围内的上级用户（包括有固币金，优币金，升币金的用户），重复上面操作
                List<SwRuleDetailDO> byRuleCode = swRuleDetailService.getByRuleCode(generateReleaseCode);
                List<SwUserBasicDO> recommenders = swUserBasicService.findRecommenders(userId, generateNum);
                List<UserListHelper> list = UserUtils.getList(recommenders, swUserBasicService.get(userId));
                Map<Integer, BigDecimal> integerDoubleMap = UserUtils.rewardCommenders(list, byRuleCode, releaseNum.doubleValue());
                integerDoubleMap.entrySet().forEach(s->{
                    Integer key = s.getKey();
                    BigDecimal value = s.getValue();
                    try {
                        //给定币金加速
                        Boolean rBoolean = releasePrincipal(CommonStatic.CURRENT_CAUSE_RELEASE, userId, key, value,"活币金",e.getTid(),sign);
                        //如果没有，则给优币金或升币金加速
                        if(!rBoolean){
                            rBoolean = releaseEvangelist(CommonStatic.CURRENT_CAUSE_RELEASE, userId, key,value,"活币金",e.getTid(),sign);
                        }
                        if(!rBoolean){
                            rBoolean = releasePartner(CommonStatic.CURRENT_CAUSE_RELEASE, userId, key,value,"活币金",e.getTid(),sign);
                        }
                        if(!rBoolean){
                            log.info("用户["+userId+"]的活币金"+e.getTid()+"没有给用户["+key+"]的任何产品加速");
                        }
                    }catch (Exception e2){
                        log.error("用户["+userId+"]的活币金"+e.getTid()+"给用户["+key+"]加速的时候出现异常");
                        e2.printStackTrace();
                    }
                });
            });

            //定币金加速
            //获取昨天这个点之前未释放的定币金
            List<SwPeriodUserDO> waitingResolvePeriod = swPeriodUserService.getWaitingResolvePeriod(null, yesterdayThisTime);
            waitingResolvePeriod.forEach(e->{
                log.info("用户["+e.getUserId()+ "]的定币金"+e.getTid()+"开始执行加速操作");
                //修改释放时间，释放时间往后推一天（如果查出来的是昨天的数据，往后推一天就是今天了）
                //判断该用户有没有持有固币金（或者优币金，升币金，三者互斥），有的话加速下放自己的固币金（固币金减少，相应的钱放到钱包，添加释放记录，添加资金记录）
                //获取该用户加速范围内的上级用户（包括有固币金，优币金，升币金的用户），重复上面操作
                //判断是否到期（根据释放时间判断？根据创建时间判断？），到期就将该定币金改为已释放完
                String sign = IDUtils.randomStr();
                String periodId = e.getPeriodId();
                SwPeriodDO swPeriodDO;
                if(userProduct.containsKey(periodId)){
                    swPeriodDO = (SwPeriodDO)userProduct.get(periodId);
                }else{
                    swPeriodDO = swPeriodService.get(periodId);
                    userProduct.put(periodId,swPeriodDO);
                }
                Double acceleratePercent = swPeriodDO.getAcceleratePercent();
                //本次将要释放的数量
                BigDecimal releaseNum = new BigDecimal(e.getEx1().toString()).multiply(new BigDecimal(acceleratePercent.toString()));
                //判断该用户有没有持有固币金（或者优币金，升币金，三者互斥），有的话加速下放自己的固币金（固币金减少，相应的钱放到钱包，添加释放记录，添加资金记录）
                Integer userId = e.getUserId();
                //给定币金加速
                try {
                    Boolean aBoolean = releasePrincipal(CommonStatic.PERIOD_CAUSE_RELEASE, userId, userId, releaseNum,"定币金",e.getTid(),sign);
                    //如果没有，则给优币金或升币金加速
                    if(!aBoolean){
                        aBoolean = releaseEvangelist(CommonStatic.PERIOD_CAUSE_RELEASE, userId, userId, releaseNum,"定币金",e.getTid(),sign);
                    }
                    if(!aBoolean){
                        aBoolean = releasePartner(CommonStatic.PERIOD_CAUSE_RELEASE, userId, userId, releaseNum,"定币金",e.getTid(),sign);
                    }
                    if(!aBoolean){
                        log.info("用户["+userId+"]的活币金没有给自己任何产品加速");
                    }
                }catch (Exception e1){
                    log.error("用户["+userId+"]的活币金给自己加速的时候出现异常！！！");
                    e1.printStackTrace();
                }
                //获取该用户加速范围内的上级用户（包括有固币金，优币金，升币金的用户），重复上面操作
                List<SwRuleDetailDO> byRuleCode = swRuleDetailService.getByRuleCode(generateReleaseCode);
                List<SwUserBasicDO> recommenders = swUserBasicService.findRecommenders(userId, generateNum);
                List<UserListHelper> list = UserUtils.getList(recommenders, swUserBasicService.get(userId));
                Map<Integer, BigDecimal> integerDoubleMap = UserUtils.rewardCommenders(list, byRuleCode, releaseNum.doubleValue());
                integerDoubleMap.entrySet().forEach(s->{
                    Integer key = s.getKey();
                    BigDecimal value = s.getValue();
                    try {
                        //给定币金加速
                        Boolean rBoolean = releasePrincipal(CommonStatic.PERIOD_CAUSE_RELEASE, userId, key, value,"定币金",e.getTid(),sign);
                        //如果没有，则给优币金或升币金加速
                        if(!rBoolean){
                            rBoolean = releaseEvangelist(CommonStatic.PERIOD_CAUSE_RELEASE, userId, key,value,"定币金",e.getTid(),sign);
                        }
                        if(!rBoolean){
                            rBoolean = releasePartner(CommonStatic.PERIOD_CAUSE_RELEASE, userId, key,value,"定币金",e.getTid(),sign);
                        }
                        if(!rBoolean){
                            log.info("用户["+userId+"]的定币金没有给用户["+key+"]的任何产品加速");
                        }
                    }catch (Exception e2){
                        log.error("用户["+userId+"]的定币金给用户["+key+"]加速的时候出现异常");
                        e2.printStackTrace();
                    }
                });
                //修改释放时间，释放时间往后推一天（如果查出来的是昨天的数据，往后推一天就是今天了）
                SwPeriodUserDO swPeriodUserDO = new SwPeriodUserDO();
                swPeriodUserDO.setTid(e.getTid());
                Date releaseTime = e.getReleaseTime();
                Date nextReleaseDay = DateUtils.dateAddDays(releaseTime, 1);
                swPeriodUserDO.setReleaseTime(nextReleaseDay);
                swPeriodUserDO.setUpdateDate(new Date());
                try {
                    //计算总共释放的天数是否达到或者超过了该定币金项目的周期，是的话就将该项目到期，且将钱放回钱包
                    int days = DateUtils.dateBetween(swPeriodUserDO.getReleaseTime(), swPeriodUserDO.getCreateDate());
                    if(days >= swPeriodDO.getPeriodTerm()){
                        //改为释放完成
                        swPeriodUserDO.setStatus(CommonStatic.RELEASED);
                        //把钱转入钱包
                        SwWalletsDO wallet = swWalletsService.getWallet(swPeriodUserDO.getUserId(), swPeriodDO.getCoinTypeId());
                        BigDecimal curcurrency = wallet.getCurrency();
                        wallet.setCurrency(new BigDecimal(swPeriodUserDO.getEx1().toString()));
                        wallet.setUpdateDate(new Date());
                        swWalletsService.update(wallet);
                        //记录资金明细
                        swAccountRecordService.save(SwAccountRecordDO.create(
                                swPeriodUserDO.getUserId(),
                                RecordEnum.period_normal_release.getType(),
                                languagei18nUtils.getMessage(RecordEnum.period_normal_release.getDesc()),
                                swPeriodDO.getCoinTypeId(), releaseNum.doubleValue(),
                                curcurrency.add(releaseNum).doubleValue()));
                    }
                } catch (ParseException e1) {
                    log.error("计算定币金是否到期时出错！");
                    e1.printStackTrace();
                }
                Date date = DateUtils.dateAddDays(e.getCreateDate(), swPeriodDO.getPeriodTerm());
                //定币金到期
                if(DateUtils.dateCompare(new Date(),date) > 0){
                    swPeriodUserDO.setStatus(CommonStatic.RELEASED);
                }
                swPeriodUserService.update(swPeriodUserDO);
            });
        }catch (Exception e){
            log.error("定时任务异常！！！");
            e.printStackTrace();
        }
    }

    /**
     * 释放固币金
     * @param targetUserId 释放目标用户id
     * @param causeUserId 导致释放发生的用户id
     * @param releaseNum 释放优币金数量
     * @param causeTypeName 导致释放的类型
     * @param sign 释放唯一标识
     * @param causeId 导致释放的项目id
     * */
    private Boolean releasePrincipal(Integer type,Integer causeUserId, Integer targetUserId, BigDecimal releaseNum, String causeTypeName, String causeId, String sign) throws Exception{
        //获取这个人的固币金
        SwPrincipalUserDO swPrincipalUserDO = swPrincipalUserService.getByUserId(targetUserId, CommonStatic.NO_RELEASE,CommonStatic.NOTDELETE);
        if(swPrincipalUserDO != null){
            SwPrincipalDO swPrincipalDO;
            //将固币金项目放入内存
            String principalId = swPrincipalUserDO.getPrincipalId();
            if(userProduct.containsKey(principalId)){
                swPrincipalDO = (SwPrincipalDO)userProduct.get(principalId);
            }else{
                swPrincipalDO = swPrincipalService.get(principalId);
                userProduct.put(principalId,swPrincipalDO);
            }
            BigDecimal leftNum = new BigDecimal(swPrincipalUserDO.getLeftNum().toString());
            //如果剩余金额大于本次释放的金额，则剩余金额减去此次释放金额，否则全部扣掉
            if(leftNum.compareTo(releaseNum) > 0){
                //固币金减少释放数量
                swPrincipalUserDO.setLeftNum(new BigDecimal("0").subtract(releaseNum).doubleValue());
            }else{
                //固币金全部释放，且状态改为已释放完
                swPrincipalUserDO.setLeftNum(-swPrincipalUserDO.getLeftNum());
                swPrincipalUserDO.setStatus(CommonStatic.RELEASED);
                //标记此次释放的数量等于固币金剩余的全部数量
                releaseNum = new BigDecimal(String.valueOf(swPrincipalUserDO.getLeftNum()));
            }
            swPrincipalUserDO.setLeftTerm(-1);
            SwWalletsDO wallet = swWalletsService.getWallet(targetUserId, swPrincipalDO.getCoinTypeId());
            //没有被加速完成，而是到期了，则全部释放
            if(swPrincipalUserDO.getLeftTerm() < 0){
                BigDecimal curcurrency = wallet.getCurrency();
                if(wallet != null){
                    wallet.setCurrency(new BigDecimal(String.valueOf(swPrincipalUserDO.getLeftNum())));
                    wallet.setUpdateDate(new Date());
                    swWalletsService.update(wallet);
                    //记录资金明细
                    swAccountRecordService.save(SwAccountRecordDO.create(
                            targetUserId,
                            RecordEnum.principal_normal_release.getType(),
                            languagei18nUtils.getMessage(RecordEnum.principal_normal_release.getDesc()),
                            swPrincipalDO.getCoinTypeId(),
                            swPrincipalUserDO.getLeftNum(),
                            curcurrency.doubleValue() + swPrincipalUserDO.getLeftNum()));
                    //记录释放记录
                    swReleaseRecordService.save(SwReleaseRecordDO.create(
                            swPrincipalUserDO.getTid(),
                            causeId,
                            releaseNum.doubleValue(),
                            CommonStatic.CURRENT_CAUSE_RELEASE,
                            causeUserId,
                            targetUserId,
                            CommonStatic.RELEASE_TARGET_PRINCIPAL));
                    swPrincipalUserDO.setStatus(CommonStatic.RELEASED);
                    swPrincipalUserDO.setLeftNum(swPrincipalUserDO.getLeftNum());
                    log.info("sign："+sign+",用户["+targetUserId+"]的--固币金"+swPrincipalUserDO.getTid()+"--到期全部释放");
                }
            }
            //更新用户的固币金
            swPrincipalUserDO.setUpdateDate(new Date());
            swPrincipalUserService.update(swPrincipalUserDO);
            //把固币金释放的金额放入钱包
            BigDecimal curcurrency = wallet.getCurrency();
            if(wallet != null){
                wallet.setCurrency(releaseNum);
                wallet.setUpdateDate(new Date());
                swWalletsService.update(wallet);
                //记录资金明细
                swAccountRecordService.save(SwAccountRecordDO.create(
                        targetUserId,
                        RecordEnum.principal_accelerate.getType(),
                        languagei18nUtils.getMessage(RecordEnum.principal_accelerate.getDesc()),
                        swPrincipalDO.getCoinTypeId(), releaseNum.doubleValue(),
                        curcurrency.add(releaseNum).doubleValue()));
                //记录释放记录
                swReleaseRecordService.save(SwReleaseRecordDO.create(
                        swPrincipalUserDO.getTid(),
                        causeId,
                        releaseNum.doubleValue(),
                        CommonStatic.CURRENT_CAUSE_RELEASE,
                        causeUserId,
                        targetUserId,
                        CommonStatic.RELEASE_TARGET_PRINCIPAL));
                log.info("sign："+sign+",用户["+causeUserId+"]的--"+causeTypeName+"["+causeId+"]--给用户["+targetUserId+"]的--固币金"+swPrincipalUserDO.getTid()+"--加速释放："+releaseNum.doubleValue());
                return true;
            }
            log.error("用户钱包异常");
        }
        return false;
    }

    /**
     * 释放优币金
     * @param targetUserId 释放目标用户id
     * @param causeUserId 导致释放发生的用户id
     * @param releaseNum 释放优币金数量
     * @param causeTypeName 导致释放的类型
     * @param sign 释放唯一标识
     * @param causeId 导致释放的项目id
     * */
    private Boolean releaseEvangelist(Integer type, Integer causeUserId, Integer targetUserId, BigDecimal releaseNum, String causeTypeName, String causeId, String sign) throws Exception{
        log.info("释放用户");
        //获取这个人的优币金
        SwEvangelistUserDO swEvangelistUserDO = swEvangelistUserService.getByUserId(targetUserId, CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        if(swEvangelistUserDO != null){
            SwEvangelistDO swEvangelistDO;
            //将优币金项目放入内存
            String evangelistId = swEvangelistUserDO.getEvangelistId();
            if(userProduct.containsKey(evangelistId)){
                swEvangelistDO = (SwEvangelistDO)userProduct.get(evangelistId);
            }else{
                swEvangelistDO = swEvangelistService.get(evangelistId);
                userProduct.put(evangelistId,swEvangelistDO);
            }
            BigDecimal leftNum = new BigDecimal(swEvangelistUserDO.getLeftNum().toString());
            //如果剩余金额大于本次释放的金额，则剩余金额减去此次释放金额，否则全部扣掉
            if(leftNum.compareTo(releaseNum) > 0){
                //优币金减少释放数量
                swEvangelistUserDO.setLeftNum(new BigDecimal("0").subtract(releaseNum).doubleValue());
            }else{
                //优币金全部释放，且状态改为已释放完
                swEvangelistUserDO.setLeftNum(-swEvangelistUserDO.getLeftNum());
                swEvangelistUserDO.setStatus(CommonStatic.RELEASED);
                //标记此次释放的数量等于优币金剩余的全部数量
                releaseNum = new BigDecimal(String.valueOf(swEvangelistUserDO.getLeftNum()));
            }
            //更新用户的优币金
            swEvangelistUserService.update(swEvangelistUserDO);
            //把优币金释放的金额放入钱包
            SwWalletsDO wallet = swWalletsService.getWallet(targetUserId, swEvangelistDO.getCoinTypeId());
            BigDecimal curcurrency = wallet.getCurrency();
            if(wallet != null){
                wallet.setCurrency(releaseNum);
                wallet.setUpdateDate(new Date());
                swWalletsService.update(wallet);
                //记录资金明细
                swAccountRecordService.save(SwAccountRecordDO.create(
                        targetUserId,
                        RecordEnum.evangelist_accelerate.getType(),
                        languagei18nUtils.getMessage(RecordEnum.evangelist_accelerate.getDesc()),
                        swEvangelistDO.getCoinTypeId(), releaseNum.doubleValue(),
                        curcurrency.add(releaseNum).doubleValue()));
                //记录优币金释放记录
                swReleaseRecordService.save(SwReleaseRecordDO.create(
                        swEvangelistUserDO.getTid(),
                        causeId,
                        releaseNum.doubleValue(),
                        CommonStatic.CURRENT_CAUSE_RELEASE,
                        causeUserId,
                        targetUserId,
                        CommonStatic.RELEASE_TARGET_EVANGELIST));
                log.info("sign："+sign+",用户["+causeUserId+"]的--"+causeTypeName+"["+causeId+"]--给用户["+targetUserId+"]的--固币金"+swEvangelistUserDO.getTid()+"--加速释放："+releaseNum.doubleValue());
                return true;
            }
        }
        return false;
    }

    /**
     * 释放升币金
     * @param targetUserId 释放目标用户id
     * @param causeUserId 导致释放发生的用户id
     * @param releaseNum 释放优币金数量
     * @param causeTypeName 导致释放的类型
     * @param sign 释放唯一标识
     * @param causeId 导致释放的项目id
     * */
    private Boolean releasePartner(Integer type, Integer causeUserId, Integer targetUserId, BigDecimal releaseNum, String causeTypeName, String causeId, String sign) throws Exception{
        //获取这个人的升币金
        SwPartnerUserDO swPartnerUserDO = swPartnerUserService.getByUserId(targetUserId, CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        if(swPartnerUserDO != null){
            SwPartnerDO swPartnerDO;
            //将固币金项目放入内存
            String partnerId = swPartnerUserDO.getPartnerId();
            if(userProduct.containsKey(partnerId)){
                swPartnerDO = (SwPartnerDO)userProduct.get(partnerId);
            }else{
                swPartnerDO = swPartnerService.get(partnerId);
                userProduct.put(partnerId,swPartnerDO);
            }
            BigDecimal leftNum = new BigDecimal(swPartnerUserDO.getLeftNum().toString());
            //如果剩余金额大于本次释放的金额，则剩余金额减去此次释放金额，否则全部扣掉
            if(leftNum.compareTo(releaseNum) > 0){
                //升币金减少释放数量
                swPartnerUserDO.setLeftNum(new BigDecimal("0").subtract(releaseNum).doubleValue());
            }else{
                //升币金全部释放，且状态改为已释放完
                swPartnerUserDO.setLeftNum(-swPartnerUserDO.getLeftNum());
                swPartnerUserDO.setStatus(CommonStatic.RELEASED);
                //标记此次释放的数量等于升币金剩余的全部数量
                releaseNum = new BigDecimal(String.valueOf(swPartnerUserDO.getLeftNum()));
            }
            //更新用户的升币金
            swPartnerUserService.update(swPartnerUserDO);
            //把升币金释放的金额放入钱包
            SwWalletsDO wallet = swWalletsService.getWallet(targetUserId, swPartnerDO.getCoinTypeId());
            BigDecimal curcurrency = wallet.getCurrency();
            if(wallet != null){
                wallet.setCurrency(releaseNum);
                wallet.setUpdateDate(new Date());
                swWalletsService.update(wallet);
                //记录资金明细
                swAccountRecordService.save(SwAccountRecordDO.create(
                        targetUserId,
                        RecordEnum.partner_accelerate.getType(),
                        languagei18nUtils.getMessage(RecordEnum.partner_accelerate.getDesc()),
                        swPartnerDO.getCoinTypeId(), releaseNum.doubleValue(),
                        curcurrency.add(releaseNum).doubleValue()));
                //记录升币金释放记录
                swReleaseRecordService.save(SwReleaseRecordDO.create(
                        swPartnerUserDO.getTid(),
                        causeId,
                        releaseNum.doubleValue(),
                        type,
                        causeUserId,
                        targetUserId,
                        CommonStatic.RELEASE_TARGET_PARTNER));
                log.info("sign："+sign+",用户["+causeUserId+"]的--"+causeTypeName+"["+causeId+"]--给用户["+targetUserId+"]的--固币金"+swPartnerUserDO.getTid()+"--加速释放："+releaseNum.doubleValue());
                return true;
            }
        }
        return false;
    }

    private String getFormatDateOnMinute(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        return year +
                "-" + (month < 10 ? "0" + month : month) +
                "-" + (day < 10 ? "0" + day : day) +
                " " + (hour < 10 ? "0" + hour : hour) +
                ":" + (minute < 10 ? "0" + minute : minute) +
                ":" + "00";
    }
}
