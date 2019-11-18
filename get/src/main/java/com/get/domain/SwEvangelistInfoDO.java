package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 布道者资料申请表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-26 20:24:44
 */
@Data
public class SwEvangelistInfoDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户ID
    private Integer userId;
            //真实姓名
    private String realName;
            //手机号
    private String mobile;
            //布道者邮箱
    private String email;
            //微信
    private String wechat;
            //微博
    private String weibo;
            //所在地区
    private String address;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //审核状态，0-待审核，1-审核通过，2-审核拒绝
    private String ex1;
            //推荐人id
    private Integer ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;
    }
