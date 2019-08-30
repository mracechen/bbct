package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 资讯表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-28 19:10:02
 */
public class InformationDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //标题
    private String title;
            //内容
    private String content;
            //类型，1-新闻，2-公告
    private Integer type;
            //状态，0-可用，1-不可用
    private Integer status;
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
     * 设置：标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取：标题
     */
    public String getTitle() {
        return title;
    }
        /**
     * 设置：内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：内容
     */
    public String getContent() {
        return content;
    }
        /**
     * 设置：类型，1-新闻，2-公告
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取：类型，1-新闻，2-公告
     */
    public Integer getType() {
        return type;
    }
        /**
     * 设置：状态，0-可用，1-不可用
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态，0-可用，1-不可用
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
