package com.get.domain;

import com.common.utils.IDUtils;
import com.get.statuc.CommonStatic;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 释放记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:23:28
 */
@Data
public class SwReleaseRecordDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //ID
    private String tid;
            //释放目标id
    private String targetId;
            //释放金额
    private Double amount;
            //导致释放的方式，1-自然释放，2-活币金释放，3-定币金释放
    private Integer causeType;
            //导致释放的用户ID
    private Integer causeUserId;
            //备注
    private String remark;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //释放目标类型，1-固币金，2-优币金，3-升币金
    private Integer ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;

    public static SwReleaseRecordDO create(String targetId, Double amount, Integer causeType, Integer causeUserId, Integer targetType){
        SwReleaseRecordDO swReleaseRecordDO = new SwReleaseRecordDO();
        swReleaseRecordDO.setTid(IDUtils.randomStr());
        swReleaseRecordDO.setTargetId(targetId);
        swReleaseRecordDO.setAmount(amount);
        swReleaseRecordDO.setCauseType(causeType);
        swReleaseRecordDO.setCauseUserId(causeUserId);
        swReleaseRecordDO.setCreateDate(new Date());
        swReleaseRecordDO.setUpdateDate(new Date());
        swReleaseRecordDO.setEx1(targetType);
        swReleaseRecordDO.setDelFlag(CommonStatic.NOTDELETE);
        return swReleaseRecordDO;
    }

    }
