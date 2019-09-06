package com.get.statuc;

/**
 * 账户记录枚举类型表
 * */
public enum  RecordEnum {

    principal_normal_release(1,"system.release.principal.normal"),
    principal_accelerate(2,"system.release.principal.accelerate"),
    evangelist_accelerate(3,"system.release.evangelist.accelerate"),
    partner_accelerate(4,"system.release.partner.accelerate"),
    transfer(5,"system.transfer"),
    receivables(6,"system.receivables"),
    period_normal_release(7,"system.release.period.normal"),
    purchasing(8,"system.purchase.product");
    private final Integer type;
    private final String desc;

    RecordEnum(Integer type, String desc){
        this.type = type;
        this.desc = desc;
    }
    public Integer getType(){
        return type;
    }
    public String getDesc(){
        return desc;
    }
}