package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户持有升币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:21:37
 */
public class SwPartnerUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //用户ID
    private Integer userId;
            //升币金ID
    private String partnerId;
            //说明
    private String remark;
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
     * 设置：升币金ID
     */
    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }

    /**
     * 获取：升币金ID
     */
    public String getPartnerId() {
        return partnerId;
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
    }
