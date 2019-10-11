package com.api;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.utils.*;
import com.common.utils.i18n.LanguageEnum;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.evowallet.utils.MailUtil;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import com.gexin.fastjson.JSON;
import com.gexin.fastjson.JSONArray;
import com.gexin.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import static org.apache.shiro.web.filter.mgt.DefaultFilter.user;

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
    private SwCoinTypeService swCoinTypeService;

    @Autowired
    private SwConsumeLogService swConsumeLogService;

    @Autowired
    private SwBenchmarkingService swBenchmarkingService;

    @Autowired
    private SwPrincipalUserService swPrincipalUserService;

    @Autowired
    private SwCurrentUserService swCurrentUserService;

    @Autowired
    private SwPeriodUserService swPeriodUserService;

    @Autowired
    private SwBenchlogService swBenchlogService;

    @Autowired
    private SwFiatCoinService swFiatCoinService;

    @Autowired
    private SwReleaseRecordService swReleaseRecordService;

    @Autowired
    private SwTransferRecordService swTransferRecordService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Value("${configs.bbctChargeAddress}")
    private String bbctChargeAddress;

    @Value("${configs.eosChargeAddress}")
    private String eosChargeAddress;

    @Value("${configs.usercache.prefix}")
    private String prefix;

    @Value("${configs.withdrawFee}")
    private Double withdrawFee;

    @Value("${configs.benchmarketingRate}")
    private Double benchmarketingRate;

    /**
     * 计价方式
     * */
    @RequestMapping("get_fiat_type_price")
    @ResponseBody
    public Result getOtcFiatCoinTypeAndPrice(){
        return Result.ok(swFiatCoinService.getCountryOfShow((byte)1));
    }

    /**
     * 对标倍率
     * */
    @RequestMapping("benchmarking_rate")
    @ResponseBody
    public Result benchmarkingRate(){
        return Result.ok(benchmarketingRate);
    }

    /**
     * 提币手续费
     * */
    @RequestMapping("withdraw_fee")
    @ResponseBody
    public Result withdrawFee(){
        return Result.ok(withdrawFee);
    }

    /**
     * 获取用户信息
     *
     * @param req
     * @return
     */
    @RequestMapping("get_user_info")
    public Object getUserInfo(HttpServletRequest req) throws Exception{
        SwUserBasicDO user = AppUserUtils.getUser(req);
        Integer userId = null;
        String accessKey = req.getHeader("accessKey");
        if(user != null){
            userId = user.getTid();
            HashMap<Object, Object> result = new HashMap<>();
            result.put("accessKey", accessKey);
            result.put("userId",userId);
            result.put("areaCode", user.getAreaCode());
            result.put("mobile",user.getMobile());
            result.put("username",user.getUsername());
            result.put("recomId", user.getRecomId());
            result.put("recomId", user.getRecomId());
            result.put("userPush",swUserBasicService.getUserRecomLike(user));
            result.put("teamUserNum",swUserBasicService.getChildrenTreeUserNum(user.getTid()));
            String highPpassffective = StringUtils.isBlank(user.getHighPass()) ? "1": "2";
            result.put("highPpassffective",highPpassffective);

            List<SwPrincipalUserDO> myPrincipal = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            List<SwCurrentUserDO> myCurrent = swCurrentUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            List<SwPeriodUserDO> myPeriod = swPeriodUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            //未拥有固币金，就可以购买固币金
            if(myPrincipal == null || myPrincipal.size() == 0){
                result.put("buyPrincipal",true);
                result.put("buyAccelerate",false);
            }else{
                result.put("buyPrincipal",false);
                //拥有活币金或定币金之一，就不能购买任意加速产品
                if((myCurrent != null && myCurrent.size() > 0) || (myPeriod != null && myPeriod.size() > 0)){
                    result.put("buyAccelerate",false);
                }else{
                    result.put("buyAccelerate",true);
                }
            }
            result.put("email",user.getEmail());
            result.put("registerDate",DateUtils.dateFormat(user.getCreateDate(),DateUtils.DATE_PATTERN));
            result.put("userRole",user.getUserType());
            log.info("获取用户登录信息接口返回值：【"+Result.ok(result).toString()+"】");
            return Result.ok(result);
        }else{
            log.info("获取用户登录信息接口返回值：【"+Result.ok("登录异常").toString()+"】");
            return Result.error("AppPrivateAPI.getUserInfo.login.error");
        }
    }

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
                    || StringUtils.isBlank(swEvangelistInfoDO.getMobile())
                    || StringUtils.isBlank(swEvangelistInfoDO.getAddress())){
                return Result.error("system.params.error");
            }
            SwUserBasicDO byEmail = swUserBasicService.getByEmail(swEvangelistInfoDO.getEmail());
            if(byEmail != null){
                return Result.error("AppPrivateAPI.resetLoginPassword.email.exist");
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
     * 充币地址
     * */
    @RequestMapping(value = "charge_address",method = RequestMethod.GET)
    public Result chargeAddress(Integer type) {
        try {
            if(type == 1){
                return Result.ok(bbctChargeAddress);
            }else{
                return Result.ok(eosChargeAddress);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 充币记录
     * */
    @RequestMapping(value = "charge_log",method = RequestMethod.GET)
    public Result chargeLog(HttpServletRequest request,String coinTypeId, Integer page, Integer pageSize) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Map<String,Object> params = new HashMap<>();
            params.put("userId",user.getTid());
            params.put("delFlag",CommonStatic.NOTDELETE);
            params.put("coinId",coinTypeId);
            List<SwChargelogDO> list = swChargelogService.list(params).stream().skip(page * pageSize).limit(pageSize).collect(Collectors.toList());
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 充币记录详情
     * */
    @RequestMapping(value = "charge_log_detail",method = RequestMethod.GET)
    public Result chargeLogDetail(String tid) {
        try {
            if(StringUtils.isBlank(tid)){
                return Result.error("system.failed.operation");
            }
            SwChargelogDO swChargelogDO = swChargelogService.get(tid);
            return Result.ok(swChargelogDO);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 提币地址列表
     * */
    @RequestMapping(value = "withdraw_address",method = RequestMethod.GET)
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
            return Result.error("system.failed.operation");
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
                return Result.error("system.params.error");
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
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 修改提币地址
     * */
    @RequestMapping(value = "edit_withdraw_address",method = RequestMethod.POST)
    public Result editWithdrawAddress(@RequestBody SwWithdrawAddressDO swWithdrawAddressDO) {
        try {
            if(StringUtils.isBlank(swWithdrawAddressDO.getTid())){
                return Result.error("system.params.error");
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
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
                return Result.error("system.reject.operation");
            }
            if(swWithdrawAddressDO == null){
                return Result.error("system.failed.operation");
            }
            swWithdrawAddressDO.setUpdateDate(new Date());
            swWithdrawAddressDO.setDelFlag(CommonStatic.DELETE);
            swWithdrawAddressService.update(swWithdrawAddressDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 提币记录列表
     * */
    @RequestMapping(value = "withdraw_log",method = RequestMethod.GET)
    public Result withdrawLog(HttpServletRequest request, String coinTypeId, Integer page, Integer pageSize) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            Map<String,Object> params = new HashMap<>();
            params.put("userId",user.getTid());
            params.put("delFlag",CommonStatic.NOTDELETE);
            params.put("coinTypeId",coinTypeId);
            List<SwWithlogDO> list = swWithlogService.list(params).stream().skip(page * pageSize).limit(pageSize).collect(Collectors.toList());
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 提币记录详情
     * */
    @RequestMapping(value = "withdraw_log_detail",method = RequestMethod.GET)
    public Result withdrawLogDetail(String tid) {
        try {
            SwWithlogDO swWithlogDO = swWithlogService.get(tid);
            return Result.ok(swWithlogDO);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 转账-校验收款用户
     * */
    @RequestMapping(value = "check_user",method = RequestMethod.GET)
    @ResponseBody
    public Result checkUser(Integer userId) {
        try {
            if(StringUtils.isBlank(userId)){
                return Result.error("AppPrivateAPI.checkUser.receiver.not.exist");
            }
            SwUserBasicDO user = swUserBasicService.get(userId);
            if (user == null) {
                return Result.error("AppPrivateAPI.checkUser.receiver.not.exist");
            }
            if(user.getEmail() != null){
                if(user.getEmail().endsWith("canceled")){
                    return Result.error("AppPrivateAPI.checkUser.receiver.written.off");
                }
            }
            return Result.ok(user);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 转账
     * */
    @RequestMapping(value = "transfer",method = RequestMethod.POST)
    @ResponseBody
    public Result TransferAccount(HttpServletRequest request,
                                  @RequestParam Integer userId,
                                  @RequestParam double amount,
                                  @RequestParam String coinId,
                                  @RequestParam String remark,
                                  @RequestParam String tradingPassword) {
        try {
            if(userId == null || amount <=0 || StringUtils.isBlank(coinId) || StringUtils.isBlank(tradingPassword)){
                return Result.error("system.params.error");
            }
            SwUserBasicDO user = AppUserUtils.getUser(request);
            String msg = swConsumeLogService.transfer(user, userId, amount, coinId, remark, tradingPassword);
            if(StringUtils.isNotBlank(msg)){
                return Result.error(msg);
            }
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 转账记录
     * */
    @RequestMapping(value = "transfer_log",method = RequestMethod.GET)
    @ResponseBody
    public Result TransferLog(HttpServletRequest request, Integer page, Integer pageSize, @RequestParam(required = false) String beginDate, @RequestParam(required = false) String endDate) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isNotBlank(beginDate)){
                beginDate = beginDate + " 00:00:00";
            }
            if(StringUtils.isNotBlank(beginDate)){
                endDate = endDate + " 23:59:59";
            }
            List<SwTransferRecordDO> list = swTransferRecordService.transferRecord(user.getTid(),beginDate,endDate);
            List<SwTransferRecordDO> res = list.stream().skip(page * pageSize).limit(pageSize).collect(Collectors.toList());
            return Result.ok(res);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 对标项目列表
     * */
    @RequestMapping(value = "bench_marking_list",method = RequestMethod.GET)
    @ResponseBody
    public Result benchMarking() {
        try {
            Map<String,Object> map = new HashMap<>();
            map.put("delFlag",CommonStatic.NOTDELETE);
            List<SwBenchmarkingDO> list = swBenchmarkingService.list(map);
            return Result.ok(list);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 对标
     * */
    @RequestMapping(value = "bench",method = RequestMethod.POST)
    @ResponseBody
    public Result bench(String benchMarkingId, HttpServletRequest request) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        if(StringUtils.isBlank(benchMarkingId)){
            return Result.error("system.params.error");
        }
        SwBenchmarkingDO swBenchmarkingDO = swBenchmarkingService.get(benchMarkingId);
        if(swBenchmarkingDO == null){
            return Result.error("system.failed.operation");
        }
        SwWalletsDO sourceAmount = swWalletsService.getWallet(user.getTid(), swBenchmarkingDO.getSourceCoinId());
        if(sourceAmount.getCurrency().compareTo(new BigDecimal(String.valueOf(swBenchmarkingDO.getSourceNum()))) < 0){
            SwCoinTypeDO swCoinTypeDO = swCoinTypeService.get(swBenchmarkingDO.getSourceCoinId());
            return Result.error("AppPrivateAPI.bench.source.coin.not.enough",swCoinTypeDO.getCoinName());
        }
        try {
            SwBenchlogDO swBenchlogDO = new SwBenchlogDO();
            swBenchlogDO.setTid(IDUtils.randomStr());
            swBenchlogDO.setCreateDate(new Date());
            swBenchlogDO.setUpdateDate(new Date());
            swBenchlogDO.setDelFlag(CommonStatic.NOTDELETE);
            swBenchlogDO.setSourceCoinId(swBenchmarkingDO.getSourceCoinId());
            swBenchlogDO.setTargetCoinId(swBenchmarkingDO.getTargetCoinId());
            swBenchlogDO.setSourceNum(swBenchmarkingDO.getSourceNum());
            swBenchlogDO.setTargetNum(swBenchmarkingDO.getTargetNum());
            swBenchlogDO.setUserId(user.getTid());
            swBenchlogService.save(swBenchlogDO);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 对标记录
     * */
    @RequestMapping(value = "bench_log",method = RequestMethod.GET)
    @ResponseBody
    public Result benchLog(HttpServletRequest request, Integer page, Integer pageSize) {
        SwUserBasicDO user = AppUserUtils.getUser(request);
        try {
            Map<String,Object> params = new HashMap<>();
            params.put("delFlag",CommonStatic.NOTDELETE);
            params.put("userId",user.getTid());
            return Result.ok(swBenchlogService.list(params).stream().skip(page * pageSize).limit(pageSize).collect(Collectors.toList()));
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 修改昵称
     * */
    @RequestMapping(value = "change_name",method = RequestMethod.POST)
    @ResponseBody
    public Result changeName(HttpServletRequest request, String name) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(name)){
                return Result.error("system.params.error");
            }
            user.setUsername(name);
            swUserBasicService.update(user);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 退出登录
     *
     * @param req
     * @return
     */
    @RequestMapping("logout")
    public Result logout(HttpServletRequest req) {
        SwUserBasicDO user = AppUserUtils.getUser(req);
        if (user != null) {
            AppUserUtils.removeRedis(IDUtils.getUserIdEncode(prefix,String.valueOf(user.getTid())));
            return Result.ok();
        }
        return Result.error("system.failed.operation");
    }

    /**
     * 个人推广信息（邀请页面自己的信息）
     * */
    @RequestMapping(value = "my_push_info",method = RequestMethod.GET)
    @ResponseBody
    public Result myPushInfo(HttpServletRequest request) {
        try {
            Map<String,Object> result = new HashMap<>();
            SwUserBasicDO user = AppUserUtils.getUser(request);
            List<SwReleaseRecordDO> iRelease = swReleaseRecordService.getCauseRelease(user.getTid(), 1);
            double iReleaseNum = iRelease.stream().collect(Collectors.summarizingDouble(SwReleaseRecordDO::getAmount)).getSum();
            List<SwReleaseRecordDO> otherRelease = swReleaseRecordService.getCauseRelease(user.getTid(), 2);
            double otherReleaseNum = otherRelease.stream().collect(Collectors.summarizingDouble(SwReleaseRecordDO::getAmount)).getSum();
            BigDecimal i = new BigDecimal(String.valueOf(iReleaseNum));
            BigDecimal other = new BigDecimal(String.valueOf(otherReleaseNum));
            result.put("othersReleaseNum",other);
            BigDecimal total = i.add(other).doubleValue() == 0?new BigDecimal("1"):i.add(other);
            BigDecimal otherPercent = other.divide(total).setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            result.put("othersReleasePercent",otherPercent);
            Integer childrenUserNum = swUserBasicService.getChildrenUserNum(user.getTid());
            result.put("childUserNum",childrenUserNum);
            Integer childrenTreeUserNum = swUserBasicService.getChildrenTreeUserNum(user.getTid());
            result.put("teamUserNum",childrenTreeUserNum);
            return Result.ok(result);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 提币
     * @param address 提币地址
     * @param amount 数量
     * @param coinId 币种id
     * */
    @RequestMapping(value = "withdraw",method = RequestMethod.POST)
    @ResponseBody
    public Result withdraw(HttpServletRequest request, String address, Double amount, String coinId, String transferPassword, String checkCode, String memo) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(coinId) || amount == null || amount <=0 || StringUtils.isBlank(coinId)){
                return Result.error("system.params.error");
            }
            if(address.equals(bbctChargeAddress) || address.equals(eosChargeAddress)){
                return Result.error("AppPrivateAPI.withdraw.address.equals.charge.address");
            }
            SwWalletsDO wallet = swWalletsService.getWallet(user.getTid(), coinId);
            if(wallet == null){
                return Result.error("system.wallet.error");
            }
            if(wallet.getCurrency().compareTo(new BigDecimal(String.valueOf(amount))) < 0){
                return Result.error("system.balance.not.enough");
            }
            SwCoinTypeDO swCoinTypeDO = swCoinTypeService.get(coinId);
            if(swCoinTypeDO == null){
                return Result.error("system.coin.error");
            }
            Boolean checkTradingPassword = swUserBasicService.checkTradingPassword(user.getTid(), user.getEmail(), transferPassword);
            if(!checkTradingPassword){
                return Result.error("system.password.error");
            }
            //校验邮箱验证码
            boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, user.getEmail());
            if (!mailRt) {
                return Result.error("AppPublicAPI.checkRegister.check.code.error");
            }
            swWithlogService.withdraw(user.getTid(),address,amount,swCoinTypeDO.getCoinName(),memo);
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }
}
