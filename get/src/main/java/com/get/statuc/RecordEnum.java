package com.get.statuc;

/**
 * 账户记录枚举类型表
 * */
public enum  RecordEnum {

    principal_normal_release(1,"system.release.principal.normal"),
    current_accelerate(2,"system.release.current.accelerate"),
    period_accelerate(3,"system.release.period.accelerate"),
    transfer(4,"system.transfer"),
    receivables(5,"system.receivables");
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