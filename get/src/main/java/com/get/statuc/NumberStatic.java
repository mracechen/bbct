package com.get.statuc;

import java.math.BigDecimal;

/** Bigdecimal通用配置 */
public class NumberStatic {

    /**
     * 保留4位小数
     * */
    public static Integer BigDecimal_Scale_Num = 4;

    /**
     * 取舍模式：舍去保留位数后面的所有数值
     * */
    public final static Integer BigDecimal_Scale_Model = BigDecimal.ROUND_DOWN;
}