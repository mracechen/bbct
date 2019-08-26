package com.common.utils;

import com.get.domain.MailRecordDO;
import com.get.service.MailRecordService;
import com.system.record.domain.MsgRecordDO;
import com.system.record.service.MsgRecordService;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 校验验证码类
 */
public class CheckCodeUtils {

    /**
     * 校验图片验证码
     *
     * @return
     */
    public static boolean checkImgCheckCode(String imgCheckCodeKey,String imgCheckCode) {
        try {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String s = bean.get(imgCheckCodeKey);
            if (s != null) {
                bean.delete(imgCheckCodeKey);
            }
            if (imgCheckCode.equalsIgnoreCase(s)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    /**
     * 校验手机验证码
     *
     * @return
     */
    public static boolean checkMobileCheckCode(String mobileCheckcode,String mobile,String areaCode) {
        try {
            MsgRecordService bean = (MsgRecordService) ContextUtils.getBean(MsgRecordService.class);
            Map<String, Object> queryParam = new LinkedHashMap<>();
            queryParam.put("mobile",areaCode+mobile);
            queryParam.put("msgContent",mobileCheckcode);
            queryParam.put("status","0");
            queryParam.put("delFlag","0");
            // 验证码有效时间为1分钟所以查询1分钟以内的
            Date date = DateUtils.dateAddMinutes(new Date(), 5,false);
            queryParam.put("createStartDate", DateUtils.dateFormat(date,DateUtils.DATE_TIME_PATTERN));
            List<MsgRecordDO> msgList = bean.list(queryParam);
            if (msgList != null && msgList.size() == 1) {
                MsgRecordDO msgRecordDO = msgList.get(0);
                msgRecordDO.setStatus("1");
                bean.update(msgRecordDO);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    /**
     * 校验邮箱验证码
     *
     * @return
     */
    public static boolean checkEmailCheckCode(String emailCheckcode,String email) {
        try {
            MailRecordService bean = (MailRecordService) ContextUtils.getBean(MailRecordService.class);
            Map<String, Object> queryParam = new LinkedHashMap<>();
            queryParam.put("email",email);
            queryParam.put("content",emailCheckcode);
            queryParam.put("status","0");
            queryParam.put("delFlag","0");
            // 验证码有效时间为1分钟所以查询1分钟以内的
            Date date = DateUtils.dateAddMinutes(new Date(), 5,false);
            queryParam.put("createStartDate", DateUtils.dateFormat(date,DateUtils.DATE_TIME_PATTERN));
            List<MailRecordDO> msgList = bean.list(queryParam);
            if (msgList != null && msgList.size() == 1) {
                MailRecordDO mailRecordDO = msgList.get(0);
                mailRecordDO.setStatus(1);
                bean.update(mailRecordDO);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
