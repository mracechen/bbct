package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 释放记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:23:28
 */
public class SwReleaseRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户持固币金id
    private String principalUserId;
            //释放金额
    private Double amount;
            //导致释放的方式，1-自然释放，2-活币金释放，3-定币金释放
    private Integer causeType;
            //导致释放的用户ID
    private Integer causeUserId;
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
     * 设置：用户持固币金id
     */
    public void setPrincipalUserId(String principalUserId) {
        this.principalUserId = principalUserId;
    }

    /**
     * 获取：用户持固币金id
     */
    public String getPrincipalUserId() {
        return principalUserId;
    }
        /**
     * 设置：释放金额
     */
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    /**
     * 获取：释放金额
     */
    public Double getAmount() {
        return amount;
    }
        /**
     * 设置：导致释放的方式，1-自然释放，2-活币金释放，3-定币金释放
     */
    public void setCauseType(Integer causeType) {
        this.causeType = causeType;
    }

    /**
     * 获取：导致释放的方式，1-自然释放，2-活币金释放，3-定币金释放
     */
    public Integer getCauseType() {
        return causeType;
    }
        /**
     * 设置：导致释放的用户ID
     */
    public void setCauseUserId(Integer causeUserId) {
        this.causeUserId = causeUserId;
    }

    /**
     * 获取：导致释放的用户ID
     */
    public Integer getCauseUserId() {
        return causeUserId;
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
