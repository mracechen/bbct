package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 提现地址
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:33:36
 */
@Data
public class SwWithdrawAddressDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //用户ID
    private Integer userId;
            //币种ID
    private String coinTypeId;
            //提币地址
    private String address;
            //类型 1-omin 2-erc20
    private Integer type;
            //备注
    private String remark;
            //扩展3
    private String ex3;
            //扩展4
    private String ex4;
            //扩展5
    private String ex5;
            //注册时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标识
    private String delFlag;
    
    }
