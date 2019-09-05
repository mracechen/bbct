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
    private Languagei18nUtils languagei18nUtils;

    /**
     * 获取冻结金额（买的所有产品价值）
     * */
    @RequestMapping("charge_address")
    public Result chargeAddress(HttpServletRequest request) {
        try {
            SwUserBasicDO user = AppUserUtils.getUser(request);
            SwPrincipalUserDO byUserId = swPrincipalUserService.getByUserId(user.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error("获取失败！");
        }
        return Result.error();
    }
}
