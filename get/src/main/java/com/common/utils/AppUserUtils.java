package com.common.utils;

import com.get.dao.SwUserBasicDao;
import com.get.domain.SwUserBasicDO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.concurrent.TimeUnit;

/**
 * app用户工具类包括获得用户登录信息等等
 *
 * @author longge
 * @version 1.0, 2019-02-02 13:36:13
 */

public class AppUserUtils {


    /**
     * 获得登录用户
     * 目前redis中存储用户id，将来为了性能，可能改回到存储用户信息
     * @param rq
     * @return
     */
    public static SwUserBasicDO getUser(HttpServletRequest rq) {
        try {
            Logger log = LoggerFactory.getLogger(AppUserUtils.class);
            String accessKey = rq.getHeader("accessKey");
            log.info("-----------------------用户登录传值accessKey:【"+accessKey+"】------------------------");
            if (accessKey == null || accessKey.equals("undefined")) {
                return null;
            }
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String userIdDecode = IDUtils.getUserIdDecode(accessKey);
            String s = (String) bean.getObject(userIdDecode);
            log.info("-----------------------用户登录通过accessKey去redis获取到值:【"+s+"】------------------------");
            if (StringUtils.isBlank(s)) {
                return null;
            }
            SwUserBasicDao swUserBasicDao = (SwUserBasicDao)ContextUtils.getBean(SwUserBasicDao.class);
            SwUserBasicDO swUserBasicDO = swUserBasicDao.get(Integer.parseInt(s));
            //log.info("-----------------------用户登录通过redis值获取到用户数据:【"+swUserBasicDO == null?null:swUserBasicDO.toString()+"】------------------------");
            return swUserBasicDO;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 将用户保存到缓存，过期时间：30分钟
     *
     * @param accessKey
     * @param userId
     * @return
     */
    public static String pushUser(String accessKey,String userId) {
        RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
        String userIdDecode = IDUtils.getUserIdDecode(accessKey);
        bean.setExpire(userIdDecode, userId, 7, TimeUnit.DAYS);
        //bean.setExpire(userIdDecode,1000000000);
        //bean.set(userIdDecode,userId,1000*60*30*48*7);
        return userId;
    }

    /**
     * 清除缓存
     *
     * @param accessKey
     * @param
     * @return
     */
    public static void removeRedis(String accessKey) {
        String userIdDecode = IDUtils.getUserIdDecode(accessKey);
        RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
        bean.delete(userIdDecode);
    }
}
