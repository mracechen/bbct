package com.system.languagecat.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 语言分类
 *
 * @author sunyalong
 * @email 1992lcg@163.com
 * @date 2018-09-13 13:06:11
 */
@SuppressWarnings("ALL")
public class LanguageCategoryDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //语言标识符
    private String status;
    //语言名称
    private String name;
    //语言对应的图标
    private String statusImg;
    //排序
    private Integer sort;
    //说明
    private String remark;
    //是否显示
    private String isEnable;
    //添加时间
    private Date createDate;
    //更新时间
    private Date updateDate;

    /**
     * 获取：语言标识符
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置：语言标识符
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：语言名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置：语言名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：语言对应的图标
     */
    public String getStatusImg() {
        return statusImg;
    }

    /**
     * 设置：语言对应的图标
     */
    public void setStatusImg(String statusImg) {
        this.statusImg = statusImg;
    }

    /**
     * 获取：排序
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * 设置：排序
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取：说明
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置：说明
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：是否显示
     */
    public String getIsEnable() {
        return isEnable;
    }

    /**
     * 设置：是否显示
     */
    public void setIsEnable(String isEnable) {
        this.isEnable = isEnable;
    }

    /**
     * 获取：添加时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置：添加时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取：更新时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置：更新时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
