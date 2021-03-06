package com.api;

import com.alibaba.fastjson.JSONObject;
import com.common.feign.BlockApi;
import com.common.utils.*;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.*;
import com.system.sysconfig.configbean.SettlementCommonConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author longge
 * @desc app需要登录的接口
 * @date 2018-10-12
 */

@RestController
@RequestMapping(value = "/api/app/pv")
public class AppPrivateAPI {

    private Logger log = LoggerFactory.getLogger(AppPrivateAPI.class);

    @Autowired
    private SwUserBasicService swUserBasicService;

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
    private SwEvangelistUserService swEvangelistUserService;

    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Autowired
    private BlockApi blockApi;

//    @Value("${configs.chargeAddress}")
//    private String chargeAddress;

    @Value("${configs.usercache.prefix}")
    private String prefix;

    @Value("${configs.withdrawFee}")
    private Double withdrawFee;

    @Value("${configs.benchmarketingRate}")
    private Double benchmarketingRate;

//    @Value("${configs.allowTransfer}")
//    private Boolean allowTransfer;

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
            SettlementCommonConfig config = new SettlementCommonConfig();
            String isOpen = config.getOpenCoinRepo().getFieldValue();
            if(StringUtils.isNotBlank(isOpen) && isOpen.equals("0")){
                result.put("allowTransfer", true);
            }else{
                result.put("allowTransfer", false);
            }

            result.put("googleKey", user.getEx1());
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
     * 充币地址
     * */
    @RequestMapping(value = "charge_address",method = RequestMethod.GET)
    public Result chargeAddress(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            SwUserBasicDO swUserBasicDO = swUserBasicService.get(user.getTid());
            if(StringUtils.isBlank(swUserBasicDO.getEx2())){
                //调用区块链接口，获取区块链账户地址
                Map<String,Object> params = new HashMap<>();
                params.put("uid",user.getTid());
                JSONObject newAddress = blockApi.getNewAddress(params);
                if(org.apache.commons.lang3.StringUtils.isNotBlank(newAddress.toJSONString()) && newAddress.containsKey("result")){
                    Object result = newAddress.get("result");
                    if(result != null){
                        String address = String.valueOf(result);
                        swUserBasicDO.setEx2(address);
                        swUserBasicService.update(swUserBasicDO);
                        return Result.ok(address);
                    }else{
                        throw new Exception("获取区块链账户地址失败");
                    }
                }else{
                    throw new Exception("获取区块链账户地址失败");
                }
            }else{
                return Result.ok(swUserBasicDO.getEx2());
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
    public Result checkUser(HttpServletRequest request, Integer userId) {
        try {
            SwUserBasicDO myself = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(userId)){
                return Result.error("AppPrivateAPI.checkUser.receiver.not.exist");
            }
            if(myself.getTid().equals(userId)){
                return Result.error("AppPrivateAPI.checkUser.can.not.transfer.to.himself");
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
        //只有布道者和合伙人才能进行对标
        if(user.getUserType().equals(CommonStatic.USER_TYPE_COMMON)){
            return Result.error("system.failed.auth");
        }
        //如果当前本金没释放完，不允许对标
        if(user.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
            SwEvangelistUserDO evangelistUserDO = swEvangelistUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(evangelistUserDO != null){
                return Result.error("AppPrivateAPI.bench.current.evangelist.not.finished");
            }
        }
        if(user.getUserType().equals(CommonStatic.USER_TYPE_PARTNER)){
            SwPartnerUserDO partnerUserDO = swPartnerUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(partnerUserDO != null){
                return Result.error("AppPrivateAPI.bench.current.partner.not.finished");
            }
        }
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
            BigDecimal otherPercent = other.divide(total,NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
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
    public Result withdraw(HttpServletRequest request, String address, Double amount, String coinId, String transferPassword, String checkCode) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(coinId) || amount == null || amount <=0 || StringUtils.isBlank(coinId)){
                return Result.error("system.params.error");
            }
            if(StringUtils.isBlank(user.getEx1())){
                return Result.error("system.google.coder.not.bind");
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
            //boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, user.getEmail());
            //校验谷歌验证码
            GoogleAuthenticator googleAuthenticator = new GoogleAuthenticator();
            boolean b = googleAuthenticator.check_code(user.getEx1(), checkCode, System.currentTimeMillis());
            if (!b) {
                return Result.error("AppPublicAPI.checkRegister.check.code.error");
            }
            swWithlogService.withdraw(user.getTid(),address,amount,swCoinTypeDO.getCoinName());
            return Result.ok();
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 绑定谷歌验证器-生成二维码和私钥
     * */
    @RequestMapping(value = "bind_google_coder",method = RequestMethod.GET)
    @ResponseBody
    public Result bindGoogleCoder(HttpServletRequest request, String token) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            //如果是重置谷歌验证器
            if(StringUtils.isNotBlank(user.getEx1()) && StringUtils.isNotBlank(token)){
                String tokenValue = TokenCache.getKey(token);
                if(StringUtils.isBlank(tokenValue)){
                    return Result.error("system.checkCode.expired");
                }
            }else if((StringUtils.isBlank(user.getEx1()) && StringUtils.isNotBlank(token))
                    || (StringUtils.isNotBlank(user.getEx1()) && StringUtils.isBlank(token))){
                return Result.error("system.params.error");
            }
            String secretKey = GoogleAuthenticator.generateSecretKey();
            String qrBarcode = GoogleAuthenticator.getQRBarcode("bbct" + user.getEmail(), secretKey);
            Map<String,String> result = new HashMap<>();
            result.put("secretKey",secretKey);
            result.put("qrCode",qrBarcode);
            return Result.ok(result);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 绑定谷歌验证器-校验动态码
     * */
    @RequestMapping(value = "check_google_coder",method = RequestMethod.POST)
    @ResponseBody
    public Result checkGoogleCoder(HttpServletRequest request, String code, String secretKey) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            if(StringUtils.isBlank(code) || StringUtils.isBlank(secretKey)){
                return Result.error("system.params.error");
            }
            GoogleAuthenticator c = new GoogleAuthenticator();
            boolean checkResult = c.check_code(secretKey, code, System.currentTimeMillis());
            if(checkResult){
                SwUserBasicDO swUserBasicDO = new SwUserBasicDO();
                swUserBasicDO.setTid(user.getTid());
                swUserBasicDO.setEx1(secretKey);
                swUserBasicService.update(swUserBasicDO);
                return Result.ok();
            }else{
                return Result.error("system.checkCode.error");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }

    /**
     * 重置谷歌验证器(校验密码)
     * */
    @RequestMapping(value = "reset_google_coder",method = RequestMethod.POST)
    @ResponseBody
    public Result resetGoogleCoder(HttpServletRequest request, String loginPassword) {
        try {
            if(StringUtils.isBlank(loginPassword)){
                return Result.error("system.params.error");
            }
            SwUserBasicDO user = AppUserUtils.getUser(request);
            String serectLoginPassword = MyMD5Utils.encodingAdmin(loginPassword);
            if(!serectLoginPassword.equals(user.getLoginPass())){
                return Result.error("system.password.error");
            }
            String token = IDUtils.randomStr();
            String tokenValue = IDUtils.randomStr();
            TokenCache.setKey(token,tokenValue);
            Map<String,String> result = new HashMap<>();
            result.put("token",token);
            return Result.ok(result);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("system.failed.operation");
        }
    }
}
