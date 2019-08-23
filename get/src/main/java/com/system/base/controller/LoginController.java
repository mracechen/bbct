package com.system.base.controller;

import com.common.annotation.Log;
import com.common.basicskills.controller.BaseController;
import com.common.basicskills.domain.FileDO;
import com.common.basicskills.domain.Tree;
import com.common.basicskills.service.FileService;
import com.common.utils.*;
import com.get.statuc.R;
import com.system.base.domain.MenuDO;
import com.system.base.domain.UserDO;
import com.system.base.domain.UserOnline;
import com.system.base.service.MenuService;
import com.system.base.service.SessionService;
import com.system.base.service.UserService;
import com.system.record.domain.MsgRecordDO;
import com.system.record.service.MsgRecordService;
import com.system.sysconfig.configbean.SettlementCommonConfig;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@RequestMapping("${backPathPrefix}")
@Controller
public class LoginController extends BaseController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /** 管理员用户表 */
    @Autowired
    UserService userService;

    /** 短信发送记录 */
    @Autowired
    MsgRecordService msgRecordService;

    @Value("${configs.msg.checkCheckCode}")
    boolean checkCheckCode;
    @Value("${spring.profiles.active}")
    String active;

    @Autowired
    MenuService menuService;
    @Autowired
    FileService fileService;

    @Autowired
    SessionService sessionService;

    @Log("请求访问主页")
    @GetMapping({"/index"})
    String index(Model model) {
        SettlementCommonConfig commonConfig = new SettlementCommonConfig();
        model.addAttribute("isCheckMobileCode", commonConfig.getIsEnableAdminLoginMobileCheck().getFieldValue());
        model.addAttribute("websiteLogo", commonConfig.getWebsiteLogo().getFieldValue());
        model.addAttribute("backWebsiteFullName", commonConfig.getBackWebsiteFullName().getFieldValue());
        model.addAttribute("backWebsiteSubName", commonConfig.getBackWebsiteSubName().getFieldValue());
        List<Tree<MenuDO>> menus = menuService.listMenuTree(getUserId());
        model.addAttribute("menus", menus);
        model.addAttribute("name", getUser().getName());
        FileDO fileDO = fileService.get(getUser().getPicId());
        if (fileDO != null && fileDO.getUrl() != null) {
            if (fileService.isExist(fileDO.getUrl())) {
                model.addAttribute("picUrl", fileDO.getUrl());
            } else {
                model.addAttribute("picUrl", "/logo.jpg");
            }
        } else {
            model.addAttribute("picUrl", "/logo.jpg");
        }
        model.addAttribute("username", getUser().getUsername());
        return "index_v1";
    }

    @GetMapping("/login")
    String login(Model model) {
        model.addAttribute("isCheckCheckCode", checkCheckCode);
        model.addAttribute("active", active);
        SettlementCommonConfig commonConfig = new SettlementCommonConfig();
        model.addAttribute("isCheckMobileCode", commonConfig.getIsEnableAdminLoginMobileCheck().getFieldValue());
        model.addAttribute("websiteLogo", commonConfig.getWebsiteLogo().getFieldValue());
        model.addAttribute("backWebsiteFullName", commonConfig.getBackWebsiteFullName().getFieldValue());
        model.addAttribute("backWebsiteSubName", commonConfig.getBackWebsiteSubName().getFieldValue());
        return "login";
    }

    @Log("登录")
    @PostMapping("/login")
    @ResponseBody
    R ajaxLogin(String username, String password, HttpServletRequest request, String checkCode, String mobileCheckCode) {
        boolean checkCheckCode = checkCheckCode(request, checkCode);
        if (!checkCheckCode) {
            return R.error("验证码错误");
        }

        // 判断是否开启短信验证登陆
        SettlementCommonConfig commonConfig = new SettlementCommonConfig();
        if("0".equals(commonConfig.getIsEnableAdminLoginMobileCheck().getFieldValue())){
            // 查询用户
            Map<String, Object> queryParam = new LinkedHashMap<>();
            queryParam.put("username",username);
            List<UserDO> list = userService.list(queryParam);
            if(list == null || list.size() !=  1){
                return R.error("用户名或密码错误");
            }

            UserDO userDO = list.get(0);
            if(userDO == null || StringUtils.isBlank(userDO.getUsername()) || StringUtils.isBlank(mobileCheckCode)){
                return R.error("验证码有误");
            }
            // 校验验证码
            queryParam.put("mobile",userDO.getMobile());
            queryParam.put("msgContent",mobileCheckCode);
            queryParam.put("status","0");
            queryParam.put("delFlag","0");
            // 验证码有效时间为5分钟所以查询5分钟以内的
            Date date = DateUtils.dateAddMinutes(new Date(), 5,false);
            queryParam.put("createStartDate", DateUtils.dateFormat(date,DateUtils.DATE_TIME_PATTERN));
            List<MsgRecordDO> msgList = msgRecordService.list(queryParam);
            if(msgList == null || msgList.size() != 1){
                return R.error("验证码不正确");
            }
            MsgRecordDO msgRecordDO = msgList.get(0);
            msgRecordDO.setStatus("1");
            msgRecordService.update(msgRecordDO);

        }

//        password = MD5Utils.encrypt(username, password);
        password = MyMD5Utils.encodingAdmin(username+password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();

        // 获得shiro中的所有登录用户,如果当前用户名有登录就下线之前登录的用户
        List<UserOnline> list = sessionService.list();
        for (UserOnline userOnline : list) {
            if(username.equals(userOnline.getUsername())){
                sessionService.forceLogout(userOnline.getId());
//                return R.error("!");
                break;
            }
        }

        try {
            subject.login(token);
            return R.ok();
        } catch (AuthenticationException e) {
            return R.error(e.getMessage());
        }
    }

    @GetMapping("/logout")
    String logout() {
        ShiroUtils.logout();
        return "redirect:/login";
    }

    @GetMapping("/main")
    String main() {
        return "main";
    }

    @PostMapping("/sendMobileCheckCode")
    @ResponseBody
    Result sendMobileCheckCode(String username) {
        if (StringUtils.isBlank(username)) {
            return Result.error("请输入登录账号！");
        }
        SettlementCommonConfig commonConfig = new SettlementCommonConfig();
        if("1".equals(commonConfig.getIsEnableAdminLoginMobileCheck().getFieldValue())){
            return Result.error("未开启手机验证！");
        }


        Map<String, Object> queryParam = new HashMap<>();
        queryParam.put("username", username);
        List<UserDO> list = userService.list(queryParam);
        if(list == null  || list.size() != 1){
            return Result.error("用户不存在！");
        }

        UserDO userDO = list.get(0);
        if(userDO == null || StringUtils.isBlank(userDO.getUsername())){
            return Result.error("用户不存在！");
        }

        queryParam.put("mobile",userDO.getMobile());
        queryParam.put("status","0");
        queryParam.put("delFlag","0");
        // 验证码有效时间为5分钟所以查询5分钟以内的
        Date date = DateUtils.dateAddMinutes(new Date(), 5,false);
        queryParam.put("createStartDate", DateUtils.dateFormat(date,DateUtils.DATE_TIME_PATTERN));
        List<MsgRecordDO> msgList = msgRecordService.list(queryParam);
        if(msgList == null || msgList.size() != 0){
            return Result.error("验证码有效期为5分钟！");
        }


        String checkCode = IDUtils.getCheckCode();
        MsgRecordDO msgRecordDO = MsgRecordDO.create(userDO.getMobile(), checkCode);

        MessageUtils.send(userDO.getMobile(),MessageUtils.adminLoginMsg(checkCode));
        msgRecordService.save(msgRecordDO);
        return Result.ok("发送成功！");
    }

    /**
     * 获得图片验证码
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 设置相应类型,告诉浏览器输出的内容为图片
            response.setContentType("image/jpeg");
            // 设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            CheckCodeGenerate randomValidateCode = new CheckCodeGenerate();
            // 输出验证码图片方法
            randomValidateCode.getRandcode(request, response);
        } catch (Exception e) {
            logger.error("获取验证码失败>>>>   ", e);
        }
    }

    /**
     * 校验验证码
     *
     * @param request
     * @return
     */
    public boolean checkCheckCode(HttpServletRequest request, String checkCode) {
        if (!checkCheckCode) {
            return true;
        }

        try {
            //从session中获取随机数
            String random = (String) request.getSession().getAttribute(CheckCodeGenerate.RANDOMCODEKEY);
            if (random == null || checkCode == null) {
                request.getSession().removeAttribute(CheckCodeGenerate.RANDOMCODEKEY);
                return false;
            }
            if (random.equalsIgnoreCase(String.valueOf(checkCode))) {
                return true;
            } else {
                request.getSession().removeAttribute(CheckCodeGenerate.RANDOMCODEKEY);
                return false;
            }
        } catch (Exception e) {
            request.getSession().removeAttribute(CheckCodeGenerate.RANDOMCODEKEY);
            logger.error("验证码校验失败", e);
            return false;
        }
    }

}
