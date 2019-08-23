package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户基本表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:39:28
 */
public class SwUserBasicDO implements Serializable {
    private static final long serialVersionUID = 1L;

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
            //用户类型 0-普通用户，1-布道者，2-合伙人
    private Integer userType;
            //注册时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;
            //ex5
    private String ex5;
    
        /**
     * 设置：用户ID
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    /**
     * 获取：用户ID
     */
    public Integer getTid() {
        return tid;
    }
        /**
     * 设置：用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取：用户名
     */
    public String getUsername() {
        return username;
    }
        /**
     * 设置：推荐人编号
     */
    public void setRecomId(Integer recomId) {
        this.recomId = recomId;
    }

    /**
     * 获取：推荐人编号
     */
    public Integer getRecomId() {
        return recomId;
    }
        /**
     * 设置：手机号码
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取：手机号码
     */
    public String getMobile() {
        return mobile;
    }
        /**
     * 设置：邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取：邮箱
     */
    public String getEmail() {
        return email;
    }
        /**
     * 设置：登录密码
     */
    public void setLoginPass(String loginPass) {
        this.loginPass = loginPass;
    }

    /**
     * 获取：登录密码
     */
    public String getLoginPass() {
        return loginPass;
    }
        /**
     * 设置：高级密码
     */
    public void setHighPass(String highPass) {
        this.highPass = highPass;
    }

    /**
     * 获取：高级密码
     */
    public String getHighPass() {
        return highPass;
    }
        /**
     * 设置：手机区域编号
     */
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    /**
     * 获取：手机区域编号
     */
    public String getAreaCode() {
        return areaCode;
    }
        /**
     * 设置：用户类型 0-普通用户，1-布道者，2-合伙人
     */
    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    /**
     * 获取：用户类型 0-普通用户，1-布道者，2-合伙人
     */
    public Integer getUserType() {
        return userType;
    }
        /**
     * 设置：注册时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取：注册时间
     */
    public Date getCreateDate() {
        return createDate;
    }
        /**
     * 设置：更新时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * 获取：更新时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }
        /**
     * 设置：删除标识
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：删除标识
     */
    public String getDelFlag() {
        return delFlag;
    }
        /**
     * 设置：ex1
     */
    public void setEx1(String ex1) {
        this.ex1 = ex1;
    }

    /**
     * 获取：ex1
     */
    public String getEx1() {
        return ex1;
    }
        /**
     * 设置：ex2
     */
    public void setEx2(String ex2) {
        this.ex2 = ex2;
    }

    /**
     * 获取：ex2
     */
    public String getEx2() {
        return ex2;
    }
        /**
     * 设置：ex3
     */
    public void setEx3(String ex3) {
        this.ex3 = ex3;
    }

    /**
     * 获取：ex3
     */
    public String getEx3() {
        return ex3;
    }
        /**
     * 设置：ex4
     */
    public void setEx4(String ex4) {
        this.ex4 = ex4;
    }

    /**
     * 获取：ex4
     */
    public String getEx4() {
        return ex4;
    }
        /**
     * 设置：ex5
     */
    public void setEx5(String ex5) {
        this.ex5 = ex5;
    }

    /**
     * 获取：ex5
     */
    public String getEx5() {
        return ex5;
    }
    }
