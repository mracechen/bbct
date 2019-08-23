package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 推荐人奖励规则详情表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:46:50
 */
@Data
public class SwRuleDetailDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //规则id
    private String ruleId;
            //层级
    private Integer level;
            //计量方式，1-百分比，2-数量(弃用，计量方式使用reward_rule表中的字段)
    private Integer type;
            //计量值
    private Double value;
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
            //删除标识
    private String delFlag;


    private String ruleName;

    }
