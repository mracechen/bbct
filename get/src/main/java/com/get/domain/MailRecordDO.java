package com.get.domain;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;

import java.io.Serializable;
import java.util.Date;


/**
 * 邮箱注册码表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:50:52
 */
public class MailRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //id
    private String tid;
            //邮箱
    private String email;
            //内容
    private String content;
            //状态
    private Integer status;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
    
        /**
     * 设置：id
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 获取：id
     */
    public String getTid() {
        return tid;
    }
        /**
     * 设置：邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取：邮箱
     */
    public String getEmail() {
        return email;
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
     * 设置：状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态
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
     * 创建发送短信记录
     *
     * @param email
     * @param content
     * @return
     */
    public static MailRecordDO create(String email, String content) {
        MailRecordDO mailRecordDO = new MailRecordDO();
        mailRecordDO.setTid(IDUtils.randomStr());
        mailRecordDO.setCreateDate(new Date());
        mailRecordDO.setStatus(CommonStatic.SEND);
        mailRecordDO.setDelFlag(CommonStatic.NOTDELETE);
        mailRecordDO.setEmail(email);
        mailRecordDO.setContent(content);
        return mailRecordDO;
    }
    }
