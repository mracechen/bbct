package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:14:25
 */
@Data
public class SwEvangelistDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //名称
    private String name;
            //币种id
    private String coinTypeId;
            //优币金额度
    private Double evangelistNum;
            //倍率
    private Double percent;
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
