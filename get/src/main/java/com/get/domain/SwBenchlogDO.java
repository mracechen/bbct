package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 对标记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:48:52
 */
@Data
public class SwBenchlogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户ID
    private Integer userId;
            //源币种
    private String sourceCoinId;
            //目标币种
    private String targetCoinId;
            //源币种数量
    private Double sourceNum;
            //目标币种数量
    private Double targetNum;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex1
    private String ex1;
            //ex2
    private Double ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;

    private String sourceCoinName;

    private String targetCoinName;
    }
