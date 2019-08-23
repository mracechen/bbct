package com.system.record.domain;


import com.common.utils.IDUtils;
import java.io.Serializable;
import java.util.Date;

/**
 * 发送短信记录表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-23 15:01:42
 */
public class MsgRecordDO implements Serializable {

    private static final long serialVersionUID = 1L;

    //主键
    private String tid;
    //手机号码
    private String mobile;
    //短信内容
    private String msgContent;
    //状态,0为已发送,1为已经使用
    private String status;
    //创建时间
    private Date createDate;
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
     * 设置：手机号码
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取：手机号码
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 设置：短信内容
     */
    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    /**
     * 获取：短信内容
     */
    public String getMsgContent() {
        return msgContent;
    }

    /**
     * 设置：状态,0为已发送,1为已经使用
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：状态,0为已发送,1为已经使用
     */
    public String getStatus() {
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
     * @param mobile
     * @param msgContent
     * @return
     */
    public static MsgRecordDO create(String mobile,String msgContent) {
        MsgRecordDO msgRecordDO = new MsgRecordDO();
        msgRecordDO.setTid(IDUtils.randomStr());
        msgRecordDO.setCreateDate(new Date());
        msgRecordDO.setStatus("0");
        msgRecordDO.setDelFlag("0");
        msgRecordDO.setMobile(mobile);
        msgRecordDO.setMsgContent(msgContent);
        return msgRecordDO;
    }

    @Override
    public String toString() {
        return "MsgRecordDO{" +
                "tid='" + tid + '\'' +
                ", mobile='" + mobile + '\'' +
                ", msgContent='" + msgContent + '\'' +
                ", status='" + status + '\'' +
                ", createDate=" + createDate +
                ", delFlag='" + delFlag + '\'' +
                '}';
    }
}
