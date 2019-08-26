package com.get.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

@JsonSerialize( include = JsonSerialize.Inclusion.NON_NULL)
public class AppInfo {
    private Integer id;

    private String version;

    private String downloadurl;

    private String downloadurl1;

    private Integer versionNumber;

    private Date createTime;

    public String getDownloadIos() {
        return downloadIos;
    }

    public void setDownloadIos(String downloadIos) {
        this.downloadIos = downloadIos;
    }

    private String downloadIos;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public String getDownloadurl() {
        return downloadurl;
    }

    public void setDownloadurl(String downloadurl) {
        this.downloadurl = downloadurl == null ? null : downloadurl.trim();
    }

    public String getDownloadurl1() {
        return downloadurl1;
    }

    public void setDownloadurl1(String downloadurl1) {
        this.downloadurl1 = downloadurl1 == null ? null : downloadurl1.trim();
    }

    public Integer getVersionNumber() {
        return versionNumber;
    }

    public void setVersionNumber(Integer versionNumber) {
        this.versionNumber = versionNumber;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}