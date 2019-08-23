package com.common.utils;

import com.get.domain.SwUserBasicDO;

import java.math.BigDecimal;
import java.util.*;

public class UserUtils {

    /**
     * 因为sql中查出的用户并没有排序
     * 将所有推荐人按层级排好序，序号用UserListHelper中的level字段标记
     * */
    public static List<UserListHelper> getList(List<SwUserBasicDO> recommenders, SwUserBasicDO swUserBasicDO){

        List<UserListHelper> userListHelperList = new ArrayList<>();
        //当前用户推荐人
        Integer recommender = swUserBasicDO.getRecomId();
        //当前用户id
        Integer curUserId = swUserBasicDO.getTid();
        Integer count = 1;
        //排除系统用户，向上找18级
        while(curUserId != recommender && recommender != null && !recommender.equals(1) && count <= 18){
            for(SwUserBasicDO s:recommenders){
                if(s.getTid().equals(recommender)){
                    UserListHelper userListHelper = new UserListHelper();
                    userListHelper.setLevel(count);
                    userListHelper.setSwUserBasicDO(s);
                    userListHelperList.add(userListHelper);
                    curUserId = s.getTid();
                    recommender = s.getRecomId();
                    count ++ ;
                }
            }
        }
        return userListHelperList;
    }

    /**
     * 按百分比分红
     * @param userTreeList 用户列表
     * @param ruleList 规则列表
     * @param currency 红利总额
     * @return result key为用户id，value分红金额的map
     * */
    /*public static Map<Integer,Double> rewardCommenders(List<UserListHelper> userTreeList, List<SwRuleDetailDO> ruleList, Double currency){
        Map<Integer,Double> result = new HashMap<>();
        BigDecimal bcurrency = new BigDecimal(currency);
        for(UserListHelper userListHelper:userTreeList){
            if(userListHelper != null){
                *//*for(SwRuleDetailDO swRuleDetailDO:ruleList){
                    if(userListHelper.getLevel().equals(swRuleDetailDO.getLevel())){
                        SwUserBasicDO swUserBasicDO = userListHelper.getSwUserBasicDO();
                        BigDecimal ruleValue = new BigDecimal(swRuleDetailDO.getValue());
                        BigDecimal rewardValue = bcurrency.multiply(ruleValue);
                        result.put(swUserBasicDO.getTid(),rewardValue.doubleValue());
                    }
                }*//*
            }
        }
        return result;
    }*/
    /**
     * 按个数分红
     * @param userTreeList 用户列表
     * @param ruleList 规则列表
     * */
    /*public static Map<Integer,Double> rewardCommenders(List<UserListHelper> userTreeList, List<SwRuleDetailDO> ruleList){
        Map<Integer,Double> result = new HashMap<>();
        for(UserListHelper userListHelper:userTreeList){
            if(userListHelper != null) {
                for (SwRuleDetailDO swRuleDetailDO : ruleList) {
                    if (userListHelper.getLevel().equals(swRuleDetailDO.getLevel())) {
                        SwUserBasicDO swUserBasicDO = userListHelper.getSwUserBasicDO();
                        result.put(swUserBasicDO.getTid(), swRuleDetailDO.getValue());
                    }
                }
            }
        }
        return result;
    }*/
}