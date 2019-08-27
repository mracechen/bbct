package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 布道者资料申请表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-26 20:24:44
 */
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
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;
    
        /**
     * 设置：主键
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 获取：主键
     */
    public String getTid() {
        return tid;
    }
        /**
     * 设置：用户ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户ID
     */
    public Integer getUserId() {
        return userId;
    }
        /**
     * 设置：真实姓名
     */
    public void setRealName(String realName) {
        this.realName = realName;
    }

    /**
     * 获取：真实姓名
     */
    public String getRealName() {
        return realName;
    }
        /**
     * 设置：手机号
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取：手机号
     */
    public String getMobile() {
        return mobile;
    }
        /**
     * 设置：布道者邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取：布道者邮箱
     */
    public String getEmail() {
        return email;
    }
        /**
     * 设置：微信
     */
    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    /**
     * 获取：微信
     */
    public String getWechat() {
        return wechat;
    }
        /**
     * 设置：微博
     */
    public void setWeibo(String weibo) {
        this.weibo = weibo;
    }

    /**
     * 获取：微博
     */
    public String getWeibo() {
        return weibo;
    }
        /**
     * 设置：所在地区
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取：所在地区
     */
    public String getAddress() {
        return address;
    }
        /**
     * 设置：创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取：创建时间
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
     * 设置：0为可用,1为不可用
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：0为可用,1为不可用
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
    }
