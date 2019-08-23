package com.get.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 充币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:20:59
 */
public class SwChargelogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户id
    private Integer userId;
            //币种id
    private String coinId;
            //数量
    private BigDecimal amount;
            //充币地址
    private String address;
            //转账id
    private String txid;
            //状态 0-确认中 1-成功 2-失败
    private String status;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex2
    private String ex2;
            //ex4
    private String ex4;
            //ex5
    private String ex5;
    
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
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户id
     */
    public Integer getUserId() {
        return userId;
    }
        /**
     * 设置：币种id
     */
    public void setCoinId(String coinId) {
        this.coinId = coinId;
    }

    /**
     * 获取：币种id
     */
    public String getCoinId() {
        return coinId;
    }
        /**
     * 设置：数量
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    /**
     * 获取：数量
     */
    public BigDecimal getAmount() {
        return amount;
    }
        /**
     * 设置：充币地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取：充币地址
     */
    public String getAddress() {
        return address;
    }
        /**
     * 设置：转账id
     */
    public void setTxid(String txid) {
        this.txid = txid;
    }

    /**
     * 获取：转账id
     */
    public String getTxid() {
        return txid;
    }
        /**
     * 设置：状态 0-确认中 1-成功 2-失败
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：状态 0-确认中 1-成功 2-失败
     */
    public String getStatus() {
        return status;
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
