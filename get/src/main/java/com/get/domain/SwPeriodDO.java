package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:23:16
 */
@Data
public class SwPeriodDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //名称
    private String name;
            //币种id
    private String coinTypeId;
            //定币金周期（天）
    private Integer periodTerm;
            //购买最高倍率
    private Double tPercent;
            //购买最低倍率
    private Double bPercent;
            //加速倍率
    private Double acceleratePercent;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;

    private String coinName;
    }
