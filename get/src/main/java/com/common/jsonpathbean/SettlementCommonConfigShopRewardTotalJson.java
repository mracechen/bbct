package com.common.jsonpathbean;

import lombok.Data;

/**
 * 解析商户返佣规则
 */
@Data
public class SettlementCommonConfigShopRewardTotalJson {

    /**
     * 币种名称
     */
    private String coinName;

    /** 返佣比例 */
    private double returnPercent;

    /**  使用优先级，数值越大优先级越高 */
    private int useLevel;

    /**  是否给上级分红 */
    private Boolean share = false;

}
