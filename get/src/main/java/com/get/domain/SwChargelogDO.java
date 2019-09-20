package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 充币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:20:59
 */
@Data
public class SwChargelogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户id
    private Integer userId;
            //币种id
    private String coinId;
            //数量
    private BigDecimal amount;
            //充币地址
    private String address;
            //转账id
    private String txid;
            //状态 0-确认中 1-成功 2-失败
    private String status;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex2
    private String ex2;
            //ex4
    private String ex4;
            //ex5
    private String ex5;

    private String coinName;
    
    }
