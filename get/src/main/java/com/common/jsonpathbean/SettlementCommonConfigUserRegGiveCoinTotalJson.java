package com.common.jsonpathbean;

/**
 * 解析用户注册是曾送币数量的配置
 */
public class SettlementCommonConfigUserRegGiveCoinTotalJson {

    /**
     * 用户注册量
     */
    private double regUser;

    /** 该区间币的数量 */
    private double rewardCoin;

    /** 当前注册量的用户释放项目名称 */
    private String freeProjectName;


    public String getFreeProjectName() {
        return freeProjectName;
    }

    public void setFreeProjectName(String freeProjectName) {
        this.freeProjectName = freeProjectName;
    }

    public double getRegUser() {
        return regUser;
    }

    public void setRegUser(double regUser) {
        this.regUser = regUser;
    }

    public double getRewardCoin() {
        return rewardCoin;
    }

    public void setRewardCoin(double rewardCoin) {
        this.rewardCoin = rewardCoin;
    }
}
