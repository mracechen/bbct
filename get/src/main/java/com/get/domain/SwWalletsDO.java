package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 钱包表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:41:45
 */
@Data
public class SwWalletsDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //用户id
    private Integer userId;
    //币种id
    private String coinTypeId;
    //币的总量余额
    private BigDecimal currency;
    //账户是否激活0为激活可用，1为不可使用
    private String isActive;
    //冻结金额
    private BigDecimal frozenAmount;
    //创建时间
    private Date createDate;
    //更新时间
    private Date updateDate;
    //删除标记
    private String delFlag;
    //ex1
    private String ex1;
    //ex2
    private BigDecimal ex2;
    //ex3
    private String ex3;
    //ex4
    private String ex4;

}
