package com.api;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.utils.*;
import com.common.utils.i18n.Languagei18nUtils;
import com.evowallet.common.ServerResponse;
import com.evowallet.utils.MailUtil;
import com.get.domain.AppInfo;
import com.get.domain.MailRecordDO;
import com.get.domain.SwEvangelistInfoDO;
import com.get.domain.SwUserBasicDO;
import com.get.service.AppInfoService;
import com.get.service.MailRecordService;
import com.get.service.SwEvangelistInfoService;
import com.get.service.SwUserBasicService;
import com.get.statuc.CommonStatic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
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
    public SwUserBasicService swUserBasicService;

    @Autowired
    public SwEvangelistInfoService swEvangelistInfoService;

    @Autowired
    private MailRecordService mailRecordService;

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private LogService logService;

    @Value("${configs.usercache.prefix}")
    private String prefix;

    @RequestMapping("apply_for_evangelist")
    public Object resetLoginPassword(@RequestBody SwEvangelistInfoDO swEvangelistInfoDO) {
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
}
