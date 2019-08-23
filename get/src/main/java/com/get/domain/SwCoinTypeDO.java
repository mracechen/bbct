package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 平台币种表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:01:32
 */
public class SwCoinTypeDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //币种名称
    private String coinName;
            //币种图片
    private String coinPhot;
            //启用0为启用
    private String enable;
            //注册时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
            //ex1
    private String ex1;
            //扩展2
    private String ex2;
    
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
     * 设置：币种名称
     */
    public void setCoinName(String coinName) {
        this.coinName = coinName;
    }

    /**
     * 获取：币种名称
     */
    public String getCoinName() {
        return coinName;
    }
        /**
     * 设置：币种图片
     */
    public void setCoinPhot(String coinPhot) {
        this.coinPhot = coinPhot;
    }

    /**
     * 获取：币种图片
     */
    public String getCoinPhot() {
        return coinPhot;
    }
        /**
     * 设置：启用0为启用
     */
    public void setEnable(String enable) {
        this.enable = enable;
    }

    /**
     * 获取：启用0为启用
     */
    public String getEnable() {
        return enable;
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
     * 设置：扩展2
     */
    public void setEx2(String ex2) {
        this.ex2 = ex2;
    }

    /**
     * 获取：扩展2
     */
    public String getEx2() {
        return ex2;
    }
    }
