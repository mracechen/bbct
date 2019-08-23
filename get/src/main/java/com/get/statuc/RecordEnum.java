package com.get.statuc;

/**
 * 账户记录枚举类型表
 * */
public enum  RecordEnum {

    popularize(1,"system.popularize"),
    reward(2,"system.reward"),
    withdraw(3,"system.withdraw"),
    user_operation(4,"system.admin.operation"),
    cost(5,"system.user.cost"),
    transfer(6,"system.user.transference"),
    receivables(7,"system.user.receivables"),
    packages(8,"system.packages");

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