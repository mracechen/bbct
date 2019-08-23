package com.system.language.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 国际化语言表
 *
 * @author chglee
 * @date 2018-09-05 16:07:36
 */
@SuppressWarnings("ALL")
public class LanguageDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //中文数值
    private String zhText;
    //需要翻译的语言标识zh表示中文,en标识英文
    private String toStatus;
    //将zh_text翻译后的值
    private String toText;
    //创建时间
    private Date createDate;
    //更新时间
    private Date updateDate;
    //0为可用,1为不可用
    private String delFlag;

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
     * 获取：中文数值
     */
    public String getZhText() {
        return zhText;
    }

    /**
     * 设置：中文数值
     */
    public void setZhText(String zhText) {
        this.zhText = zhText;
    }

    /**
     * 获取：需要翻译的语言标识zh表示中文,en标识英文
     */
    public String getToStatus() {
        return toStatus;
    }

    /**
     * 设置：需要翻译的语言标识zh表示中文,en标识英文
     */
    public void setToStatus(String toStatus) {
        this.toStatus = toStatus;
    }

    /**
     * 获取：将zh_text翻译后的值
     */
    public String getToText() {
        return toText;
    }

    /**
     * 设置：将zh_text翻译后的值
     */
    public void setToText(String toText) {
        this.toText = toText;
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
     * 获取：0为可用,1为不可用
     */
    public String getDelFlag() {
        return delFlag;
    }

    /**
     * 设置：0为可用,1为不可用
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}
