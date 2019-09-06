package com.api;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.utils.*;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.evowallet.utils.MailUtil;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
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
@RequestMapping(value = "/api/app/pv")
public class AppPrivateAPI {

    Logger log = LoggerFactory.getLogger(AppPrivateAPI.class);

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwEvangelistInfoService swEvangelistInfoService;

    @Autowired
    private SwWithlogService swWithlogService;

    @Autowired
    private SwChargelogService swChargelogService;

    @Autowired
    private SwWithdrawAddressService swWithdrawAddressService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwConsumeLogService swConsumeLogService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Value("${configs.chargeAddress}")
    private String chargeAddress;

    @Value("${configs.usercache.prefix}")
    private String prefix;

    /**
     * 提交申请成为布道者的资料
     * */
    @RequestMapping(value = "apply_for_evangelist",method = RequestMethod.POST)
    public Result resetLoginPassword(@RequestBody SwEvangelistInfoDO swEvangelistInfoDO) {
        //TODO 如果审核通过，系统用申请资料中提供的邮箱自动创建一个布道者账号
        try {
            if(swEvangelistInfoDO.getUserId() == null
                    || StringUtils.isBlank(swEvangelistInfoDO.getEmail())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWeibo())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWechat())
                    || StringUtils.isBlank(swEvangelistInfoDO.getRealName())
                    || StringUtils.isBlank(swEvangelistInfoDO.getMobile())){
                return Result.error("system.params.error",null);
            }
            SwUserBasicDO byEmail = swUserBasicService.getByEmail(swEvangelistInfoDO.getEmail());
            if(byEmail != null){
                return Result.error("AppPrivateAPI.resetLoginPassword.email.exist",null);
            }
            swEvangelistInfoDO.setTid(IDUtils.randomStr());
            swEvangelistInfoDO.setUpdateDate(new Date());
            swEvangelistInfoDO.setCreateDate(new Date());
            swEvangelistInfoDO.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistInfoService.save(swEvangelistInfoDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("AppPrivateAPI.resetLoginPassword.register.failed",null);
        }
    }

    /**
     * 充币地址
     * */
    @RequestMapping("charge_address")
    public Result chargeAddress() {
        try {
            return Result.ok(chargeAddress);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 充币记录
     * */
    @RequestMapping("charge_log")
    public Result chargeLog(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Map<String,Object> params = new HashMap<>();
            params.put("userId",user.getTid());
            params.put("delFlag",CommonStatic.NOTDELETE);
            List<SwChargelogDO> list = swChargelogService.list(params);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 充币记录详情
     * */
    @RequestMapping("charge_log_detail")
    public Result chargeLogDetail(String tid) {
        try {
            if(StringUtils.isBlank(tid)){
                return Result.error("system.failed.operation",null);
            }
            SwChargelogDO swChargelogDO = swChargelogService.get(tid);
            return Result.ok(swChargelogDO);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 提币地址列表
     * */
    @RequestMapping("withdraw_address")
    public Result withdrawAddress(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Map<String,Object> params = new HashMap<>();
            params.put("userId",user.getTid());
            params.put("delFlag",CommonStatic.NOTDELETE);
            List<SwWithdrawAddressDO> list = swWithdrawAddressService.list(params);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 新增提币地址
     * */
    @RequestMapping(value = "add_withdraw_address",method = RequestMethod.POST)
    public Result addWithdrawAddress(@RequestBody SwWithdrawAddressDO swWithdrawAddressDO, HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(swWithdrawAddressDO.getAddress())){
                return Result.error("system.params.error",null);
            }
            swWithdrawAddressDO.setTid(IDUtils.randomStr());
            swWithdrawAddressDO.setCreateDate(new Date());
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressDO.setUserId(user.getTid());
            swWithdrawAddressDO.setDelFlag(CommonStatic.NOTDELETE);
            swWithdrawAddressService.save(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 修改提币地址
     * */
    @RequestMapping(value = "edit_withdraw_address",method = RequestMethod.POST)
    public Result editWithdrawAddress(@RequestBody SwWithdrawAddressDO swWithdrawAddressDO) {
        try {
            if(StringUtils.isBlank(swWithdrawAddressDO.getTid())){
                return Result.error("system.params.error",null);
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 删除提币地址
     * */
    @RequestMapping(value = "delete_withdraw_address",method = RequestMethod.POST)
    public Result deleteWithdrawAddress(String tid, HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            SwWithdrawAddressDO swWithdrawAddressDO = swWithdrawAddressService.get(tid);
            if(!user.getTid().equals(swWithdrawAddressDO.getUserId())){
                return Result.error("system.reject.operation",null);
            }
            if(swWithdrawAddressDO == null){
                return Result.error("system.failed.operation",null);
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressDO.setDelFlag(CommonStatic.DELETE);
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 提币记录列表
     * */
    @RequestMapping(value = "withdraw_log")
    public Result withdrawLog(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Map<String,Object> params = new HashMap<>();
            params.put("userId",user.getTid());
            params.put("delFlag",CommonStatic.NOTDELETE);
            List<SwWithlogDO> list = swWithlogService.list(params);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 提币记录详情
     * */
    @RequestMapping(value = "withdraw_log_detail")
    public Result withdrawLogDetail(String tid) {
        try {
            SwWithlogDO swWithlogDO = swWithlogService.get(tid);
            return Result.ok(swWithlogDO);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation",null);
        }
    }

    /**
     * 转账-校验收款用户
     * */
    @RequestMapping("check_user")
    @ResponseBody
    public Result checkUser(HttpServletRequest request, String userId) {
        if(StringUtils.isBlank(userId)){
            return Result.error("AppPrivateAPI.checkUser.receiver.not.exist",null);
        }
        SwUserBasicDO user = swUserBasicService.get(Integer.parseInt(userId));
        if (user == null) {
            return Result.error("AppPrivateAPI.checkUser.receiver.not.exist",null);
        }
        if(user.getEmail() != null){
            if(user.getEmail().endsWith("canceled")){
                return Result.error("AppPrivateAPI.checkUser.receiver.written.off",null);
            }
        }
        return Result.ok(user);
    }

    /**
     * 转账
     * */
    @RequestMapping("transfer")
    @ResponseBody
    public Result TransferAccount(HttpServletRequest request, @RequestParam String userId, @RequestParam double amount,
                                                  @RequestParam String coinId, @RequestParam String remark, @RequestParam String tradingPassword) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        String msg = swConsumeLogService.transfer(user, userId, amount, coinId, remark, tradingPassword);
        if(StringUtils.isNotBlank(msg)){
            return Result.error(msg);
        }
        return Result.ok();
    }
}
