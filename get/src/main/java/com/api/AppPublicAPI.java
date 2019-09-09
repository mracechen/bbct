package com.api;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.utils.*;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.evowallet.utils.MailUtil;
import com.get.domain.AppInfo;
import com.get.domain.InformationDO;
import com.get.domain.MailRecordDO;
import com.get.domain.SwUserBasicDO;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.util.*;

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
    private LogService logService;

    @Value("${configs.usercache.prefix}")
    private String prefix;

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

    /*
     *
     * 注册并校验       1-邮箱注册，2-手机号注册
     */
    @RequestMapping("register")
    public Object checkRegister(String email, String checkCode, String loginPass, Integer recomId) {
        Object result = null;
        try {
            SwUserBasicDO userBasicDO = new SwUserBasicDO();
            userBasicDO.setUserType(CommonStatic.USER_TYPE_COMMON);
            userBasicDO.setLoginPass(loginPass);
            userBasicDO.setRecomId(recomId);
            userBasicDO.setEmail(email);
            if (StringUtils.isBlank(email)) {
                return Result.error("AppPublicAPI.checkRegister.mail.cannot.be.null");
            }
            Map<String, Object> queryParam = new HashMap<>();
            queryParam.put("email", email);
            List<SwUserBasicDO> exUser = swUserBasicService.list(queryParam);
            if (exUser.size() > 0 && StringUtils.isNotBlank(email)) {
                return Result.error("AppPublicAPI.checkRegister.mail.exist");
            }
            //校验邮箱验证码
            boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, email);
            if (!mailRt) {
                return Result.error("AppPublicAPI.checkRegister.check.code.error");
            }
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
            result = Result.error("system.error");
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
//        String accessKey = "s"+exSwUserBasicDO.getTid();
            AppUserUtils.pushUser(accessKey, exSwUserBasicDO.getTid() + "");
            // 返回值
            HashMap<Object, Object> result = new HashMap<>();
            result.put("accessKey", accessKey);
            result.put("userId", exSwUserBasicDO.getTid());
            result.put("mobile", exSwUserBasicDO.getMobile());
            result.put("username", exSwUserBasicDO.getUsername());
//        result.put("userPush",swUserBasicService.getUserRecomLike(exSwUserBasicDO));
//        result.put("userAuth",exSwUserBasicDO.getCheckStatus());
            result.put("recomId", exSwUserBasicDO.getRecomId());
            String highPpassffective = StringUtils.isBlank(exSwUserBasicDO.getHighPass()) ? "1" : "2";
            result.put("highPpassffective", highPpassffective);
            result.put("email", exSwUserBasicDO.getEmail());
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
            user.setTid(byEmail.getTid());
            //发送邮箱验证码
            boolean mailRt = CheckCodeUtils.checkEmailCheckCode(checkCode, email);
            if (!mailRt) {
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
     * */
    @RequestMapping(value = "get_information")
    @ResponseBody
    public Result get_information(String type){
        try {
            Map<String,Object> params = new HashMap();
            params.put("delFlag", CommonStatic.NOTDELETE);
            params.put("type", type);
            params.put("status", CommonStatic.ACTIVE);
            List<InformationDO> informationList = informationService.list(params);
            return Result.ok(informationList);
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
