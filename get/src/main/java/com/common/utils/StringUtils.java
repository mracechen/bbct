package com.common.utils;

/**
 * @author bootdo
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

    /**
     * 根据用户id的账户类型获得账户id
     *
     * @param userId
     * @param accountType
     * @return
     */
    public static String getAccountId(String userId, String accountType) {
        if (isBlank(userId) || isBlank(accountType)) {
            return null;
        }
        return userId + "-" + accountType;
    }

    /**
     * 根据账户id获得用户id
     *
     * @param accountId
     * @return
     */
    public static String getUserId(String accountId) {
        if (isBlank(accountId)) {
            return null;
        }
        return accountId.split("-")[1];
    }

    /**
     * 根据账户id获得账户类型
     *
     * @param accountId
     * @return
     */
    public static String getAccountType(String accountId) {
        if (isBlank(accountId)) {
            return null;
        }
        return accountId.split("-")[1];
    }

    public static boolean isBlank(Object str) {
        if (str == null) {
            return true;
        }

        if (String.valueOf(str).length() == 0) {
            return true;
        }
        return false;
    }

}
