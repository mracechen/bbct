package com.common.utils;


import com.common.config.spring.MessageConfig;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 云片短信发送
 *
 * @author WeiYF
 */
public class MessageUtils {

    private static Logger logger = LoggerFactory.getLogger(MessageUtils.class);

    // 查账户信息的http地址
    private static String URI_GET_USER_INFO = null;

    // 智能匹配模板发送接口的http地址
    private static String URI_SEND_SMS = null;

    // 编码格式。发送编码格式统一用UTF-8
    private static String ENCODING = "UTF-8";

    public static String apikey = null;

    // 发送通知短信
    public static String send(String phone, String content) {
        String result = null;
        try {
            // 修改为您的apikey.apikey可在官网（http://www.yunpian.com)登录后获取


            // 修改为您要发送的手机号
            String mobile = phone;

            /**************** 查账户信息调用示例 *****************/
            logger.debug(MessageUtils.getUserInfo(apikey));

            /**************** 使用智能匹配模板接口发短信(推荐) 方式1 *****************/
            // 设置您要发送的内容(内容必须和某个模板匹配
            String text = content;
            // 发短信调用示例
            result = MessageUtils.sendSms(apikey, text, mobile);
            logger.debug("调用结果==>" + result);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // 发送验证码
    public static int sendMsg(String phone, String content, String msg) {
        int code = 0;
        try {
            // 修改为您的apikey.apikey可在官网（http://www.yunpian.com)登录后获取
            // 修改为您要发送的手机号
            String mobile = phone;

            /**************** 查账户信息调用示例 *****************/
            logger.debug(MessageUtils.getUserInfo(apikey));

            /**************** 使用智能匹配模板接口发短信(推荐) 方式1 *****************/
            // 设置您要发送的内容(内容必须和某个模板匹配
            String text = content;
            // 发短信调用示例
            logger.debug("调用结果==>" + MessageUtils.sendSms(apikey, text, mobile));
            code = 0;
        } catch (Exception e) {
            code = 1;
            e.printStackTrace();
        }
        return code;
    }

    /**
     * 取账户信息
     *
     * @return json格式字符串
     * @throws IOException
     */

    public static String getUserInfo(String apikey) throws IOException, URISyntaxException {
        Map<String, String> params = new HashMap<String, String>();
        params.put("apikey", apikey);
        return post(URI_GET_USER_INFO, params);
    }

    /**
     * 智能匹配模板接口发短信
     *
     * @param apikey apikey
     * @param text   短信内容
     * @param mobile 接受的手机号
     * @return json格式字符串
     * @throws IOException
     */

    public static String sendSms(String apikey, String text, String mobile) throws IOException {
        Map<String, String> params = new HashMap<String, String>();
        params.put("apikey", apikey);
        params.put("text", text);
        params.put("mobile", mobile);
        return post(URI_SEND_SMS, params);
    }


    /**
     * 基于HttpClient 4.3的通用POST方法
     *
     * @param url       提交的URL
     * @param paramsMap 提交<参数，值>Map
     * @return 提交响应
     */

    public static String post(String url, Map<String, String> paramsMap) {
        CloseableHttpClient client = HttpClients.createDefault();
        String responseText = "";
        CloseableHttpResponse response = null;
        try {
            HttpPost method = new HttpPost(url);
            if (paramsMap != null) {
                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
                for (Map.Entry<String, String> param : paramsMap.entrySet()) {
                    NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
                    paramList.add(pair);
                }
                method.setEntity(new UrlEncodedFormEntity(paramList, ENCODING));
            }
            response = client.execute(method);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                responseText = EntityUtils.toString(entity, ENCODING);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return responseText;
    }

    /**
     * 系统管理员登录短信
     *
     * @param content
     * @return
     */
    public static String adminLoginMsg(String content) {
        return "【瑞银钱包】系统登录验证码为" + content;
    }

    /**
     * 系统异常模板
     *
     * @param content
     * @return
     */
    public static String sysErrorMsg(String content) {
        return "【瑞银钱包】系统" + content + "运行异常请立即处理";
    }


    /**
     * 初始化短信配置
     */
    public static void setConfig(){
        MessageConfig bean = (MessageConfig)ContextUtils.getBean(MessageConfig.class);
        apikey = bean.getApikey();
        URI_SEND_SMS = bean.getURI_SEND_SMS();
        URI_GET_USER_INFO = bean.getURI_GET_USER_INFO();
    }

}
