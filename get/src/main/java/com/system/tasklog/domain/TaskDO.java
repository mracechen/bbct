package com.system.tasklog.domain;

import com.common.utils.IDUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统定时任务, 废弃sys_task表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-11-24 13:45:42
 */
public class TaskDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //定时任务名称
    private String jobName;
    //批次编号
    private String batchNum;
    //normal正常结算, error异常结算
    private String type;
    //开始时间
    private Date startDate;
    //结束时间
    private Date endDate;
    //消息
    private String message;
    //创建时间
    private Date createDate;
    //删除编号
    private String delFlag;

    public TaskDO( String jobName, String batchNum, Date startDate, Date createDate) {
        this.tid = IDUtils.randomStr();
        this.jobName = jobName;
        this.batchNum = batchNum;
        this.type = type;
        this.startDate = startDate;
        this.endDate = endDate;
        this.message = message;
        this.createDate = createDate;
        this.delFlag = "0";
    }

    public TaskDO() {
    }

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
     * 设置：定时任务名称
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    /**
     * 获取：定时任务名称
     */
    public String getJobName() {
        return jobName;
    }

    /**
     * 设置：批次编号
     */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }

    /**
     * 获取：批次编号
     */
    public String getBatchNum() {
        return batchNum;
    }

    /**
     * 设置：normal正常结算, error异常结算
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取：normal正常结算, error异常结算
     */
    public String getType() {
        return type;
    }

    /**
     * 设置：开始时间
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * 获取：开始时间
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * 设置：结束时间
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * 获取：结束时间
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * 设置：消息
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 获取：消息
     */
    public String getMessage() {
        return message;
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
     * 设置：删除编号
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：删除编号
     */
    public String getDelFlag() {
        return delFlag;
    }
}
