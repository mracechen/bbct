package com.get.service.impl;

import com.common.utils.Result;
import com.common.utils.StringUtils;
import com.evowallet.utils.MailUtil;
import com.get.domain.SwUserBasicDO;
import com.get.service.SwUserBasicService;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.get.dao.SwEvangelistInfoDao;
import com.get.domain.SwEvangelistInfoDO;
import com.get.service.SwEvangelistInfoService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwEvangelistInfoServiceImpl implements SwEvangelistInfoService {
    @Autowired
    private SwEvangelistInfoDao swEvangelistInfoDao;

    @Autowired
    private SwUserBasicService swUserBasicService;

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
                userBasicDO.setRecomId(1);
                userBasicDO.setEmail(email);
                Map<String, Object> queryParam = new HashMap<>();
                queryParam.put("email", email);
                List<SwUserBasicDO> exUser = swUserBasicService.list(queryParam);
                if (exUser.size() > 0 && StringUtils.isNotBlank(email)) {
                    return "该邮箱已存在";
                }
                String success = "尊敬的用户"+swEvangelistInfoDO.getUserId()+"，您好！\n" +
                        "\t您申请的布道者邮箱"+swEvangelistInfoDO.getEmail()+"已经通过审核，现在可以通过APP登录该邮箱账号。\n" +
                        "\t初始密码为：12345678\n" +
                        "\t请您及时登录并修改密码，防止账号被盗。\n" +
                        "\n" +
                        "Dear user "+swEvangelistInfoDO.getUserId()+"!\n" +
                        "\tThe email "+swEvangelistInfoDO.getEmail()+" you applied has been approved.\n" +
                        "\tplease login the account by password 12345678, and then change password as soon as posible.";
                swUserBasicService.userReg(userBasicDO);
                MailUtil.commonSend(swEvangelistInfoDO.getEmail(),success);
            }else{
                swEvangelistInfoDO.setEx1(CommonStatic.CHECK_FAILED);
                String failed = "尊敬的用户"+swEvangelistInfoDO.getUserId()+"，您好！\n" +
                        "\t非常抱歉，您的申请未通过。\n" +
                        "\t请提供更加详细的资料并重新提交，来获取布道者资格。\n" +
                        "\n" +
                        "Dear user "+swEvangelistInfoDO.getUserId()+"!\n" +
                        "\tWe are sorry for that your application is not pass.\n" +
                        "\tPlease provide more detail data for the next try.";
                MailUtil.commonSend(swEvangelistInfoDO.getEmail(),failed);
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
