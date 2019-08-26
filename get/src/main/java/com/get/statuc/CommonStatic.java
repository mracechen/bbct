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
     * 大钱包
     */
    public static String BITWALLET = "0";

    /**
     * 非大钱包
     */
    public static String NOTBITWALLET = "1";

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
     * 注册送虚拟币数量
     * */
    public static double REGISTER_REWARD_COIN_NUM = 10;

    /**
     * 实名认证送虚拟币数量
     * */
    public static double AUTH_REWARD_COIN_NUM = 10;

    /**
     * 推荐达量送虚拟币数量
     * */
    public static double RECOMMENT_REWARD_COIN_NUM = 30;

    /**
     * 交易返还百分比
     * */
    public static double TRAN_RETURN_PERCENT = 0.34;

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
     * 商户状态-待审核
     * */
    public static String SHOP_CHECK_WAIT = "0";

    /**
     * 商户状态-审核通过
     * */
    public static String SHOP_CHECK_PASSED = "1";

    /**
     * 商户状态-审核拒绝
     * */
    public static String SHOP_CHECK_FAILED = "2";

    /**
     * 分红方式-按百分比分红
     * */
    public static Integer SHARE_TYPE_PERCENT = 1;

    /**
     * 分红方式-按个数分红
     * */
    public static Integer SHARE_TYPE_NUMBER = 2;

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
     * 礼包类型-超值礼包
     * */
    public static Integer SUPER_PACKAGE = 1;

    /**
     * 礼包类型-每月礼包
     * */
    public static Integer MONTH_PACKAGE = 2;

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
     * 支付方式-全款
     * */
    public static String PAY_FULL = "1";

    /**
     * 支付方式-抵扣
     * */
    public static String PAY_DISCOUNT = "2";

    /**
     * 购买行为-正常购买
     * */
    public static Integer NORMAL_BOUGHT = 1;

    /**
     * 购买行为-赠送
     * */
    public static Integer SEND_FOR_GIFT = 2;

    /**
     * 提币状态-提币中
     * */
    public static String IS_WITHING = "0";

    /**
     * 提币状态-提币成功
     * */
    public static Integer WITH_SUCCESS = 1;

    /**
     * 提币状态-提币失败
     * */
    public static Integer WITH_FAILED = 2;

    /**
     * 待处理
     * */
    public static String IS_DEAL = "0";

    /**
     * 商家确认
     * */
    public static String SHOP_PASS = "1";

    /**
     * 商家拒绝
     * */
    public static String SHOP_REFUSE = "2";

    /**
     * 搜索类型，1-店铺搜索
     * */
    public static Integer SEARCH_TYPE_BUSINESS = 1;

    /**
     * 缓存店铺名列表
     * */
    public static String CACHE_BUSINESS_NAME_LIST = "BusinessNameList";
}