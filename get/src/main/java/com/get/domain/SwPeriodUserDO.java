package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-02 11:39:40
 */
@Data
public class SwPeriodUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //ID
    private String tid;
    //用户ID
    private Integer userId;
    //定币金ID
    private String periodId;
    //释放时间
    private Date releaseTime;
    //状态，0-正常，1-已释放完
    private Integer status;
    //认购金额
    private Double ex1;
    //加速数量
    private Integer ex2;
    //购买倍率
    private Integer ex3;
    //创建时间
    private Date createDate;
    //更新时间
    private Date updateDate;
    //0为可用,1为不可用
    private String delFlag;
    //说明
    private String remark;

    private Double causeReleaseNum;

    private Date expireDate;

    private String periodName;
}
