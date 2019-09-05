package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 对标项目表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:56:30
 */
public class SwBenchmarkingDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //源币种
    private String sourceCoinId;
            //目标币种
    private String targetCoinId;
            //源币种数量
    private Double sourceNum;
            //目标币种数量
    private Double targetNum;
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
            //ex4
    private String ex4;
    
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
     * 设置：源币种
     */
    public void setSourceCoinId(String sourceCoinId) {
        this.sourceCoinId = sourceCoinId;
    }

    /**
     * 获取：源币种
     */
    public String getSourceCoinId() {
        return sourceCoinId;
    }
        /**
     * 设置：目标币种
     */
    public void setTargetCoinId(String targetCoinId) {
        this.targetCoinId = targetCoinId;
    }

    /**
     * 获取：目标币种
     */
    public String getTargetCoinId() {
        return targetCoinId;
    }
        /**
     * 设置：源币种数量
     */
    public void setSourceNum(Double sourceNum) {
        this.sourceNum = sourceNum;
    }

    /**
     * 获取：源币种数量
     */
    public Double getSourceNum() {
        return sourceNum;
    }
        /**
     * 设置：目标币种数量
     */
    public void setTargetNum(Double targetNum) {
        this.targetNum = targetNum;
    }

    /**
     * 获取：目标币种数量
     */
    public Double getTargetNum() {
        return targetNum;
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
    }
