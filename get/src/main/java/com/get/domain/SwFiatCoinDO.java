package com.get.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:54:01
 */
public class SwFiatCoinDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //法币表
    private Integer id;
            //国家名称
    private String countryName;
            //是否显示
    private Integer isShow;
            //符号
    private String currSymbol;
            //单位符号
    private String currIcon;
            //购买价格
    private BigDecimal price;
            //数字货币id
    private String coinId;
            //创建时间
    private Date createTime;
            //最后更新时间
    private Date updateTime;
            //国家编号
    private Integer code;
            //回购价格
    private BigDecimal sellPrice;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
    
        /**
     * 设置：法币表
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：法币表
     */
    public Integer getId() {
        return id;
    }
        /**
     * 设置：国家名称
     */
    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    /**
     * 获取：国家名称
     */
    public String getCountryName() {
        return countryName;
    }
        /**
     * 设置：是否显示
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    /**
     * 获取：是否显示
     */
    public Integer getIsShow() {
        return isShow;
    }
        /**
     * 设置：符号
     */
    public void setCurrSymbol(String currSymbol) {
        this.currSymbol = currSymbol;
    }

    /**
     * 获取：符号
     */
    public String getCurrSymbol() {
        return currSymbol;
    }
        /**
     * 设置：单位符号
     */
    public void setCurrIcon(String currIcon) {
        this.currIcon = currIcon;
    }

    /**
     * 获取：单位符号
     */
    public String getCurrIcon() {
        return currIcon;
    }
        /**
     * 设置：购买价格
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 获取：购买价格
     */
    public BigDecimal getPrice() {
        return price;
    }
        /**
     * 设置：数字货币id
     */
    public void setCoinId(String coinId) {
        this.coinId = coinId;
    }

    /**
     * 获取：数字货币id
     */
    public String getCoinId() {
        return coinId;
    }
        /**
     * 设置：创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }
        /**
     * 设置：最后更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：最后更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }
        /**
     * 设置：国家编号
     */
    public void setCode(Integer code) {
        this.code = code;
    }

    /**
     * 获取：国家编号
     */
    public Integer getCode() {
        return code;
    }
        /**
     * 设置：回购价格
     */
    public void setSellPrice(BigDecimal sellPrice) {
        this.sellPrice = sellPrice;
    }

    /**
     * 获取：回购价格
     */
    public BigDecimal getSellPrice() {
        return sellPrice;
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
    }
