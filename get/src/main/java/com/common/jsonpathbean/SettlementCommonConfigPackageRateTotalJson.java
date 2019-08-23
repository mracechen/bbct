package com.common.jsonpathbean;

import lombok.Data;

/**
 * 解析礼包加快下放速率
 */
@Data
public class SettlementCommonConfigPackageRateTotalJson {

    /**
     * 礼包编码
     */
    private String packageCode;

    /** 加快速率 */
    private double rate;

}
