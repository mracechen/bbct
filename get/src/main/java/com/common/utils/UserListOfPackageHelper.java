package com.common.utils;

import lombok.Data;

import java.util.Date;


@Data
public class UserListOfPackageHelper{
    private Integer level;
    //用户ID
    private Integer tid;
    //用户名
    private String username;
    //推荐人编号
    private Integer recomId;
    //手机号码
    private String mobile;
    //邮箱
    private String email;
    //登录密码
    private String loginPass;
    //高级密码
    private String highPass;
    //手机区域编号
    private String areaCode;
    //是否通过实名认证,0-未提交未通过，1-已提交未通过，2-已提交已通过
    private String checkStatus;
    //用户类型 0-普通用户 1-otc商家 2-实体商家
    private Integer userType;
    //交易成交数量
    private Integer tranNum;
    //注册时间
    private Date createDate;
    //更新时间
    private Date updateDate;
    //删除标识
    private String delFlag;
    //ex2
    private String ex2;
    //ex3
    private String ex3;
    //ex4
    private String ex4;
}