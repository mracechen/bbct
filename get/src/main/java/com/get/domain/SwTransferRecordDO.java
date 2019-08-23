package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 转账记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:28:18
 */
public class SwTransferRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //付款方
    private Integer payer;
            //收款方
    private Integer receiver;
            //币种id
    private String coinTypeId;
            //交易金额
    private Double amount;
            //备注
    private String remark;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
    
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
     * 设置：付款方
     */
    public void setPayer(Integer payer) {
        this.payer = payer;
    }

    /**
     * 获取：付款方
     */
    public Integer getPayer() {
        return payer;
    }
        /**
     * 设置：收款方
     */
    public void setReceiver(Integer receiver) {
        this.receiver = receiver;
    }

    /**
     * 获取：收款方
     */
    public Integer getReceiver() {
        return receiver;
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
     * 设置：交易金额
     */
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    /**
     * 获取：交易金额
     */
    public Double getAmount() {
        return amount;
    }
        /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
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
    }
