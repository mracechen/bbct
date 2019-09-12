package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有活币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-02 11:33:27
 */
@Data
public class SwCurrentUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户ID
    private Integer userId;
            //活币金id
    private String currentId;
            //释放时间
    private Date releaseTime;
            //状态，0-正常，1-已释放完
    private Integer status;
            //ex1
    private Double ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;

    private Double causeReleaseNum;

    private Integer existDays;

    }
