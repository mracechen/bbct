package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-03 15:52:00
 */
@Data
public class SwEvangelistUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户ID
    private Integer userId;
            //优币金id
    private String evangelistId;
            //总金额
    private Double totalNum;
            //剩余金额
    private Double leftNum;
            //状态，0-正常，1-已释放完
    private Integer status;
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

    private String evangelistName;
    
    }
