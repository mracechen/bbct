package com.srtz;

import java.io.IOException;
import java.security.MessageDigest;

/**
 * 本系统用户加密算法
 *
 * @author sunYaLong
 * @data 2018/11/19
 */
public class MyMD5Utils55555 {

    public static void main(String[] args) throws IOException {
        String s = encodingAdmin("admin123456");
        String s2 = encodingAdmin("123456");
        System.out.println(s);
        System.out.println(s2);
        System.out.println(s.equals(s2));
    }


    private final static String[] hexDigits = {"0", "1", "2", "3", "4",
            "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    // 加密密码的key1
    private final static String passKey1 = "www.sesame.com";
    // 加密密码的key2
    private final static String passKey2 = "www.sesamegroup.com";

    /**
     * 结算系统管理员登录加密算法
     *
     * @param pass
     * @return
     */
    public static String encodingAdmin(String pass){
        String code = encodeByMD5(pass + passKey1).toLowerCase();
        code = encodeByMD5(code + passKey2 ).toLowerCase();
        return code;
    }

    /**
     * 交易系统加密算法
     *
     * @param pass
     * @return
     */
    public static String encoding(String pass){
        String code = encodeByMD5(pass).toLowerCase();
        code = encodeByMD5(code ).toLowerCase();
        return code;
    }


    private static String encodeByMD5(String originString){
        if (originString != null){
            try{
                //创建具有指定算法名称的信息摘要
                MessageDigest md = MessageDigest.getInstance("MD5");
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
                byte[] results = md.digest(originString.getBytes());
                //将得到的字节数组变成字符串返回
                String resultString = byteArrayToHexString(results);
                return resultString.toUpperCase();
            } catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 转换字节数组为十六进制字符串
     * @param     字节数组
     * @return    十六进制字符串
     */
    private static String byteArrayToHexString(byte[] b){
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++){
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    private static String byteToHexString(byte b){
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }
}
