package com.common.utils;

import com.common.utils.PropertyUtils.ConfigsBean;
import com.system.ids.dao.IdsDao;
import com.system.ids.domin.Ids;
import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * string生成UUID
 *
 * @author sunYaLong
 * @data 2018/9/5
 */
public class IDUtils {

    private static long iCount = 1001L;

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

    public static String randomStr() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static Long randomNumber() {
        return new Random().nextLong();
    }
    public static Integer randomInt() {
        return new Random().nextInt();
    }

    public static String getCheckCode() {
        int random = (int) ((Math.random() * 9 + 1) * 1000);
        return String.valueOf(random);
    }

    public static int getIntSerialNo() {
        return Integer.parseInt(""+(iCount++));
    }

    /**
     * 获取流水号
     * @return
     */
    public static String getSerialNo() {
        return getSerialNo("");
    }

    public static String getSerialNo(String sPrefix) {
        if(iCount > 5000L) iCount = 1001L;
        return sPrefix + getFormatDate() + iCount++;
    }

    public static String getFormatDate() {
        return sdf.format(new Date());
    }

    /**
     * 获得简单的用户id 如  RY001结果 001
     *
     * @param userId
     * @return
     */
    private static String getSimpleUserId(String userId) {
        if (StringUtils.isBlank(userId)) {
            return null;
        }
        if (userId.startsWith("RY")) {
            userId = userId.substring(2);
        }
        return userId;
    }

    /**
     * 通过数据库获得获得唯一的字符串
     *
     * @return
     */
    private static String getUniqueStr() {
        IdsDao bean = (IdsDao) ContextUtils.getBean(IdsDao.class);
        Ids ids = new Ids();
        bean.getUniqueId(ids);
        if (ids.getTid() == 0) {
            throw new RuntimeException("获得数据库id失败");
        }
        return String.valueOf(ids.getTid());
    }

    /**
     * 通过用户id获取AccessKey
     * */
    public static String getUserIdEncode(String preStr,String userId){
        //return "s"+userId;
        return new String(Base64.getEncoder().encode((preStr + userId).getBytes()));
    }

    /**
     * 通过AccessKey解密用户id
     * */
    public static String getUserIdDecode(String code){
        //return code;
        System.out.println("被解密的字符串是：【"+code+"】");
        return new String(Base64.getUrlDecoder().decode(code.getBytes()));
    }

    /**
     * 获取长度为length的随机字符串
     * */
    public static String getRandemStr(int length){
        char[] letter = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'};
        String result = "";
        for(int i=0;i<length;i++){
            Random random = new Random();
            int i1 = random.nextInt(36);
            char c = letter[i1];
            result = result + (String.valueOf(c));
        }
        return result;
    }
}
