package com.common.utils;

import lombok.ToString;

/**
 * web返回结果
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
@ToString
public class Result {

    private String status;

    private String msg;

    private Object data;

    private String sign;

    private String msgCode;

    private Object[] msgParams;

    public Result(String status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
        this.sign = IDUtils.randomStr();
    }

    public Result(String status, String msgCode, Object data, Object[] msgParams) {
        this.status = status;
        this.data = data;
        this.msgCode = msgCode;
        this.msgParams = msgParams;
        this.sign = IDUtils.randomStr();
    }

    public Result(Object data) {
        this.status = "200";
        this.msg = "success";
        this.data = data;
        this.sign = IDUtils.randomStr();
    }

    public static Result ok() {
        return new Result(null);
    }

    public static Result ok(Object data) {
        return new Result(data);
    }

    public static Result error() {
        return new Result("500", "error", null);
    }

    public static Result error(String msg) {
        return new Result("500", msg, null,null);
    }

    public static Result error(String msgCode,Object... msgParams) {
        return new Result("500",msgCode,null,msgParams);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getMsgCode() {
        return msgCode;
    }

    public void setMsgCode(String msgCode) {
        this.msgCode = msgCode;
    }

    public Object[] getMsgParams() {
        return msgParams;
    }

    public void setMsgParams(Object[] msgParams) {
        this.msgParams = msgParams;
    }
}
