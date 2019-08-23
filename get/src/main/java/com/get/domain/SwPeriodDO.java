package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:23:16
 */
public class SwPeriodDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //名称
    private String name;
            //币种id
    private String coinTypeId;
            //定币金周期（天）
    private Integer periodTerm;
            //购买最高倍率
    private Double tPercent;
            //购买最低倍率
    private Double bPercent;
            //加速倍率
    private Double acceleratePercent;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //0为可用,1为不可用
    private String delFlag;
            //说明
    private String remark;
    
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
     * 设置：定币金周期（天）
     */
    public void setPeriodTerm(Integer periodTerm) {
        this.periodTerm = periodTerm;
    }

    /**
     * 获取：定币金周期（天）
     */
    public Integer getPeriodTerm() {
        return periodTerm;
    }
        /**
     * 设置：购买最高倍率
     */
    public void setTPercent(Double tPercent) {
        this.tPercent = tPercent;
    }

    /**
     * 获取：购买最高倍率
     */
    public Double getTPercent() {
        return tPercent;
    }
        /**
     * 设置：购买最低倍率
     */
    public void setBPercent(Double bPercent) {
        this.bPercent = bPercent;
    }

    /**
     * 获取：购买最低倍率
     */
    public Double getBPercent() {
        return bPercent;
    }
        /**
     * 设置：加速倍率
     */
    public void setAcceleratePercent(Double acceleratePercent) {
        this.acceleratePercent = acceleratePercent;
    }

    /**
     * 获取：加速倍率
     */
    public Double getAcceleratePercent() {
        return acceleratePercent;
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
    }
