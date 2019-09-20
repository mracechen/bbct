package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:27:04
 */
@Data
public class SwPrincipalDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //名称
    private String name;
            //币种id
    private String coinTypeId;
            //固本金额度
    private Double principalNum;
            //收益倍率
    private Double rewardPercent;
            //合约期限（天）
    private Integer contractTerm;
            //收取手续费期限（小时）
    private Integer chargeTerm;
            //手续费比例
    private Double chargePercent;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;

    private String coinName;
    }
