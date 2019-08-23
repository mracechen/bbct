package com.get.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 钱包表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:41:45
 */
public class SwWalletsDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户id
    private String userId;
            //币种id
    private String coinTypeId;
            //币的总量余额
    private BigDecimal currency;
            //账户是否激活0为激活可用，1为不可使用
    private String isActive;
            //冻结金额
    private BigDecimal frozenAmount;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex1
    private String ex1;
            //ex2
    private BigDecimal ex2;
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
     * 设置：用户id
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户id
     */
    public String getUserId() {
        return userId;
    }
        /**
     * 设置：币种id
     */
    public void setCoinTypeId(String coinTypeId) {
        this.coinTypeId = coinTypeId;
    }

    /**
     * 获取：币种id
     */
    public String getCoinTypeId() {
        return coinTypeId;
    }
        /**
     * 设置：币的总量余额
     */
    public void setCurrency(BigDecimal currency) {
        this.currency = currency;
    }

    /**
     * 获取：币的总量余额
     */
    public BigDecimal getCurrency() {
        return currency;
    }
        /**
     * 设置：账户是否激活0为激活可用，1为不可使用
     */
    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    /**
     * 获取：账户是否激活0为激活可用，1为不可使用
     */
    public String getIsActive() {
        return isActive;
    }
        /**
     * 设置：冻结金额
     */
    public void setFrozenAmount(BigDecimal frozenAmount) {
        this.frozenAmount = frozenAmount;
    }

    /**
     * 获取：冻结金额
     */
    public BigDecimal getFrozenAmount() {
        return frozenAmount;
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
     * 设置：删除标记
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：删除标记
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
    public void setEx2(BigDecimal ex2) {
        this.ex2 = ex2;
    }

    /**
     * 获取：ex2
     */
    public BigDecimal getEx2() {
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
