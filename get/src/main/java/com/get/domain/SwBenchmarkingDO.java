package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 对标项目表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:56:30
 */
@Data
public class SwBenchmarkingDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //源币种
    private String sourceCoinId;
            //目标币种
    private String targetCoinId;
            //源币种数量
    private Double sourceNum;
            //目标币种数量
    private Double targetNum;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //ex1
    private String ex1;
            //ex2
    private String ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;

    private String sourceCoinName;

    private String targetCoinName;
    }
