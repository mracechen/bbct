package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 提币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */
@Data
public class SwWithlogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户id
    private Integer userId;
            //币种id
    private String coinTypeId;
            //数量
    private BigDecimal amount;
            //提币地址id
    private String address;
            //状态 0-审核中 1-已完成 2-提币失败
    private String status;
            //审核信息
    private String remark;
            //区块链交易id
    private String txid;
            //提币手续费
    private BigDecimal fee;
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
    
    }
