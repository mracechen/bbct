package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 定时任务表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-31 17:33:23
 */
public class QuartzDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //任务名称
    private String jobName;
            //任务分组
    private String jobGroup;
            //首次执行时间
    private Date startTime;
            //表达式
    private String cron;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //是否删除，0-否，1-是
    private String delFlag;
            //
    private String ex1;
            //
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
     * 设置：任务名称
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    /**
     * 获取：任务名称
     */
    public String getJobName() {
        return jobName;
    }
        /**
     * 设置：任务分组
     */
    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    /**
     * 获取：任务分组
     */
    public String getJobGroup() {
        return jobGroup;
    }
        /**
     * 设置：首次执行时间
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取：首次执行时间
     */
    public Date getStartTime() {
        return startTime;
    }
        /**
     * 设置：表达式
     */
    public void setCron(String cron) {
        this.cron = cron;
    }

    /**
     * 获取：表达式
     */
    public String getCron() {
        return cron;
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
     * 设置：是否删除，0-否，1-是
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：是否删除，0-否，1-是
     */
    public String getDelFlag() {
        return delFlag;
    }
        /**
     * 设置：
     */
    public void setEx1(String ex1) {
        this.ex1 = ex1;
    }

    /**
     * 获取：
     */
    public String getEx1() {
        return ex1;
    }
        /**
     * 设置：
     */
    public void setEx2(String ex2) {
        this.ex2 = ex2;
    }

    /**
     * 获取：
     */
    public String getEx2() {
        return ex2;
    }
    }
