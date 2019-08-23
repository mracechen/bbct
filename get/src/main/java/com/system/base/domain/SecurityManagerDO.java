package com.system.base.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-16 18:51:21
 */
@SuppressWarnings("ALL")
public class SecurityManagerDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //安全密匙
    private String securityKey;
    //创建时间
    private Date createDate;
    //删除标记
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
     * 获取：安全密匙
     */
    public String getSecurityKey() {
        return securityKey;
    }

    /**
     * 设置：安全密匙
     */
    public void setSecurityKey(String securityKey) {
        this.securityKey = securityKey;
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
     * 获取：删除标记
     */
    public String getDelFlag() {
        return delFlag;
    }

    /**
     * 设置：删除标记
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}
