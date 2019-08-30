package com.get.domain;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 账户记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:53:13
 */
public class SwAccountRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户ID
    private Integer userId;
            //流水号
    private Integer num;
            //交易类型，1推广赠送，2利润分成，3提币，4后台操作,5消费，6转账，7收款，8礼包
    private Integer type;
            //币种类型id
    private String coinTypeId;
            //金额
    private BigDecimal currency;
            //备注
    private String remark;
            //当前账户金额
    private BigDecimal currentAmount;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
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
     * 设置：流水号
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * 获取：流水号
     */
    public Integer getNum() {
        return num;
    }
        /**
     * 设置：交易类型，1推广赠送，2利润分成，3提币，4后台操作,5消费，6转账，7收款，8礼包
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取：交易类型，1推广赠送，2利润分成，3提币，4后台操作,5消费，6转账，7收款，8礼包
     */
    public Integer getType() {
        return type;
    }
        /**
     * 设置：币种类型id
     */
    public void setCoinTypeId(String coinTypeId) {
        this.coinTypeId = coinTypeId;
    }

    /**
     * 获取：币种类型id
     */
    public String getCoinTypeId() {
        return coinTypeId;
    }
        /**
     * 设置：金额
     */
    public void setCurrency(BigDecimal currency) {
        this.currency = currency;
    }

    /**
     * 获取：金额
     */
    public BigDecimal getCurrency() {
        return currency;
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
     * 设置：当前账户金额
     */
    public void setCurrentAmount(BigDecimal currentAmount) {
        this.currentAmount = currentAmount;
    }

    /**
     * 获取：当前账户金额
     */
    public BigDecimal getCurrentAmount() {
        return currentAmount;
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

    public static SwAccountRecordDO create(int userId, int type, String remark, String coinTypeId, double currency, double currCurrency) {
        SwAccountRecordDO account = new SwAccountRecordDO();
        account.setTid(IDUtils.randomStr());
        account.setNum(IDUtils.getIntSerialNo());
        account.setUserId(userId);
        account.setCurrency(new BigDecimal(String.valueOf(currency)));
        account.setType(type);
        account.setCurrentAmount(new BigDecimal(String.valueOf(currCurrency)));
        account.setRemark(remark);
        account.setCoinTypeId(coinTypeId);
        account.setDelFlag(CommonStatic.NOTDELETE);
        account.setCreateDate(new Date());
        account.setUpdateDate(new Date());
        return account;
    }
    }
