package com.common.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
/*
 * @desc 数据转换工具类
 *
 * @author
 * @email
 * @date 2018-10-15
 */

public class DataUtils {

    private static DecimalFormat decimalFormat = new DecimalFormat("#0.00");

    private static double i = 199.04761905;

    /**
     * 返回两位小数的double，四舍五入
     *
     * @param number
     * @return
     */
    public static double formatDouble(double number) {
        return Double.parseDouble(decimalFormat.format(number));
    }

    /**
     * 小数保留6位
     */
    public static String saveSixNum(Double num) {
//        BigDecimal b = new BigDecimal(num);
//        num = b.setScale(6, BigDecimal.ROUND_HALF_EVEN).doubleValue();
        return calculateProfit(num);
    }

    /**
     * 小数保留6位
     */
    public static String saveNineNum(Double num) {
        return calculateProfit(num);
    }

    public static void main(String[] args) {
        String s = saveNineNum(0.000002);
        String w = saveNineNum(0.00000068);
        System.out.println(s);
        System.out.println(w);
    }

    /**
     * 保留double类型小数后两位，不四舍五入，直接取小数后两位 比如：10.1269 返回：10.12
     *
     * @param doubleValue
     * @return
     */
    public static String calculateProfit(double doubleValue) {
        // 保留4位小数
        BigDecimal b = new BigDecimal(doubleValue);
        doubleValue = b.setScale(8, BigDecimal.ROUND_HALF_EVEN).doubleValue();
        String result = String.valueOf(doubleValue);

        // 截取第一位
        String index = result.substring(0, 1);
        // 小数展示科学计数 格式化
        if(result.contains("E")){
            DecimalFormat df = new DecimalFormat();
            //这里是小数位
            df.setMaximumFractionDigits(8);
            String format = df.format(doubleValue);
            // 获取小数 . 号第一次出现的位置
            int inde = firstIndexOf(format, ".");
            // 字符串截断
            String substring = format.substring(inde+1);
            if(substring.length() >= 6){
                return format .substring(0, inde + 7);
            }
            return format;
        }
        if (".".equals(index)) {
            result = "0" + result;
        }
        // 获取小数 . 号第一次出现的位置
        int inde = firstIndexOf(result, ".");
        // 字符串截断
        String substring = result.substring(inde+1);
        if(substring.length() >= 6){
            return result .substring(0, inde + 7);
        }
        return result;
    }

    /**
     * 查找字符串pattern在str中第一次出现的位置
     *
     * @param str
     * @param pattern
     * @return
     */
    public static int firstIndexOf(String str, String pattern) {
        for (int i = 0; i < (str.length() - pattern.length()); i++) {
            int j = 0;
            while (j < pattern.length()) {
                if (str.charAt(i + j) != pattern.charAt(j))
                    break;
                j++;
            }
            if (j == pattern.length())
                return i;
        }
        return -1;
    }

    public static String getSixStringNumber(String result){
        String index = result.substring(0, 1);
        if (".".equals(index)) {
            result = "0" + result;
        }
        // 获取小数 . 号第一次出现的位置
        int inde = firstIndexOf(result, ".");
        // 字符串截断
        String substring = result.substring(inde+1);
        if(substring.length() >= 6){
           return result .substring(0, inde + 7);
        }
       return result;
    }

}
