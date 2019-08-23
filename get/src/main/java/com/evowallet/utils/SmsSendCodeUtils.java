package com.evowallet.utils;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;

import java.io.IOException;

public class SmsSendCodeUtils {

    public static final int Appid = 1400059346;

    public static final String appkey = "814ae0319c18ff2bea65d1e194423c45";

    public static final int templateId = 356676;

    public static final String smsSign = "酷焅购";



    public static void sendMsg(String nativecode,String moblie,String code){
        try {
            String[] params = {code};//数组具体的元素个数和模板中变量个数必须一致，例如事例中templateId:5678对应一个变量，参数数组中元素个数也必须是一个
            SmsSingleSender ssender = new SmsSingleSender(Appid, appkey);
            SmsSingleSenderResult result = ssender.sendWithParam(nativecode, moblie,
                    templateId, params, smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
            System.out.println(result);
        } catch (HTTPException e) {
            // HTTP响应码错误
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
