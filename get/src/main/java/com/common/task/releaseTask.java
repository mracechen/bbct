package com.common.task;

import com.common.utils.DateUtils;
import com.common.utils.UserListHelper;
import com.common.utils.UserUtils;
import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

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

    @Scheduled(cron = "0/5 * * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void all(){
        Map<String,Object> userProduct = new HashMap<>();
        try {
            String formatDateOnMinute = getFormatDateOnMinute(DateUtils.dateAddDays(new Date(),-1));
            Date yesterdayThisTime = DateUtils.dateParse(formatDateOnMinute, "yyyy-MM-dd HH:mm:ss");

            //获取昨天这个点之前未释放的用户的活币金
            List<SwCurrentUserDO> waitingResolveCurrent = swCurrentUserService.getWaitingResolveCurrent(null, yesterdayThisTime);
            waitingResolveCurrent.forEach(e->{
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
                swCurrentUserService.update(swCurrentUserDO);
                //判断该用户有没有持有固币金（或者优币金，升币金，三者互斥），有的话加速下放自己的固币金（固币金减少，相应的钱放到钱包，添加释放记录，添加资金记录）
                Integer userId = e.getUserId();
                //给定币金加速
                Boolean aBoolean = releasePrincipal(userId, releaseNum);
                //如果没有，则给优币金或升币金加速
                if(!aBoolean){

                }
                //获取该用户加速范围内的上级用户（包括有固币金，优币金，升币金的用户），重复上面操作
                List<SwRuleDetailDO> byRuleCode = swRuleDetailService.getByRuleCode(generateReleaseCode);
                List<SwUserBasicDO> recommenders = swUserBasicService.findRecommenders(userId, generateNum);
                List<UserListHelper> list = UserUtils.getList(recommenders, swUserBasicService.get(userId));
                Map<Integer, BigDecimal> integerDoubleMap = UserUtils.rewardCommenders(list, byRuleCode, releaseNum.doubleValue());
                integerDoubleMap.entrySet().forEach(s->{
                    Integer key = s.getKey();
                    BigDecimal value = s.getValue();
                    //给定币金加速
                    Boolean rBoolean = releasePrincipal(key, value);
                    //如果没有，则给优币金或升币金加速
                    if(!aBoolean){

                    }
                });
            });


            //获取昨天这个点之前未释放的定币金
            List<SwPeriodUserDO> waitingResolvePeriod = swPeriodUserService.getWaitingResolvePeriod(null, yesterdayThisTime);
            waitingResolvePeriod.forEach(e->{
                //修改释放时间，释放时间往后推一天（如果查出来的是昨天的数据，往后推一天就是今天了）
                //判断该用户有没有持有固币金（或者优币金，升币金，三者互斥），有的话加速下放自己的固币金（固币金减少，相应的钱放到钱包，添加释放记录，添加资金记录）
                //获取该用户加速范围内的上级用户（包括有固币金，优币金，升币金的用户），重复上面操作
                //判断是否到期（根据释放时间判断？根据创建时间判断？），到期就将该定币金改为已释放完
            });

            System.out.println("定时任务ing");
        }catch (Exception e){

        }
    }
    /**
     * 释放固币金
     * @param userId 用户id
     * @param releaseNum 释放固币金数量
     * */
    private Boolean releasePrincipal(Integer userId,BigDecimal releaseNum){
        //获取这个人的固币金
        SwPrincipalUserDO swPrincipalUserDO = swPrincipalUserService.getByUserId(userId, CommonStatic.NO_RELEASE,CommonStatic.NOTDELETE);
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
            //固币金剩余天数减少一天
            swPrincipalUserDO.setLeftTerm(-1);
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
            //更新用户的固币金
            swPrincipalUserService.update(swPrincipalUserDO);
            //把固币金释放的金额放入钱包
            SwWalletsDO wallet = swWalletsService.getWallet(userId, swPrincipalDO.getCoinTypeId());
            BigDecimal curcurrency = wallet.getCurrency();
            if(wallet != null){
                wallet.setCurrency(releaseNum);
                wallet.setUpdateDate(new Date());
                swWalletsService.update(wallet);
                //记录资金明细
                swAccountRecordService.save(SwAccountRecordDO.create(
                        userId,
                        RecordEnum.current_accelerate.getType(),
                        languagei18nUtils.getMessage(RecordEnum.current_accelerate.getDesc()),
                        swPrincipalDO.getCoinTypeId(), releaseNum.doubleValue(),
                        curcurrency.add(releaseNum).doubleValue()));
                //记录释放记录
                swReleaseRecordService.save(SwReleaseRecordDO.create(principalId,releaseNum.doubleValue(),CommonStatic.CURRENT_CAUSE_RELEASE,userId));
                return true;
            }
        }
        return false;
    }

    /**
     * 释放优币金
     * @param userId 用户id
     * @param releaseNum 释放固币金数量
     * */
    private Boolean releaseEvangelist(Integer userId,BigDecimal releaseNum){
        //获取这个人的优币金
        SwEvangelistUserDO swEvangelistUserDO = swEvangelistUserService.getByUserId(userId, CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        if(swEvangelistUserDO != null){
            SwEvangelistDO swEvangelistDO;
            //将固币金项目放入内存
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
                //固币金减少释放数量
                swEvangelistUserDO.setLeftNum(new BigDecimal("0").subtract(releaseNum).doubleValue());
            }else{
                //固币金全部释放，且状态改为已释放完
                swEvangelistUserDO.setLeftNum(-swEvangelistUserDO.getLeftNum());
                swEvangelistUserDO.setStatus(CommonStatic.RELEASED);
                //标记此次释放的数量等于固币金剩余的全部数量
                releaseNum = new BigDecimal(String.valueOf(swEvangelistUserDO.getLeftNum()));
            }
            //更新用户的固币金
            swPrincipalUserService.update(swEvangelistUserDO);
            //把固币金释放的金额放入钱包
            SwWalletsDO wallet = swWalletsService.getWallet(userId, swPrincipalDO.getCoinTypeId());
            BigDecimal curcurrency = wallet.getCurrency();
            if(wallet != null){
                wallet.setCurrency(releaseNum);
                wallet.setUpdateDate(new Date());
                swWalletsService.update(wallet);
                //记录资金明细
                swAccountRecordService.save(SwAccountRecordDO.create(
                        userId,
                        RecordEnum.current_accelerate.getType(),
                        languagei18nUtils.getMessage(RecordEnum.current_accelerate.getDesc()),
                        swPrincipalDO.getCoinTypeId(), releaseNum.doubleValue(),
                        curcurrency.add(releaseNum).doubleValue()));
                //记录释放记录
                swReleaseRecordService.save(SwReleaseRecordDO.create(principalId,releaseNum.doubleValue(),CommonStatic.CURRENT_CAUSE_RELEASE,userId));
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
                ":" + (hour < 10 ? "0" + hour : hour) +
                ":" + (minute < 10 ? "0" + minute : minute) + "00";
    }
}
