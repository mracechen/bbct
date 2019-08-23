package com.get.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 提现地址
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:33:36
 */
public class SwWithdrawAddressDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户ID
    private String userId;
            //币种ID
    private String coinTypeId;
            //提币地址
    private String address;
            //类型 1-omin 2-erc20
    private Integer type;
            //备注
    private String remark;
            //扩展3
    private String ex3;
            //扩展4
    private String ex4;
            //扩展5
    private String ex5;
            //注册时间
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
     * 设置：用户ID
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户ID
     */
    public String getUserId() {
        return userId;
    }
        /**
     * 设置：币种ID
     */
    public void setCoinTypeId(String coinTypeId) {
        this.coinTypeId = coinTypeId;
    }

    /**
     * 获取：币种ID
     */
    public String getCoinTypeId() {
        return coinTypeId;
    }
        /**
     * 设置：提币地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取：提币地址
     */
    public String getAddress() {
        return address;
    }
        /**
     * 设置：类型 1-omin 2-erc20
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取：类型 1-omin 2-erc20
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
     * 设置：扩展3
     */
    public void setEx3(String ex3) {
        this.ex3 = ex3;
    }

    /**
     * 获取：扩展3
     */
    public String getEx3() {
        return ex3;
    }
        /**
     * 设置：扩展4
     */
    public void setEx4(String ex4) {
        this.ex4 = ex4;
    }

    /**
     * 获取：扩展4
     */
    public String getEx4() {
        return ex4;
    }
        /**
     * 设置：扩展5
     */
    public void setEx5(String ex5) {
        this.ex5 = ex5;
    }

    /**
     * 获取：扩展5
     */
    public String getEx5() {
        return ex5;
    }
        /**
     * 设置：注册时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取：注册时间
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
