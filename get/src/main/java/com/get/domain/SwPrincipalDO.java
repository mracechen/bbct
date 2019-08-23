package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:27:04
 */
public class SwPrincipalDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //名称
    private String name;
            //币种id
    private String coinTypeId;
            //固本金额度
    private Double principalNum;
            //收益倍率
    private Double rewardPercent;
            //合约期限（天）
    private Integer contractTerm;
            //收取手续费期限（小时）
    private Integer chargeTerm;
            //手续费比例
    private Double chargePercent;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
    
        /**
     * 设置：ID
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 获取：ID
     */
    public String getTid() {
        return tid;
    }
        /**
     * 设置：名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：名称
     */
    public String getName() {
        return name;
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
     * 设置：固本金额度
     */
    public void setPrincipalNum(Double principalNum) {
        this.principalNum = principalNum;
    }

    /**
     * 获取：固本金额度
     */
    public Double getPrincipalNum() {
        return principalNum;
    }
        /**
     * 设置：收益倍率
     */
    public void setRewardPercent(Double rewardPercent) {
        this.rewardPercent = rewardPercent;
    }

    /**
     * 获取：收益倍率
     */
    public Double getRewardPercent() {
        return rewardPercent;
    }
        /**
     * 设置：合约期限（天）
     */
    public void setContractTerm(Integer contractTerm) {
        this.contractTerm = contractTerm;
    }

    /**
     * 获取：合约期限（天）
     */
    public Integer getContractTerm() {
        return contractTerm;
    }
        /**
     * 设置：收取手续费期限（小时）
     */
    public void setChargeTerm(Integer chargeTerm) {
        this.chargeTerm = chargeTerm;
    }

    /**
     * 获取：收取手续费期限（小时）
     */
    public Integer getChargeTerm() {
        return chargeTerm;
    }
        /**
     * 设置：手续费比例
     */
    public void setChargePercent(Double chargePercent) {
        this.chargePercent = chargePercent;
    }

    /**
     * 获取：手续费比例
     */
    public Double getChargePercent() {
        return chargePercent;
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
     * 设置：说明
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：说明
     */
    public String getRemark() {
        return remark;
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
