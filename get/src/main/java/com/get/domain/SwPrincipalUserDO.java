package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-03 16:25:41
 */
public class SwPrincipalUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户id
    private Integer userId;
            //固币金id
    private String principalId;
            //剩余合约期限（天）
    private Integer leftTerm;
            //剩余金额
    private Double leftNum;
            //总金额
    private Double totalNum;
            //状态，0-正常，1-已释放完
    private Integer status;
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
     * 设置：固币金id
     */
    public void setPrincipalId(String principalId) {
        this.principalId = principalId;
    }

    /**
     * 获取：固币金id
     */
    public String getPrincipalId() {
        return principalId;
    }
        /**
     * 设置：剩余合约期限（天）
     */
    public void setLeftTerm(Integer leftTerm) {
        this.leftTerm = leftTerm;
    }

    /**
     * 获取：剩余合约期限（天）
     */
    public Integer getLeftTerm() {
        return leftTerm;
    }
        /**
     * 设置：剩余金额
     */
    public void setLeftNum(Double leftNum) {
        this.leftNum = leftNum;
    }

    /**
     * 获取：剩余金额
     */
    public Double getLeftNum() {
        return leftNum;
    }
        /**
     * 设置：总金额
     */
    public void setTotalNum(Double totalNum) {
        this.totalNum = totalNum;
    }

    /**
     * 获取：总金额
     */
    public Double getTotalNum() {
        return totalNum;
    }
        /**
     * 设置：状态，0-正常，1-已释放完
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态，0-正常，1-已释放完
     */
    public Integer getStatus() {
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
