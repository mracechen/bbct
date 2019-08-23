package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 推荐人奖励规则表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:49:08
 */
public class SwRewardRuleDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //编码
    private String code;
            //规则名称
    private String name;
            //状态，0-可用，1-不可用
    private String status;
            //计量方式，1-比例，2-数值
    private Integer type;
            //备注
    private String remark;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
    
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
     * 设置：编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取：编码
     */
    public String getCode() {
        return code;
    }
        /**
     * 设置：规则名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：规则名称
     */
    public String getName() {
        return name;
    }
        /**
     * 设置：状态，0-可用，1-不可用
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：状态，0-可用，1-不可用
     */
    public String getStatus() {
        return status;
    }
        /**
     * 设置：计量方式，1-比例，2-数值
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取：计量方式，1-比例，2-数值
     */
    public Integer getType() {
        return type;
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
     * 设置：删除标识
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 获取：删除标识
     */
    public String getDelFlag() {
        return delFlag;
    }
    }
