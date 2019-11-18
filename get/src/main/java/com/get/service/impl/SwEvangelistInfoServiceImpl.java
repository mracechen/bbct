package com.get.service.impl;

import com.common.utils.IDUtils;
import com.common.utils.Result;
import com.common.utils.StringUtils;
import com.evowallet.utils.MailUtil;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.get.dao.SwEvangelistInfoDao;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwEvangelistInfoServiceImpl implements SwEvangelistInfoService {
    @Autowired
    private SwEvangelistInfoDao swEvangelistInfoDao;

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwPartnerService swPartnerService;

    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

    @Override
    public SwEvangelistInfoDO get(String tid) {
        return swEvangelistInfoDao.get(tid);
    }

    @Override
    public List<SwEvangelistInfoDO> list(Map<String, Object> map) {
        return swEvangelistInfoDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swEvangelistInfoDao.count(map);
    }

    @Override
    public int save(SwEvangelistInfoDO swEvangelistInfo) {
        return swEvangelistInfoDao.save(swEvangelistInfo);
    }

    @Override
    public int update(SwEvangelistInfoDO swEvangelistInfo) {
        return swEvangelistInfoDao.update(swEvangelistInfo);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String check(SwEvangelistInfoDO swEvangelistInfo) throws Exception{
        SwEvangelistInfoDO swEvangelistInfoDO = this.get(swEvangelistInfo.getTid());
        //发邮件给申请者发邮件，告诉他审核结果
        if(swEvangelistInfo.getEx1() != null){
            if(swEvangelistInfo.getEx1().equals(CommonStatic.CHECK_SUCCESS)){
                swEvangelistInfoDO.setEx1(CommonStatic.CHECK_SUCCESS);
                //布道者审核通过，给该邮箱注册成为布道者
                String email = swEvangelistInfoDO.getEmail();
                SwUserBasicDO userBasicDO = new SwUserBasicDO();
                userBasicDO.setUserType(CommonStatic.USER_TYPE_EVANGELIST);
                userBasicDO.setLoginPass("12345678");
                userBasicDO.setRecomId(swEvangelistInfoDO.getEx2());
                userBasicDO.setEmail(email);
                Map<String, Object> queryParam = new HashMap<>();
                queryParam.put("email", email);
                List<SwUserBasicDO> exUser = swUserBasicService.list(queryParam);
                if (exUser.size() > 0 && StringUtils.isNotBlank(email)) {
                    return "该邮箱已存在";
                }
                String success = "尊敬的用户，您好！\n" +
                        "\t您申请的布道者邮箱"+swEvangelistInfoDO.getEmail()+"已经通过审核，可通过APP登录该邮箱账号。\n" +
                        "\t初始密码为：12345678\n" +
                        "\t请您及时登录并修改密码，防止账号被盗。\n" +
                        "\n" +
                        "Dear user,\n" +
                        "\tThe preacher's mailbox "+swEvangelistInfoDO.getEmail()+" you applied for has been approved and can now login to the mailbox account through APP.\n" +
                        "\tThe initial password is 12345678\n" +
                        "\tPlease log in and change your password in time to prevent the account from being stolen.";
                swUserBasicService.userReg(userBasicDO);
                MailUtil.commonSend(swEvangelistInfoDO.getEmail(),success);
            }else{
                swEvangelistInfoDO.setEx1(CommonStatic.CHECK_FAILED);
                String failed = "尊敬的用户，您好！\n" +
                        "\t非常抱歉，您的申请未通过。\n" +
                        "\t请提供更加详细的资料并重新提交，来获取布道者资格。\n" +
                        "\n" +
                        "Dear user,\n" +
                        "\tWe are sorry but your application has not been approved\n" +
                        "\tPlease provide more detail information for the next try.";
                MailUtil.commonSend(swEvangelistInfoDO.getEmail(),failed);
            }
            SwUserBasicDO recommender = swUserBasicService.get(swEvangelistInfoDO.getEx2());
            //如果推荐人是布道者，而且推荐人所拥有的直属非普通人人数超过10个，则他晋升为合伙人
            if(recommender.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
                List<SwUserBasicDO> children = swUserBasicService.getByRecomId(recommender.getTid());
                if(children.size() > 0){
                    long count = children.stream().filter(s -> !s.getUserType().equals(CommonStatic.USER_TYPE_COMMON)).count();
                    if(count >= 10){
                        Map<String,Object> param = new HashMap<>();
                        param.put("delFlag",CommonStatic.NOTDELETE);
                        List<SwPartnerDO> partners = swPartnerService.list(param);
                        if(partners == null || partners.size() != 1){
                            throw new Exception("升币金项目异常");
                        }
                        SwPartnerDO swPartnerDO = partners.get(0);
                        double userTotal = new BigDecimal(
                                String.valueOf(swPartnerDO.getPartnerNum() == null ? 0 : swPartnerDO.getPartnerNum())
                        ).multiply(
                                new BigDecimal(String.valueOf(swPartnerDO.getPercent() == null ? 0 : swPartnerDO.getPercent()))
                        ).doubleValue();
                        //检查他有没有激活中的优币金，有就给他一个总金额500W，但剩余金额为450W+剩余的优币金金额，没有就给他500W
                        Double sendToHim = 0.0;
                        SwEvangelistUserDO hisEvangelist = swEvangelistUserService.getByUserId(recommender.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                        if(hisEvangelist == null){
                            sendToHim = userTotal;
                        }else{
                            sendToHim = new BigDecimal(String.valueOf(userTotal))
                                    .subtract(new BigDecimal(String.valueOf(hisEvangelist.getTotalNum())))
                                    .add(new BigDecimal(String.valueOf(hisEvangelist.getLeftNum())))
                                    .setScale(NumberStatic.BigDecimal_Scale_Num, NumberStatic.BigDecimal_Scale_Model)
                                    .doubleValue();
                        }
                        //送给该上级一个升币金
                        SwPartnerUserDO swPartnerUser = new SwPartnerUserDO();
                        swPartnerUser.setTid(IDUtils.randomStr());
                        swPartnerUser.setCreateDate(new Date());
                        swPartnerUser.setUpdateDate(new Date());
                        swPartnerUser.setDelFlag(CommonStatic.NOTDELETE);
                        swPartnerUser.setUserId(recommender.getTid());
                        swPartnerUser.setPartnerId(swPartnerDO.getTid());
                        swPartnerUser.setStatus(CommonStatic.NO_RELEASE);
                        swPartnerUser.setTotalNum(userTotal);
                        swPartnerUser.setLeftNum(sendToHim);
                        swPartnerUserService.save(swPartnerUser);

                        //把该上级的类型变成合伙人
                        recommender.setUserType(CommonStatic.USER_TYPE_PARTNER);
                        recommender.setUpdateDate(new Date());
                        swUserBasicService.update(recommender);
                    }
                }
            }
            swEvangelistInfoDao.update(swEvangelistInfoDO);
        }
        return "";
    }

    @Override
    public int remove(String tid) {
        SwEvangelistInfoDO swEvangelistInfo = new SwEvangelistInfoDO();
        swEvangelistInfo.setDelFlag(CommonStatic.DELETE);
        swEvangelistInfo.setTid(tid);
        return swEvangelistInfoDao.update(swEvangelistInfo);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
