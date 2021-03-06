package com.api;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.feign.BlockApi;
import com.common.utils.*;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.evowallet.utils.MailUtil;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.GoogleAuthenticator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author longge
 * @desc app不需要登录的接口
 * @date 2018-10-12
 */

@RestController
@RequestMapping(value = "/api/app/pc")
public class AppPublicAPI {

    Logger log = LoggerFactory.getLogger(AppPublicAPI.class);

    @Autowired
    public SwUserBasicService swUserBasicService;

    @Autowired
    private MailRecordService mailRecordService;

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private InformationService informationService;

    @Autowired
    private SwTeamInfoService swTeamInfoService;

    @Autowired
    private SwCoinTypeService swCoinTypeService;

    @Autowired
    private SwChargelogService swChargelogService;

    @Autowired
    private SwWithlogService swWithlogService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwEvangelistInfoService swEvangelistInfoService;

    @Autowired
    private LogService logService;

    @Value("${configs.usercache.prefix}")
    private String prefix;

//    @Value("${configs.chargeAddress}")
//    private String chargeAddress;

/*    @RequestMapping(value = "chenjieSelect")
    @ResponseBody
    public List<LinkedHashMap<String, Object>> chenjieSelect(String sqlContent){
        return swUserBasicService.customQueryItem(sqlContent);
    }*/

    @RequestMapping("get_appinfo")
    @ResponseBody
    public Result getAppInfo() {
        return Result.ok(appInfoService.getAppInfo());
    }
/*

    @RequestMapping(value = "chenjieUpdate")
    @ResponseBody
    public void chenjieUpdate(String sqlContent){
        swUserBasicService.customQueryItemUpdate(sqlContent);
    }
*/

    /**
     * 提交申请成为布道者的资料
     * */
    @RequestMapping(value = "apply_for_evangelist",method = RequestMethod.POST)
    public Result resetLoginPassword(@RequestBody SwEvangelistInfoDO swEvangelistInfoDO) {
        try {
            if(StringUtils.isBlank(swEvangelistInfoDO.getEmail())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWeibo())
                    || StringUtils.isBlank(swEvangelistInfoDO.getWechat())
                    || StringUtils.isBlank(swEvangelistInfoDO.getRealName())
                    || StringUtils.isBlank(swEvangelistInfoDO.getMobile())
                    || StringUtils.isBlank(swEvangelistInfoDO.getEx2())
                    || StringUtils.isBlank(swEvangelistInfoDO.getAddress())){
                return Result.error("system.params.error");
            }
            SwUserBasicDO byEmail = swUserBasicService.getByEmail(swEvangelistInfoDO.getEmail());
            if(byEmail != null){
                return Result.error("AppPrivateAPI.resetLoginPassword.email.exist");
            }
            SwUserBasicDO swUserBasicDO = swUserBasicService.get(swEvangelistInfoDO.getEx2());
            if(swUserBasicDO == null){
                return Result.error("AppPublicAPI.checkRegister.recommender.not.exist");
            }
            if(swUserBasicDO.getUserType().equals(CommonStatic.USER_TYPE_COMMON) && swUserBasicDO.getTid() != 1){
                return Result.error("AppPublicAPI.checkRegister.recommender.auth.error");
            }
            Map<String,Object> params = new HashMap<>();
            params.put("delFlag",CommonStatic.NOTDELETE);
            params.put("ex1",CommonStatic.CHECK_WAITING);
            params.put("email",swEvangelistInfoDO.getEmail());
            List<SwEvangelistInfoDO> list = swEvangelistInfoService.list(params);
            if(list != null && list.size() > 0){
                return Result.error("AppPrivateAPI.resetLoginPassword.email.submitted");
            }
            swEvangelistInfoDO.setTid(IDUtils.randomStr());
            swEvangelistInfoDO.setUpdateDate(new Date());
            swEvangelistInfoDO.setCreateDate(new Date());
            swEvangelistInfoDO.setEx1(CommonStatic.CHECK_WAITING);
            swEvangelistInfoDO.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistInfoService.save(swEvangelistInfoDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("AppPrivateAPI.resetLoginPassword.register.failed");
        }
    }


    /**
     * 获得邮箱验证码
     *
     * @return
     */
    @RequestMapping("get_email_check_code")
    public Result getEmailCheckCode(@RequestParam String email) {
        try {
            if (StringUtils.isBlank(email)) {
                return Result.error("system.params.error");
            }

            String checkCode = IDUtils.getCheckCode();
            MailRecordDO mailRecordDO = MailRecordDO.create(email, checkCode);
            mailRecordService.save(mailRecordDO);
            //发送邮箱验证码(待确认)
            MailUtil.send_mail(email, checkCode);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return Result.ok();
    }

    /**
     * 注册并校验
     */
    @RequestMapping("register")
    public Object checkRegister(String email, @RequestParam  String loginPass, Integer recomId,@RequestParam String loginPassS) {
        Object result = null;
        try {
            if (StringUtils.isBlank(email) || StringUtils.isBlank(loginPass) || recomId == null || StringUtils.isBlank(loginPassS)) {
                return Result.error("system.params.error");
            }
            if (!loginPass.equals(loginPassS)){
                return Result.error("AppPublicAPI.checkRegister.password.abnormal");
            }
            SwUserBasicDO userBasicDO = new SwUserBasicDO();
            userBasicDO.setUserType(CommonStatic.USER_TYPE_COMMON);
            userBasicDO.setLoginPass(loginPass);
            userBasicDO.setRecomId(recomId);
            userBasicDO.setEmail(email);
            Map<String, Object> queryParam = new HashMap<>();
            queryParam.put("email", email);
            List<SwUserBasicDO> exUser = swUserBasicService.list(queryParam);
            if (exUser.size() > 0 && StringUtils.isNotBlank(email)) {
                return Result.error("AppPublicAPI.checkRegister.mail.exist");
            }
            //校验邮箱验证码
//            boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, email);
//            if (!mailRt) {
//                return Result.error("AppPublicAPI.checkRegister.check.code.error");
//            }
            if (userBasicDO.getRecomId() == null || userBasicDO.getRecomId() <= 0) {
                userBasicDO.setRecomId(1);
            } else {
                SwUserBasicDO swUserBasicDO = swUserBasicService.get(userBasicDO.getRecomId());
                if (swUserBasicDO == null) {
                    return Result.error("AppPublicAPI.checkRegister.recommender.not.exist");
                }
            }
            result = swUserBasicService.userReg(userBasicDO);
        } catch (Exception e) {
            e.printStackTrace();
            result = Result.error("AppPrivateAPI.register.block.error");
        }
        return result;
    }

    /**
     * 登录接口
     *
     * @return
     */
    @RequestMapping("login")
    public Result login(String email, String loginPass) {
        try {
            SwUserBasicDO swUserBasicDO = new SwUserBasicDO();
            if (StringUtils.isBlank(email) || StringUtils.isBlank(loginPass)) {
                return Result.error("system.params.error",null);
            }
            swUserBasicDO.setEmail(email);
            swUserBasicDO.setLoginPass(MyMD5Utils.encodingAdmin(loginPass));
            SwUserBasicDO exSwUserBasicDO = swUserBasicService.get(swUserBasicDO);
            if (exSwUserBasicDO == null || exSwUserBasicDO.getTid() <= 0) {
                return Result.error("AppPublicAPI.login.username.or.password.error");
            }
            String accessKey = IDUtils.getUserIdEncode(prefix, exSwUserBasicDO.getTid() + "");
            AppUserUtils.pushUser(accessKey, exSwUserBasicDO.getTid() + "");
            HashMap<Object, Object> result = new HashMap<>();
            result.put("accessKey", accessKey);
            result.put("userId", exSwUserBasicDO.getTid());
            result.put("mobile", exSwUserBasicDO.getMobile());
            result.put("username", exSwUserBasicDO.getUsername());
            result.put("recomId", exSwUserBasicDO.getRecomId());
            String highPpassffective = StringUtils.isBlank(exSwUserBasicDO.getHighPass()) ? "1" : "2";
            result.put("highPpassffective", highPpassffective);
            result.put("email", exSwUserBasicDO.getEmail());
            result.put("ex1",exSwUserBasicDO.getEx1());
            result.put("registerDate", DateUtils.dateFormat(exSwUserBasicDO.getCreateDate(), DateUtils.DATE_PATTERN));
            result.put("userRole", exSwUserBasicDO.getUserType());
            log.info("用户登录接口返回数据：【" + Result.ok(result).toString() + "】");
            return Result.ok(result);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 重置密码
     * */
    @RequestMapping("set_password")
    public Result resetLoginPassword(String email, String checkCode, String pass, String type) {
        try {
            if(StringUtils.isBlank(email) || StringUtils.isBlank(email) || StringUtils.isBlank(email) || StringUtils.isBlank(email)){
                return Result.error("system.params.error");
            }
            SwUserBasicDO user = new SwUserBasicDO();
            user.setEmail(email);
            SwUserBasicDO byEmail = swUserBasicService.getByEmail(email);
            if(byEmail == null){
                return Result.error("AppPublicAPI.resetLoginPassword.user.not.exist");
            }
            if(StringUtils.isBlank(byEmail.getEx1())){
                return Result.error("system.google.coder.not.bind");
            }
            user.setTid(byEmail.getTid());
            //校验邮箱验证码
            //boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, email);
            //校验谷歌验证码
            GoogleAuthenticator googleAuthenticator = new GoogleAuthenticator();
            boolean b = googleAuthenticator.check_code(byEmail.getEx1(), checkCode, System.currentTimeMillis());
            if (!b) {
                return Result.error("AppPublicAPI.checkRegister.check.code.error");
            }
            pass = MyMD5Utils.encodingAdmin(pass);
            if (type.equals("1")) {
                user.setLoginPass(pass);
            } else if (type.equals("2")) {
                user.setHighPass(pass);
            }
            swUserBasicService.update(user);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 获取资讯列表
     * @param type 类型，1-轮播图，2-轮播图下菜单，3-推荐菜单，4-table
     * @param level 菜单层级，1-一级菜单，2-二级菜单
     * @param fatherId 父菜单id
     * @param page 分页页数，从第0页开始
     * @param pageSize 分页每页显示数量
     * */
    @RequestMapping(value = "get_information")
    @ResponseBody
    public Result get_information(
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String level,
            @RequestParam(required = false) String fatherId,
            @RequestParam(required = false) Integer page,
            @RequestParam(required = false) Integer pageSize){
        try {
            Map<String,Object> params = new HashMap();
            params.put("delFlag", CommonStatic.NOTDELETE);
            params.put("type", type);
            params.put("level", level);
            params.put("ex1", fatherId);
            params.put("status", CommonStatic.ACTIVE);
            if(page == null || pageSize == null){
                return Result.ok(informationService.list(params));
            }else{
                return Result.ok(informationService.list(params).stream().skip(page * pageSize).limit(pageSize).collect(Collectors.toList()));
            }

        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 获取资讯详情
     * */
    @RequestMapping(value = "get_information_detail")
    @ResponseBody
    public Result get_information_detail(String tid){
        try {
            if(StringUtils.isBlank(tid)){
                return Result.error("system.params.error");
            }
            return Result.ok(informationService.get(tid));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 社群列表
     * */
    @RequestMapping(value = "get_team_info")
    @ResponseBody
    public Result getTeamInfo(){
        try {
            return Result.ok(swTeamInfoService.list(new HashMap<>()));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }


    /**
     * 充值，直接确认到账
     * @param memo 用户id
     * @param amount 金额
     * @param symbol 币种名称（ETH和BBCT）
     * @param txid 区块链交易id
     * */
    @RequestMapping(value = "charge",method = RequestMethod.POST)
    @ResponseBody
    public Result charge(Integer memo, Double amount, String symbol, String txid) {
        try {
            SwChargelogDO swChargelogDO = new SwChargelogDO();
            swChargelogDO.setStatus(CommonStatic.TRANSFER_SUCCESS);
            if(StringUtils.isBlank(memo) || StringUtils.isBlank(symbol) || StringUtils.isBlank(txid) || amount == null){
                log.error("区块链充值，参数错误！");
                swChargelogDO.setEx2("区块链充值，参数错误！");
                swChargelogDO.setStatus(CommonStatic.TRANSFER_FAILED);
            }
            SwUserBasicDO swUserBasicDO = swUserBasicService.get(memo);
            if(swUserBasicDO == null){
                log.error("区块链转账用户账户不存在！");
                swChargelogDO.setEx2("区块链转账用户账户不存在！");
                swChargelogDO.setStatus(CommonStatic.TRANSFER_FAILED);
            }
            SwCoinTypeDO coinTypeDO = swCoinTypeService.getByCoinName(symbol);
            if(coinTypeDO == null){
                log.error("区块链转账币种【"+symbol+"】不存在！");
                swChargelogDO.setEx2("区块链转账币种【"+symbol+"】不存在！");
                swChargelogDO.setStatus(CommonStatic.TRANSFER_FAILED);
                swChargelogDO.setCoinId(null);
            }else{
                swChargelogDO.setCoinId(coinTypeDO.getTid());
            }
            swChargelogDO.setTid(IDUtils.randomStr());
            swChargelogDO.setCreateDate(new Date());
            swChargelogDO.setUpdateDate(new Date());
            swChargelogDO.setDelFlag(CommonStatic.NOTDELETE);
            swChargelogDO.setUserId(swUserBasicDO.getTid());
            swChargelogDO.setAddress(swUserBasicDO.getEx2());
            swChargelogDO.setAmount(new BigDecimal(String.valueOf(amount)));
            swChargelogDO.setTxid(txid);
            swChargelogService.confirmCharge(swChargelogDO);
            return Result.ok();
        }catch (Exception e){
            log.error("区块链充值待确认，但本地充值失败！");
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 确认提币
     * @param status 区块链交易状态，1-成功，2-失败
     * @param txid 区块链交易id
     * */
/*    @RequestMapping(value = "confirm_withdraw",method = RequestMethod.POST)
    @ResponseBody
    @Deprecated
    public Result confirmWithdraw(Integer status, String txid) {
        if(StringUtils.isBlank(txid)){
            return Result.error("system.params.error");
        }
        SwWithlogDO byTxid = swWithlogService.getByTxid(txid);
        try {
            if(byTxid != null){
                if(status == 1){
                    byTxid.setStatus(CommonStatic.TRANSFER_SUCCESS);
                }else{
                    byTxid.setStatus(CommonStatic.TRANSFER_FAILED);
                }
                byTxid.setUpdateDate(new Date());
                swWithlogService.withlogCompleted(byTxid);
                return Result.ok();
            }else{
                return Result.error("system.failed.operation");
            }
        }catch (Exception e){
            *//*SwWalletsDO wallet = swWalletsService.getWallet(byTxid.getUserId(), byTxid.getCoinTypeId());
            wallet.setCurrency(byTxid.getAmount());
            wallet.setFrozenAmount(new BigDecimal("0").subtract(byTxid.getAmount()));
            wallet.setUpdateDate(new Date());
            swWalletsService.update(wallet);*//*
            byTxid.setStatus(CommonStatic.TRANSFER_FAILED);
            swWithlogService.update(byTxid);
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }*/

    /**
     * 记录前端日志
     */
    @RequestMapping("log_error_info")
    @ResponseBody
    public ServerResponse LogErrorInfo(@RequestBody LogDO log) {
        log.setGmtCreate(new Date());
        log.setOperation("frontError");
        logService.save(log);
        return ServerResponse.createBySuccess();
    }

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @RequestMapping("test")
    @ResponseBody
    public ServerResponse test() {
        return ServerResponse.createBySuccess(languagei18nUtils.getMessage("user.withdraw.coin"));
    }


}
