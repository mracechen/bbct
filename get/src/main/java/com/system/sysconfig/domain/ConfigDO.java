package com.system.sysconfig.domain;

import com.common.annotation.Language;

import java.io.Serializable;
import java.util.Date;


/**
 * 配置表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-06 11:20:36
 */
@SuppressWarnings("ALL")
public class ConfigDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //属性名称
    private String fieldName;
    //属性值
    @Language
    private String fieldValue;
    //属性类型
    private String filedType;
    //创建时间
    private Date createDate;
    //更新时间
    private Date updateDate;
    //删除状态0为可用
    private String delFlag;

    public ConfigDO() {
    }

    public ConfigDO(String fieldName, String fieldValue) {
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
    }

    public ConfigDO(String tid, String fieldName, String fieldValue, String filedType, Date createDate, Date updateDate, String delFlag) {
        this.tid = tid;
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
        this.filedType = filedType;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.delFlag = delFlag;
    }

    /**
     * 获取：主键
     */
    public String getTid() {
        return tid;
    }

    /**
     * 设置：主键
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 获取：属性名称
     */
    public String getFieldName() {
        return fieldName;
    }

    /**
     * 设置：属性名称
     */
    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    /**
     * 获取：属性值
     */
    public String getFieldValue() {
        return fieldValue;
    }

    /**
     * 设置：属性值
     */
    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }

    /**
     * 获取：属性类型
     */
    public String getFiledType() {
        return filedType;
    }

    /**
     * 设置：属性类型
     */
    public void setFiledType(String filedType) {
        this.filedType = filedType;
    }

    /**
     * 获取：创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置：创建时间
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

    /**
     * 获取：删除状态0为可用
     */
    public String getDelFlag() {
        return delFlag;
    }

    /**
     * 设置：删除状态0为可用
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }


}
