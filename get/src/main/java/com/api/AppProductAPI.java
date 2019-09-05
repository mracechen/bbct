package com.api;

import com.common.utils.AppUserUtils;
import com.common.utils.IDUtils;
import com.common.utils.Result;
import com.common.utils.StringUtils;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**=====================公共方法begin=========================*/
    /**
     * 获取冻结的bbct金额
     * */
    public double getFrozenBBCT(SwUserBasicDO user) throws Exception{
        SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
        double resultNum = 0;
        if(bbct != null){
            if(user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
                SwPrincipalUserDO swPrincipalUserDO = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                SwCurrentUserDO swCurrentUserDO = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                SwPeriodUserDO swPeriodUserDO = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPrincipalUserDO != null){
                    resultNum += swPrincipalUserDO.getLeftNum();
                }
                if(swCurrentUserDO != null){
                    resultNum += swCurrentUserDO.getEx1();
                }
                if(swPeriodUserDO != null){
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
    @RequestMapping("frozen_bbct_current")
    public Result frozenBbctCurrent(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            double frozenBBCT = getFrozenBBCT(user);
            return Result.ok(frozenBBCT);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 获取可用bbct金额
     * */
    @RequestMapping("active_bbct_current")
    public Result activeBbctCurrent(HttpServletRequest request) {
        try {
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            if(eos != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
                return Result.ok(wallet.getCurrency());
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
        return Result.ok(0);
    }

    /**
     * 获取可用eos金额
     * */
    @RequestMapping("eos_current")
    public Result eosCurrent(HttpServletRequest request) {
        try {
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            if(bbct != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
                if(wallet != null){
                    return Result.ok(wallet);
                }else{
                    return Result.error("system.failed.operation",null);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
        return Result.ok(0);
    }

    /**
     * 获取总资产
     * */
    @RequestMapping("total_current")
    public Result totalCurrent(HttpServletRequest request) {
        try {
            Map<String,BigDecimal> result = new HashMap<>();
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            SwCoinTypeDO eos = swCoinTypeService.getByCoinName("EOS");
            if(bbct != null && eos != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO bbctWallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
                double frozenBBCT = getFrozenBBCT(user);
                SwWalletsDO eosWallet = swWalletsService.getWallet(user.getTid(), eos.getTid());
                //总冻结资金=bbct冻结资金+EOS冻结资金
                BigDecimal frozenAmount = eosWallet.getFrozenAmount().add(new BigDecimal(String.valueOf(frozenBBCT)));
                //总可用资金=bbct可用资金+EOS可用资金
                BigDecimal activeAmount = bbctWallet.getCurrency().add(eosWallet.getCurrency());
                result.put("forzen",frozenAmount);
                result.put("active",activeAmount);
                result.put("total",frozenAmount.add(activeAmount));
                return Result.ok(result);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
        return Result.ok(0);
    }

    /**
     * 收益统计
     * */
    @RequestMapping("profit_statistic")
    public Result profitStatistic(HttpServletRequest request) {
        try {
            SwCoinTypeDO bbct = swCoinTypeService.getByCoinName("BBCT");
            if(bbct != null){
                SwUserBasicDO user = AppUserUtils.getUser(request);
                SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), bbct.getTid());
                if(wallet != null){
                    return Result.ok(wallet);
                }else{
                    return Result.error("system.failed.operation",null);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
        return Result.ok(0);
    }
}
