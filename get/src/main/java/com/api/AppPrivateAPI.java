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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author longge
 * @desc app不需要登录的接口
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

    @Value("${configs.chargeAddress}")
    private String chargeAddress;

    @Value("${configs.usercache.prefix}")
    private String prefix;

    /**
     * 提交申请成为布道者的资料
     * */
    @RequestMapping(value = "apply_for_evangelist",method = RequestMethod.POST)
    public Result resetLoginPassword(@RequestBody SwEvangelistInfoDO swEvangelistInfoDO) {
        try {
            if(swEvangelistInfoDO.getUserId() == null
                    || StringUtils.isBlank(swEvangelistInfoDO.getEmail())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWeibo())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWechat())
                    || StringUtils.isBlank(swEvangelistInfoDO.getRealName())
                    || StringUtils.isBlank(swEvangelistInfoDO.getMobile())){
                return Result.error("参数错误");
            }
            SwUserBasicDO byEmail = swUserBasicService.getByEmail(swEvangelistInfoDO.getEmail());
            if(byEmail != null){
                return Result.error("该邮箱已注册过");
            }
            swEvangelistInfoDO.setTid(IDUtils.randomStr());
            swEvangelistInfoDO.setUpdateDate(new Date());
            swEvangelistInfoDO.setCreateDate(new Date());
            swEvangelistInfoDO.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistInfoService.save(swEvangelistInfoDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("申请失败");
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
            return Result.error("获取失败！");
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
            return Result.error("获取失败！");
        }
    }

    /**
     * 充币记录详情
     * */
    @RequestMapping("charge_log_detail")
    public Result chargeLogDetail(String tid) {
        try {
            if(StringUtils.isBlank(tid)){
                return Result.error("获取失败！");
            }
            SwChargelogDO swChargelogDO = swChargelogService.get(tid);
            return Result.ok(swChargelogDO);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("获取失败！");
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
            return Result.error("获取失败！");
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
                return Result.error("参数错误！");
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
            return Result.error("新增失败！");
        }
    }

    /**
     * 修改提币地址
     * */
    @RequestMapping(value = "edit_withdraw_address",method = RequestMethod.POST)
    public Result editWithdrawAddress(@RequestBody SwWithdrawAddressDO swWithdrawAddressDO) {
        try {
            if(StringUtils.isBlank(swWithdrawAddressDO.getTid())){
                return Result.error("参数错误！");
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("编辑失败！");
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
                return Result.error("操作拒绝！");
            }
            if(swWithdrawAddressDO == null){
                return Result.error("删除失败！");
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressDO.setDelFlag(CommonStatic.DELETE);
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("删除失败！");
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
            return Result.error("获取失败！");
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
            return Result.error("获取失败！");
        }
    }
}
