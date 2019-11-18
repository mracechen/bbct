package com.get.statuc;

/**
 * 系统所有公共常量配置
 *
 * @author sunYaLong
 * @data 2018/9/13
 */
public class CommonStatic {

    /**
     * 开启
     */
    public static String OPEN = "0";

    /**
     * 关闭
     */
    public static String CLOSE = "1";


    /**
     * 删除
     */
    public static String DELETE = "1";

    /**
     * 未删除
     */
    public static String NOTDELETE = "0";

    /**
     * 已激活
     */
    public static String ACTIVE = "0";

    /**
     * 未激活
     */
    public static String NOTACTIVE = "1";


    /**
     * 计算持币算力
     */
    public static String PROFIT = "0";

    /**
     * 不计持币算力
     */
    public static String NOTPROFIT = "1";

    /**
     * 是否持币算利的阈值
     */
    public static Double WHETHER_OR_NOT_PROFIT = 50.0;

    /**
     * 收益区转交易区.
     */
    public static String REVENUE_TO_TRADING = "RTT";

    /**
     * 交易区转收益区.
     */
    public static String TRADING_TO_REVENUE = "TTR";

    /**
     * 收益区内的互转
     */
    public static String REVENUE_TO_REVENUE = "RTR";

    /**
     * 系統用戶.
     */
    public static String SYSTEM = "system";

    /**
     * 等待众筹
     */
    public static String PROJECTWAIT = "0";

    /**
     * 众筹中
     */
    public static String PROJECTING = "1";

    /**
     * 众筹结束
     */
    public static String PROJECTEND = "2";

    /**
     * 英文符号 -
     */
    public static String HYPHEN  = "-";

    public static String MAIN_WALLET_ID  = "000";


    /**
     * 是否通过实名认证,0-未提交未通过
     * */
    public static String NOT_COMMIT = "0";

    /**
     * 是否通过实名认证，1-已提交未通过
     * */
    public static String NOT_PASS = "1";

    /**
     * 是否通过实名认证，2-已提交已通过
     * */
    public static String IS_PASSED = "2";

    /**
     * 用户类型-普通用户
     * */
    public static Integer USER_TYPE_COMMON = 0;

    /**
     * 用户类型-布道者
     * */
    public static Integer USER_TYPE_EVANGELIST = 1;

    /**
     * 用户类型-合伙人
     * */
    public static Integer USER_TYPE_PARTNER = 2;

    /**
     * 用户实名状态-提交
     * */
    public static String USER_AUTH_STATUS_WAIT = "0";

    /**
     * 用户实名状态-通过
     * */
    public static String USER_AUTH_STATUS_PASSED = "1";

    /**
     * 用户实名状态-驳回
     * */
    public static String USER_AUTH_STATUS_FAILED = "2";

    /**
     * 已发送
     * */
    public static Integer SEND = 0;

    /**
     * 已使用
     * */
    public static Integer USED = 1;

    /**
     * 手机号码注册
     * */
    public static String MOBILE_REGISTER = "1";

    /**
     * 邮箱注册
     * */
    public static String EMAIL_REGISTER = "2";


    /**
     * 区块链转账状态-转账中
     * */
    public static String TRANSFER_WAITING = "0";

    /**
     * 区块链转账状态-转账成功
     * */
    public static String TRANSFER_SUCCESS = "1";

    /**
     * 区块链转账状态-转账失败
     * */
    public static String TRANSFER_FAILED = "2";

    /**
     * 释放状态，0-未释放
     * */
    public static Integer NO_RELEASE = 0;

    /**
     * 释放状态，1-已释放
     * */
    public static Integer RELEASED = 1;

    /**
     * 导致释放的方式，1-自然释放
     * */
    public static Integer NORMAL_RELEASE = 1;

    /**
     * 导致释放的方式，2-活币金释放
     * */
    public static Integer CURRENT_CAUSE_RELEASE = 2;

    /**
     * 导致释放的方式，3-定币金释放
     * */
    public static Integer PERIOD_CAUSE_RELEASE = 3;

    /**
     * 导致释放的方式，4-下级活币金释放
     * */
    public static Integer CHILD_CURRENT_CAUSE_RELEASE = 4;

    /**
     * 导致释放的方式，5-下级定币金释放
     * */
    public static Integer CHILD_PERIOD_CAUSE_RELEASE = 5;

    /**
     * 导致释放的方式，6-下级优币金释放
     * */
    public static Integer CHILD_EVANGELIST_CAUSE_RELEASE = 6;

    /**
     * 导致释放的方式，7-下级升币金释放
     * */
    public static Integer CHILD_PARTNER_CAUSE_RELEASE = 7;

    /**
     * 释放目标类型，1-固币金
     * */
    public static Integer RELEASE_TARGET_PRINCIPAL = 1;

    /**
     * 释放目标类型，2-优币金
     * */
    public static Integer RELEASE_TARGET_EVANGELIST = 2;

    /**
     * 释放目标类型，3-升币金
     * */
    public static Integer RELEASE_TARGET_PARTNER = 3;

    /**
     * 审核状态，0-待审核
     * */
    public static String CHECK_WAITING = "0";
    /**
     * 审核状态，1-审核通过
     * */
    public static String CHECK_SUCCESS = "1";
    /**
     * 审核状态，2-审核拒绝
     * */
    public static String CHECK_FAILED = "2";

    /**
     * 转账
     * */
    public static Integer TRANSFER = 1;
    /**
     * 收款
     * */
    public static Integer RECEIVE = 2;

}