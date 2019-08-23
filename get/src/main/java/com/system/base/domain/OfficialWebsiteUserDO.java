package com.system.base.domain;

import java.io.Serializable;


/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-17 14:29:57
 */
@SuppressWarnings("ALL")
public class OfficialWebsiteUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键(官网用户表)
    private Integer id;
    //用户名
    private String username;
    //用户密码
    private String password;

    /**
     * 获取：主键(官网用户表)
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置：主键(官网用户表)
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置：用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取：用户密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置：用户密码
     */
    public void setPassword(String password) {
        this.password = password;
    }
}