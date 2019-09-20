package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-03 16:25:41
 */
@Data
public class SwPrincipalUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户id
    private Integer userId;
            //固币金id
    private String principalId;
            //剩余合约期限（天）
    private Integer leftTerm;
            //剩余金额
    private Double leftNum;
            //总金额
    private Double totalNum;
            //状态，0-正常，1-已释放完
    private Integer status;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;
            //计时时间
    private Date ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;

    private Integer cancelAuth;

    private String principalName;
    }
