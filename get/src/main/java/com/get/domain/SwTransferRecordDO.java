package com.get.domain;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 转账记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:28:18
 */
@Data
public class SwTransferRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //付款方
    private Integer payer;
            //收款方
    private Integer receiver;
            //币种id
    private String coinTypeId;
            //交易金额
    private Double amount;
            //备注
    private String remark;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //类型,1-转账，2-收款
    private Integer ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;

    public static SwTransferRecordDO create(Integer payer, Integer receiver, String coinTypeId, Double amount, String remark, Integer type){
        SwTransferRecordDO swTransferRecordDO = new SwTransferRecordDO();
        swTransferRecordDO.setTid(IDUtils.randomStr());
        swTransferRecordDO.setPayer(payer);
        swTransferRecordDO.setReceiver(receiver);
        swTransferRecordDO.setCoinTypeId(coinTypeId);
        swTransferRecordDO.setAmount(amount);
        swTransferRecordDO.setRemark(remark);
        swTransferRecordDO.setEx1(type);
        swTransferRecordDO.setCreateDate(new Date());
        swTransferRecordDO.setUpdateDate(new Date());
        swTransferRecordDO.setDelFlag(CommonStatic.NOTDELETE);
        return swTransferRecordDO;
    }
    }
