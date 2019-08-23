package com.srtz;

import com.common.utils.MessageUtils;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;

/**
 * @author sunYaLong
 * @data 2018/10/18
 */
public class TestAPI {

    public static void main(String[] args) throws IOException, ParseException {
//        String s = MyMD5Utils.encodingAdmin("123456");
//        System.out.println(s);

        double a = 5178.11;
       a =  a * 100;
        System.out.println(a);



    }

    public static void sendPhoneMsg() {
        MessageUtils.send("17370666933",MessageUtils.adminLoginMsg("8055"));
    }

    /**
     * 发送短信接口
     *
     * @throws IOException
     */
    public static void sendMsg() throws IOException {
        Map<String, Object> param = new LinkedHashMap<>();
        param.put("mobile", "17370666933");
        param.put("code", "8888");
        param.put("template", "check_code");
    }

    /**
     * 查询用户
     *
     * @throws IOException
     */
    public static  void findUserById() throws IOException {
        Map<String, Object> param = new LinkedHashMap<>();
        param.put("userId", "RY002");
    }

    /**
     * 用户转账
     *
     * @throws IOException
     */
    public static void adfad() throws IOException {
//        Map<String, Object> param = new LinkedHashMap<>();
//        param.put("userId","RY002");
//        param.put("coinType","BTC");
//        param.put("coins","100");
//        param.put("transferType","TTR");
//        String securityKey = SecurityUtils.getSecurityKey(param, "123");
//        param.put("securityKey",securityKey);
//        System.out.println(securityKey);
//        JSONObject json = new JSONObject(param);
//        String sss = HttpClientUtils.doPost("http://localhost:8080/api/trading/userRecharge.html", json);
//        System.out.println(sss);

        // 查看初始化的RYB锁仓210天项目是否正常

    }



}
