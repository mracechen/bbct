package com.get.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 消费记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-05 15:45:41
 */
public class SwConsumeLogDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //消费金额(GC)
    private BigDecimal consumeAmount;
            //平台销毁金额
    private BigDecimal destoryed;
            //支付人
    private Integer payUser;
            //收款人
    private Integer receiveUser;
            //币种类型id(GC)
    private String coinTypeId;
            //记录上次兑换/挂卖商家收到GC/GCP消费
    private BigDecimal lastConsume;
            //评分
    private Integer score;
            //店铺id
    private String businessId;
            //备注
    private String remark;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
            //币种类型id(GCP)
    private String ex2;
            //消费金额(GCP)
    private BigDecimal ex3;
            //ex4
    private String ex4;
            //ex5
    private String ex5;

    private String username;
    private String mobile;
    private String type;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
     * 设置：消费金额(GC)
     */
    public void setConsumeAmount(BigDecimal consumeAmount) {
        this.consumeAmount = consumeAmount;
    }

    /**
     * 获取：消费金额(GC)
     */
    public BigDecimal getConsumeAmount() {
        return consumeAmount;
    }
        /**
     * 设置：平台销毁金额
     */
    public void setDestoryed(BigDecimal destoryed) {
        this.destoryed = destoryed;
    }

    /**
     * 获取：平台销毁金额
     */
    public BigDecimal getDestoryed() {
        return destoryed;
    }
        /**
     * 设置：支付人
     */
    public void setPayUser(Integer payUser) {
        this.payUser = payUser;
    }

    /**
     * 获取：支付人
     */
    public Integer getPayUser() {
        return payUser;
    }
        /**
     * 设置：收款人
     */
    public void setReceiveUser(Integer receiveUser) {
        this.receiveUser = receiveUser;
    }

    /**
     * 获取：收款人
     */
    public Integer getReceiveUser() {
        return receiveUser;
    }
        /**
     * 设置：币种类型id(GC)
     */
    public void setCoinTypeId(String coinTypeId) {
        this.coinTypeId = coinTypeId;
    }

    /**
     * 获取：币种类型id(GC)
     */
    public String getCoinTypeId() {
        return coinTypeId;
    }
        /**
     * 设置：记录上次兑换/挂卖商家收到GC/GCP消费
     */
    public void setLastConsume(BigDecimal lastConsume) {
        this.lastConsume = lastConsume;
    }

    /**
     * 获取：记录上次兑换/挂卖商家收到GC/GCP消费
     */
    public BigDecimal getLastConsume() {
        return lastConsume;
    }
        /**
     * 设置：评分
     */
    public void setScore(Integer score) {
        this.score = score;
    }

    /**
     * 获取：评分
     */
    public Integer getScore() {
        return score;
    }
        /**
     * 设置：店铺id
     */
    public void setBusinessId(String businessId) {
        this.businessId = businessId;
    }

    /**
     * 获取：店铺id
     */
    public String getBusinessId() {
        return businessId;
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
        /**
     * 设置：币种类型id(GCP)
     */
    public void setEx2(String ex2) {
        this.ex2 = ex2;
    }

    /**
     * 获取：币种类型id(GCP)
     */
    public String getEx2() {
        return ex2;
    }
        /**
     * 设置：消费金额(GCP)
     */
    public void setEx3(BigDecimal ex3) {
        this.ex3 = ex3;
    }

    /**
     * 获取：消费金额(GCP)
     */
    public BigDecimal getEx3() {
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
        /**
     * 设置：ex5
     */
    public void setEx5(String ex5) {
        this.ex5 = ex5;
    }

    /**
     * 获取：ex5
     */
    public String getEx5() {
        return ex5;
    }

    @Override
    public String toString() {
        return "SwConsumeLogDO{" +
                "tid='" + tid + '\'' +
                ", consumeAmount=" + consumeAmount +
                ", destoryed=" + destoryed +
                ", payUser=" + payUser +
                ", receiveUser=" + receiveUser +
                ", coinTypeId='" + coinTypeId + '\'' +
                ", lastConsume=" + lastConsume +
                ", score=" + score +
                ", businessId='" + businessId + '\'' +
                ", remark='" + remark + '\'' +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                ", delFlag='" + delFlag + '\'' +
                ", ex2='" + ex2 + '\'' +
                ", ex3=" + ex3 +
                ", ex4='" + ex4 + '\'' +
                ", ex5='" + ex5 + '\'' +
                ", username='" + username + '\'' +
                ", mobile='" + mobile + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
