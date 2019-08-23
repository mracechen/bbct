package com.get.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 提币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */
public class SwWithlogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户id
    private Integer userId;
            //币种id
    private String coinTypeId;
            //数量
    private BigDecimal amount;
            //提币地址id
    private String addressId;
            //状态 0-审核中 1-已完成 2-提币失败
    private String status;
            //审核信息
    private String remark;
            //区块链交易id
    private String txid;
            //提币手续费
    private BigDecimal fee;
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
     * 设置：提币地址id
     */
    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    /**
     * 获取：提币地址id
     */
    public String getAddressId() {
        return addressId;
    }
        /**
     * 设置：状态 0-审核中 1-已完成 2-提币失败
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：状态 0-审核中 1-已完成 2-提币失败
     */
    public String getStatus() {
        return status;
    }
        /**
     * 设置：审核信息
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：审核信息
     */
    public String getRemark() {
        return remark;
    }
        /**
     * 设置：区块链交易id
     */
    public void setTxid(String txid) {
        this.txid = txid;
    }

    /**
     * 获取：区块链交易id
     */
    public String getTxid() {
        return txid;
    }
        /**
     * 设置：提币手续费
     */
    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }

    /**
     * 获取：提币手续费
     */
    public BigDecimal getFee() {
        return fee;
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
