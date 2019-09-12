package com.api;

import com.common.utils.*;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author longge
 * @desc app需要登录的接口
 * @date 2018-10-12
 */

@RestController
@RequestMapping(value = "/api/app/pv/product")
public class AppProductAPI {

    Logger log = LoggerFactory.getLogger(AppProductAPI.class);

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
    private SwCoinTypeService swCoinTypeService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Value("${configs.benchmarketingRate}")
    private String benchmarketingRate;

    /**=====================公共方法begin=========================*/
    /**
     * 获取冻结的bbct金额
     * */
    public double getFrozenBBCT(SwUserBasicDO user) throws Exception{
        SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
        double resultNum = 0;
        if(bbct != null){
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
            if(wallet.getFrozenAmount() != null){
                resultNum += wallet.getFrozenAmount().doubleValue();
            }
            if(user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
                List<SwPrincipalUserDO> swPrincipalUserDOList = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPrincipalUserDOList != null && swPrincipalUserDOList.size() > 1){
                    throw new Exception("固币金数据异常");
                }else if(swPrincipalUserDOList != null && swPrincipalUserDOList.size() == 1){
                    SwPrincipalUserDO swPrincipalUserDO = swPrincipalUserDOList.get(0);
                    resultNum += swPrincipalUserDO.getLeftNum();
                }
                List<SwCurrentUserDO> swCurrentUserDOS = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swCurrentUserDOS != null && swCurrentUserDOS.size() > 1){
                    throw new Exception("活币金数据异常");
                }else if(swCurrentUserDOS != null && swCurrentUserDOS.size() == 1){
                    SwCurrentUserDO swCurrentUserDO = swCurrentUserDOS.get(0);
                    resultNum += swCurrentUserDO.getEx1();
                }
                List<SwPeriodUserDO> swPeriodUserDOS = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPeriodUserDOS != null && swPeriodUserDOS.size() > 1){
                    throw new Exception("定币金数据异常");
                }else if(swPeriodUserDOS != null && swPeriodUserDOS.size() == 1){
                    SwPeriodUserDO swPeriodUserDO = swPeriodUserDOS.get(0);
                    resultNum += swPeriodUserDO.getEx1();
                }
                return resultNum;
            }else if(user.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
                SwEvangelistUserDO swEvangelistUserDO = swEvangelistUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swEvangelistUserDO != null){
                    resultNum += swEvangelistUserDO.getLeftNum();
                }
                return resultNum;
            }else if(user.getUserType().equals(CommonStatic.USER_TYPE_PARTNER)){
                SwPartnerUserDO swPartnerUserDO = swPartnerUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPartnerUserDO != null){
                    resultNum += swPartnerUserDO.getLeftNum();
                }
                return resultNum;
            }
        }else{
            throw new Exception("获取BBCT币种异常");
        }
        return resultNum;
    }

    /**=============================公共方法end==============================*/

    /**
     * 获取冻结bbct金额（买的所有产品价值）
     * */
 /*   @RequestMapping(value = "frozen_bbct_current",method = RequestMethod.GET)
    public Result frozenBbctCurrent(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            double frozenBBCT = getFrozenBBCT(user);
            return Result.ok(new BigDecimal(String.valueOf(frozenBBCT)).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }*/

   /**
     * 获取可用bbct金额
     * */
 /*   @RequestMapping(value = "active_bbct_current",method = RequestMethod.GET)
    public Result activeBbctCurrent(HttpServletRequest request) {
        try {
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            if(bbct != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
                return Result.ok(wallet.getCurrency().setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
        return Result.ok(null);
    }*/

    /**
     * 获取可用eos金额
     * */
   /* @RequestMapping(value = "eos_current",method = RequestMethod.GET)
    public Result eosCurrent(HttpServletRequest request) {
        try {
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            if(eos != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
                wallet.setCurrency(wallet.getCurrency().setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
                if(wallet != null){
                    return Result.ok(wallet);
                }else{
                    return Result.error("system.failed.operation");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
        return Result.ok(null);
    }*/
   /**
    * 获取钱包信息列表
    * */
   @RequestMapping(value = "currency_list",method = RequestMethod.GET)
   public Result eosCurrent(HttpServletRequest request) {
       try {
           Map<String,SwWalletsDO> result = new HashMap<>();
           SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
           SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
           if(eos != null && bbct != null){
               SwUserBasicDO user = AppUserUtils.getUser(request);
               //eos
               SwWalletsDO eosWallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
               result.put("eos",eosWallet);
               //bbct
               SwWalletsDO bbctWallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
               bbctWallet.setFrozenAmount(new BigDecimal(String.valueOf(getFrozenBBCT(user))));
               result.put("bbct",bbctWallet);
               return Result.ok(result);
           }
       }catch (Exception e){
           e.printStackTrace();
           return Result.error("system.failed.operation");
       }
       return Result.ok(null);
   }
    /**
     * 获取所有冻结金额（EOS转换成bbct）
     * */
    @RequestMapping(value = "frozen_currency",method = RequestMethod.GET)
    public Result frozenCurrent(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Double frozenBBCT = getFrozenBBCT(user);
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            if(eos != null){
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
                if(wallet != null){
                    //eos换算成bbct
                    frozenBBCT = wallet.getFrozenAmount()
                            .multiply(new BigDecimal(benchmarketingRate))
                            .add(new BigDecimal(String.valueOf(frozenBBCT)))
                            .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model)
                            .doubleValue();
                }else{
                    return Result.error("system.failed.operation");
                }
            }
            return Result.ok(frozenBBCT);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 获取所有可用金额（EOS转换成bbct）
     * */
    @RequestMapping(value = "active_currency",method = RequestMethod.GET)
    public Result activeCurrent(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            SwWalletsDO eosWallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
            SwWalletsDO bbctWallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
            return Result.ok(eosWallet.getCurrency().multiply(new BigDecimal(benchmarketingRate)).add(bbctWallet.getCurrency()));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 获取总资产
     * */
    @RequestMapping(value = "total_currency",method = RequestMethod.GET)
    public Result totalCurrent(HttpServletRequest request) {
        try {
            Map<String,BigDecimal> result = new HashMap<>();
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            if(bbct != null && eos != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO bbctWallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
                Double frozenBBCT = getFrozenBBCT(user);
                SwWalletsDO eosWallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
                //总冻结资金=bbct冻结资金+EOS冻结资金
                BigDecimal frozenAmount = eosWallet.getFrozenAmount().multiply(new BigDecimal(benchmarketingRate)).add(new BigDecimal(String.valueOf(frozenBBCT)));
                //总可用资金=bbct可用资金+EOS可用资金
                BigDecimal activeAmount = eosWallet.getCurrency().multiply(new BigDecimal(benchmarketingRate)).add(bbctWallet.getCurrency());
                result.put("forzen",frozenAmount.setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
                result.put("active",activeAmount.setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
                result.put("total",frozenAmount.add(activeAmount).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
                return Result.ok(result);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
        return Result.ok(null);
    }

    /**
     * 收益统计
     * */
    @RequestMapping(value = "profit_statistic",method = RequestMethod.GET)
    public Result profitStatistic(HttpServletRequest request) {
        Map<String,BigDecimal> map = new HashMap<>();
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            //总收益
            Double totalAmount = swReleaseRecordService.getSumByUserIdAndDate(user.getTid(), null, null);
            map.put("totalAmount",new BigDecimal(String.valueOf((totalAmount == null?0.0:totalAmount))).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            //待返收益
            Double waitingRelease = 0.0;
            List<SwPrincipalUserDO> myPrincipals = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPrincipals != null && myPrincipals.size() == 1){
                waitingRelease = myPrincipals.get(0).getLeftNum();
            }
            map.put("releasingAmount",new BigDecimal(String.valueOf(waitingRelease)).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            //昨日收益
            Date yesterday = DateUtils.dateAddDays(new Date(), -1);
            String yesterdayStr = DateUtils.dateTimeToDateString(yesterday);
            String ybegin = yesterdayStr + " 00:00:00";
            String yend = yesterdayStr + " 23:59:59";
            Double yesterdayAmount = swReleaseRecordService.getSumByUserIdAndDate(user.getTid(), DateUtils.dateParse(ybegin, DateUtils.DATE_TIME_PATTERN), DateUtils.dateParse(yend, DateUtils.DATE_TIME_PATTERN));
            map.put("yesterdayAmount",new BigDecimal(String.valueOf((yesterdayAmount == null?0.0:yesterdayAmount))).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            //上周总收益
            Date lastSunday = DateUtils.getLastSunday(new Date());
            String s = DateUtils.dateTimeToDateString(lastSunday);
            Date date = DateUtils.dateParse(s + " 00:00:00", DateUtils.DATE_TIME_PATTERN);
            Date lastMondayBegin = DateUtils.dateAddDays(date, -6);
            Date lastSundayEnd = DateUtils.dateParse(s + " 23:59:59", DateUtils.DATE_TIME_PATTERN);
            Double lastWeekAmount = swReleaseRecordService.getSumByUserIdAndDate(user.getTid(), lastMondayBegin, lastSundayEnd);
            map.put("lastWeekAmount",new BigDecimal(String.valueOf((lastWeekAmount == null?0.0:lastWeekAmount))).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            //上月总收益
            Date lastMonth = DateUtils.dateAddMonths(new Date(), -1);
            int year = DateUtils.getYear(lastMonth);
            int month = DateUtils.getMonth(lastMonth);
            String lmBeginStr = year + "-" + month + "-" + "01 00:00:00";
            int daysOfMonth = DateUtils.getDaysOfMonth(lastMonth);
            String lmEndStr = year + "-" + month + "-" + daysOfMonth +" 00:00:00";
            Double lastMonthAmount = swReleaseRecordService.getSumByUserIdAndDate(user.getTid(), DateUtils.dateParse(lmBeginStr, DateUtils.DATE_TIME_PATTERN), DateUtils.dateParse(lmEndStr, DateUtils.DATE_TIME_PATTERN));
            map.put("lastMonthAmount",new BigDecimal(String.valueOf((lastMonthAmount == null?0.0:lastMonthAmount))).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model));
            return Result.ok(map);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 收益列表
     * */
    @RequestMapping(value = "profit_list",method = RequestMethod.GET)
    public Result profitList(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("ex2",user.getTid());
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwReleaseRecordDO> list = swReleaseRecordService.list(map);
            for (SwReleaseRecordDO swReleaseRecordDO : list) {
                //如果导致释放的用户不是他自己，那么就将导致释放类型改为下级导致的释放类型
                if(!swReleaseRecordDO.getCauseUserId().equals(user.getTid())){
                    if(swReleaseRecordDO.getCauseType().equals(CommonStatic.CURRENT_CAUSE_RELEASE)){
                        swReleaseRecordDO.setCauseType(CommonStatic.CHILD_CURRENT_CAUSE_RELEASE);
                    }else if(swReleaseRecordDO.getCauseType().equals(CommonStatic.PERIOD_CAUSE_RELEASE)){
                        swReleaseRecordDO.setCauseType(CommonStatic.CHILD_PERIOD_CAUSE_RELEASE);
                    }
                }
            }
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 我的固币金
     * */
    @RequestMapping(value = "my_principal",method = RequestMethod.GET)
    public Result myPrincipal(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            List<SwPrincipalUserDO> list = swPrincipalUserService.getByUserId(user.getTid(),CommonStatic.NO_RELEASE,CommonStatic.NOTDELETE);
            if(list != null && list.size() > 1){
                return Result.error("system.failed.operation");
            }
            if(list == null || list.size() == 0){
                return Result.ok();
            }else{
                SwPrincipalUserDO swPrincipalUserDO = list.get(0);
                swPrincipalUserDO.setCancelAuth(1);
                Date createDate = swPrincipalUserDO.getCreateDate();
                SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUserDO.getPrincipalId());
                if(swPrincipalDO != null){
                    Integer chargeTerm = swPrincipalDO.getChargeTerm();
                    Date date = DateUtils.dateAddHours(createDate, chargeTerm);
                    if(DateUtils.dateCompare(new Date(),date) <= 0){
                        swPrincipalUserDO.setCancelAuth(0);
                    }
                }
                return Result.ok(swPrincipalUserDO);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 我的活币金
     * */
    @RequestMapping(value = "my_current",method = RequestMethod.GET)
    public Result myCurrent(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            List<SwCurrentUserDO> list = swCurrentUserService.getByUserId(user.getTid(),CommonStatic.NO_RELEASE,CommonStatic.NOTDELETE);
            if(list != null && list.size() > 1){
                return Result.error("system.failed.operation");
            }
            if(list == null || list.size() == 0){
                return Result.ok();
            }else{
                SwCurrentUserDO swCurrentUserDO = list.get(0);
                Map<String,Object> params = new HashMap<>();
                params.put("causeType",CommonStatic.CURRENT_CAUSE_RELEASE);
                params.put("causeUserId",user.getTid());
                params.put("delFlag",CommonStatic.NOTDELETE);
                List<SwReleaseRecordDO> list1 = swReleaseRecordService.list(params);
                double sum = list1.stream().collect(Collectors.summarizingDouble(SwReleaseRecordDO::getAmount)).getSum();
                swCurrentUserDO.setCauseReleaseNum(sum);
                int days = DateUtils.dateBetween(swCurrentUserDO.getCreateDate(), new Date());
                swCurrentUserDO.setExistDays(days);
                return Result.ok(swCurrentUserDO);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 我的定币金
     * */
    @RequestMapping(value = "my_period",method = RequestMethod.GET)
    public Result myPeriod(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            List<SwPeriodUserDO> list = swPeriodUserService.getByUserId(user.getTid(),CommonStatic.NO_RELEASE,CommonStatic.NOTDELETE);
            if(list != null && list.size() > 1){
                return Result.error("system.failed.operation");
            }
            if(list == null || list.size() == 0){
                return Result.ok();
            }else{
                SwPeriodUserDO swPeriodUserDO = list.get(0);
                Map<String,Object> params = new HashMap<>();
                params.put("causeType",CommonStatic.PERIOD_CAUSE_RELEASE);
                params.put("causeUserId",user.getTid());
                params.put("delFlag",CommonStatic.NOTDELETE);
                List<SwReleaseRecordDO> list1 = swReleaseRecordService.list(params);
                double sum = list1.stream().collect(Collectors.summarizingDouble(SwReleaseRecordDO::getAmount)).getSum();
                swPeriodUserDO.setCauseReleaseNum(sum);
                SwPeriodDO swPeriodDO = swPeriodService.get(swPeriodUserDO.getPeriodId());
                if(swPeriodDO != null){
                    Date expireDate = DateUtils.dateAddDays(swPeriodUserDO.getCreateDate(), swPeriodDO.getPeriodTerm());
                    swPeriodUserDO.setExpireDate(expireDate);
                }
                return Result.ok(swPeriodUserDO);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 我的优币金
     * */
    @RequestMapping(value = "my_evangelist",method = RequestMethod.GET)
    public Result myEvangelist(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            SwEvangelistUserDO byUserId = swEvangelistUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            return Result.ok(byUserId);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 我的升币金
     * */
    @RequestMapping(value = "my_partner",method = RequestMethod.GET)
    public Result myPartner(HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            SwPartnerUserDO byUserId = swPartnerUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            return Result.ok(byUserId);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 固币金项目列表
     * */
    @RequestMapping(value = "principal_list",method = RequestMethod.GET)
    public Result principalList() {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwPrincipalDO> list = swPrincipalService.list(map);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 购买固币金
     * @param principalId 固币金产品id
     * */
    @RequestMapping(value = "purchasing_principal",method = RequestMethod.POST)
    public Result purchasingPrincipal(HttpServletRequest request, String principalId,String transferPassword) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            if(StringUtils.isBlank(principalId)){
                return Result.error("system.params.error");
            }
            //布道者和合伙人不能购买固币金
            if(!user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
                return Result.error("system.failed.auth");
            }
            SwPrincipalDO swPrincipalDO = swPrincipalService.get(principalId);
            if(swPrincipalDO == null){
                return Result.error("system.failed.operation");
            }
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), swPrincipalDO.getCoinTypeId());
            if(wallet == null){
                return Result.error("system.wallet.error");
            }
            BigDecimal currency = wallet.getCurrency();
            if(currency.compareTo(new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))) < 0){
                return Result.error("system.balance.not.enough");
            }
            //一次只能持有一个激活的固币金
            List<SwPrincipalUserDO> myPrincipalList = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPrincipalList != null && myPrincipalList.size() > 0){
                return Result.error("AppProductAPI.purchasingPrincipal.principal.exist");
            }
            Boolean checkTradingPassword = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), transferPassword);
            if(!checkTradingPassword){
                return Result.error("system.password.error");
            }
            SwPrincipalUserDO swPrincipalUserDO = new SwPrincipalUserDO();
            swPrincipalUserDO.setTid(IDUtils.randomStr());
            swPrincipalUserDO.setLeftTerm(swPrincipalDO.getContractTerm());
            swPrincipalUserDO.setStatus(CommonStatic.NO_RELEASE);
            //购买后实际获得的金额等于该产品基础金额×倍率
            BigDecimal multiply = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                    .multiply(new BigDecimal(String.valueOf(swPrincipalDO.getRewardPercent())))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            swPrincipalUserDO.setLeftNum(multiply.doubleValue());
            swPrincipalUserDO.setTotalNum(multiply.doubleValue());
            swPrincipalUserDO.setPrincipalId(swPrincipalDO.getTid());
            swPrincipalUserDO.setUserId(user.getTid());
            swPrincipalUserDO.setCreateDate(new Date());
            swPrincipalUserDO.setUpdateDate(new Date());
            swPrincipalUserDO.setDelFlag(CommonStatic.NOTDELETE);
            return Result.ok(swPrincipalUserService.save(swPrincipalUserDO));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 活币金项目信息
     * */
    @RequestMapping(value = "current_info",method = RequestMethod.GET)
    public Result currentInfo() {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwCurrentDO> list = swCurrentService.list(map);
            if(list == null || list.size() != 1){
                return Result.error("system.data.error");
            }
            return Result.ok(list.get(0));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 购买活币金
     * @param rate 倍率
     * @param currentId 活币金id
     * */
    @RequestMapping(value = "purchasing_current",method = RequestMethod.POST)
    public Result purchasingCurrent(HttpServletRequest request, Integer rate, String currentId, String transferPassword) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            if(StringUtils.isBlank(currentId) || rate == null || rate <= 0){
                return Result.error("system.params.error");
            }
            SwCurrentDO swCurrentDO = swCurrentService.get(currentId);
            if(swCurrentDO == null || rate > swCurrentDO.getTPercent() || rate < swCurrentDO.getBPercent()){
                return Result.error("system.data.error");
            }
            //布道者和合伙人不能购买活币金
            if(!user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
                return Result.error("system.failed.auth");
            }
            //必须拥有且仅有一个固币金，才能购买活币金
            List<SwPrincipalUserDO> myPrincipals = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPrincipals == null || myPrincipals.size() > 1 || myPrincipals.size() == 0){
                return Result.error("AppProductAPI.purchasingCurrent.principal.failed");
            }
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), swCurrentDO.getCoinTypeId());
            if(wallet == null){
                return Result.error("system.wallet.error");
            }
            BigDecimal currency = wallet.getCurrency();
            SwPrincipalDO swPrincipalDO = swPrincipalService.get(myPrincipals.get(0).getPrincipalId());
            if(swPrincipalDO.getPrincipalNum() * rate > currency.doubleValue()){
                return Result.error("system.balance.not.enough");
            }
            //一次只能持有一个激活的活币金或者一个激活的定币金
            List<SwCurrentUserDO> myCurrents = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myCurrents != null && myCurrents.size() > 0){
                return Result.error("AppProductAPI.purchasingCurrent.current.exist");
            }
            List<SwPeriodUserDO> myPeriods = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPeriods != null && myPeriods.size() > 0){
                return Result.error("AppProductAPI.purchasingPeriod.period.exist");
            }
            Boolean checkTradingPassword = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), transferPassword);
            if(!checkTradingPassword){
                return Result.error("system.password.error");
            }
            BigDecimal multiply = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                    .multiply(new BigDecimal(String.valueOf(rate)))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            SwCurrentUserDO swCurrentUserDO = new SwCurrentUserDO();
            swCurrentUserDO.setTid(IDUtils.randomStr());
            swCurrentUserDO.setDelFlag(CommonStatic.NOTDELETE);
            swCurrentUserDO.setCreateDate(new Date());
            swCurrentUserDO.setUpdateDate(new Date());
            swCurrentUserDO.setEx1(multiply.doubleValue());
            swCurrentUserDO.setReleaseTime(new Date());
            swCurrentUserDO.setCurrentId(currentId);
            swCurrentUserDO.setStatus(CommonStatic.NO_RELEASE);
            swCurrentUserDO.setUserId(user.getTid());
            swCurrentUserService.save(swCurrentUserDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 定币金项目信息
     * */
    @RequestMapping(value = "period_list",method = RequestMethod.GET)
    public Result periodList() {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwPeriodDO> list = swPeriodService.list(map);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 购买定币金
     * @param rate 倍率
     * @param periodId 定币金id
     * */
    @RequestMapping(value = "purchasing_period",method = RequestMethod.POST)
    public Result purchasingPeriod(HttpServletRequest request, Integer rate, String periodId, String transferPassword) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            if(StringUtils.isBlank(periodId) || rate == null || rate <= 0){
                return Result.error("system.params.error");
            }
            SwPeriodDO swPeriodDO = swPeriodService.get(periodId);
            if(swPeriodDO == null || rate > swPeriodDO.getTPercent() || rate < swPeriodDO.getBPercent()){
                return Result.error("system.data.error");
            }
            //布道者和合伙人不能购买定币金
            if(!user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
                return Result.error("system.failed.auth");
            }
            //必须拥有且仅有一个固币金，才能购买定币金
            List<SwPrincipalUserDO> myPrincipals = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPrincipals == null || myPrincipals.size() > 1 || myPrincipals.size() == 0){
                return Result.error("AppProductAPI.purchasingPeriod.principal.failed");
            }
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), swPeriodDO.getCoinTypeId());
            if(wallet == null){
                return Result.error("system.wallet.error");
            }
            BigDecimal currency = wallet.getCurrency();
            SwPrincipalDO swPrincipalDO = swPrincipalService.get(myPrincipals.get(0).getPrincipalId());
            if(swPrincipalDO.getPrincipalNum() * rate > currency.doubleValue()){
                return Result.error("system.balance.not.enough");
            }
            //一次只能持有一个激活的活币金或一个激活的定币金
            List<SwPeriodUserDO> myPeriods = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPeriods != null && myPeriods.size() > 0){
                return Result.error("AppProductAPI.purchasingPeriod.period.exist");
            }
            List<SwCurrentUserDO> myCurrents = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myCurrents != null && myCurrents.size() > 0){
                return Result.error("AppProductAPI.purchasingCurrent.current.exist");
            }
            Boolean checkTradingPassword = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), transferPassword);
            if(!checkTradingPassword){
                return Result.error("system.password.error");
            }
            BigDecimal multiply = new BigDecimal(String.valueOf(swPrincipalDO.getPrincipalNum()))
                    .multiply(new BigDecimal(String.valueOf(rate)))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            SwPeriodUserDO swPeriodUserDO = new SwPeriodUserDO();
            swPeriodUserDO.setTid(IDUtils.randomStr());
            swPeriodUserDO.setCreateDate(new Date());
            swPeriodUserDO.setUpdateDate(new Date());
            swPeriodUserDO.setDelFlag(CommonStatic.NOTDELETE);
            swPeriodUserDO.setPeriodId(periodId);
            swPeriodUserDO.setEx1(multiply.doubleValue());
            swPeriodUserDO.setReleaseTime(new Date());
            swPeriodUserDO.setStatus(CommonStatic.NO_RELEASE);
            swPeriodUserDO.setUserId(user.getTid());
            swPeriodUserService.save(swPeriodUserDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 优币金项目信息
     * */
    @RequestMapping(value = "evangelist_info",method = RequestMethod.GET)
    public Result evangelistInfo() {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwEvangelistDO> list = swEvangelistService.list(map);
            if(list != null && list.size() > 1){
                return Result.error("system.data.error");
            }
            return Result.ok(list.get(0));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 购买优币金
     * @param evangelistId 优币金id
     * @param transferPassword 交易密码
     * */
    @RequestMapping(value = "purchasing_evangelist",method = RequestMethod.POST)
    public Result purchasingEvangelist(HttpServletRequest request, String evangelistId, String transferPassword) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            if(StringUtils.isBlank(evangelistId) || StringUtils.isBlank(transferPassword) ){
                return Result.error("system.params.error");
            }
            SwEvangelistDO swEvangelistDO = swEvangelistService.get(evangelistId);
            if(swEvangelistDO == null){
                return Result.error("system.data.error");
            }
            //非布道者不能购买优币金
            if(!user.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
                return Result.error("system.failed.auth");
            }
            //上级不是系统用户不能购买优币金
            if(user.getRecomId() != 1){
                return Result.error("AppProductAPI.purchasingEvangelist.recommender.not.allow");
            }
            //拥有任意定币金，活币金，固币金或升币金，都不能购买优币金
            List<SwPrincipalUserDO> myPrincipals = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPrincipals != null && myPrincipals.size() != 0){
                return Result.error("AppProductAPI.purchasingEvangelist.exist.other.product");
            }
            List<SwCurrentUserDO> myCurrents = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myCurrents != null && myCurrents.size() != 0){
                return Result.error("AppProductAPI.purchasingEvangelist.exist.other.product");
            }
            List<SwPeriodUserDO> myPeriods = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPeriods != null && myPeriods.size() != 0){
                return Result.error("AppProductAPI.purchasingEvangelist.exist.other.product");
            }
            SwPartnerUserDO myPartners = swPartnerUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(myPartners != null){
                return Result.error("AppProductAPI.purchasingEvangelist.exist.other.product");
            }
            //已经拥有过优币金，无论有没有释放完，都无法再次购买
            SwEvangelistUserDO myEvangelists = swEvangelistUserService.getByUserId(user.getTid(), null, null);
            if(myEvangelists != null){
                return Result.error("AppProductAPI.purchasingEvangelist.evangelist.exist");
            }
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), swEvangelistDO.getCoinTypeId());
            if(wallet == null){
                return Result.error("system.wallet.error");
            }
            BigDecimal currency = wallet.getCurrency();
            if(swEvangelistDO.getEvangelistNum() > currency.doubleValue()){
                return Result.error("system.balance.not.enough");
            }
            Boolean checkTradingPassword = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), transferPassword);
            if(!checkTradingPassword){
                return Result.error("system.password.error");
            }
            BigDecimal multiply = new BigDecimal(String.valueOf(swEvangelistDO.getEvangelistNum()))
                    .multiply(new BigDecimal(String.valueOf(swEvangelistDO.getPercent())))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            SwEvangelistUserDO swEvangelistUserDO = new SwEvangelistUserDO();
            swEvangelistUserDO.setTid(IDUtils.randomStr());
            swEvangelistUserDO.setCreateDate(new Date());
            swEvangelistUserDO.setUpdateDate(new Date());
            swEvangelistUserDO.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistUserDO.setUserId(user.getTid());
            swEvangelistUserDO.setStatus(CommonStatic.NO_RELEASE);
            swEvangelistUserDO.setEvangelistId(evangelistId);
            swEvangelistUserDO.setTotalNum(multiply.doubleValue());
            swEvangelistUserDO.setLeftNum(multiply.doubleValue());
            swEvangelistUserService.save(swEvangelistUserDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 取消产品
     * @param type 产品类型，1-固币金，2-活币金
     * @param productId 产品id
     * */
    @RequestMapping(value = "cancel_product",method = RequestMethod.POST)
    public Result cancelProduct(HttpServletRequest request, String type, String productId) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            if(StringUtils.isBlank(type) || StringUtils.isBlank(productId)){
                return Result.error("system.params.error");
            }
            if("1".equals(type)){
                SwPrincipalUserDO swPrincipalUserDO = swPrincipalUserService.get(productId);
                if(swPrincipalUserDO == null){
                    return Result.error("system.data.error");
                }
                if(!swPrincipalUserDO.getUserId().equals(user.getTid()) || !swPrincipalUserDO.getStatus().equals(CommonStatic.NO_RELEASE)){
                    return Result.error("system.failed.auth");
                }
                SwPrincipalDO swPrincipalDO = swPrincipalService.get(swPrincipalUserDO.getPrincipalId());
                Date createDate = swPrincipalUserDO.getCreateDate();
                Integer chargeTerm = swPrincipalDO.getChargeTerm();
                int allowCancel = DateUtils.dateCompare(new Date(), DateUtils.dateAddHours(createDate, chargeTerm));
                if(allowCancel >= 0){
                    return Result.error("AppProductAPI.cancelProduct.not.allow");
                }
                swPrincipalUserDO.setUpdateDate(new Date());
                swPrincipalUserDO.setStatus(CommonStatic.RELEASED);
                swPrincipalUserService.cancel(swPrincipalUserDO);
                return Result.ok();
            }else{
                SwCurrentUserDO swCurrentUserDO = swCurrentUserService.get(productId);
                if(swCurrentUserDO == null){
                    return Result.error("system.data.error");
                }
                if(!swCurrentUserDO.getUserId().equals(user.getTid()) || !swCurrentUserDO.getStatus().equals(CommonStatic.NO_RELEASE)){
                    return Result.error("system.failed.auth");
                }
                swCurrentUserDO.setUpdateDate(new Date());
                swCurrentUserDO.setStatus(CommonStatic.RELEASED);
                swCurrentUserService.cancel(swCurrentUserDO);
                return Result.ok();
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }
}
