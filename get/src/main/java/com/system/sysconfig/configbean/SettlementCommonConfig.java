package com.system.sysconfig.configbean;


import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 系统基本配置
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class SettlementCommonConfig {



    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "SettlementCommonConfig-";

    /**
     * 后台系统全名
     */
    private ConfigDO BackWebsiteFullName = null;

    public ConfigDO getBackWebsiteFullName() {
        if (BackWebsiteFullName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "BackWebsiteFullName");
            BackWebsiteFullName = new ConfigDO("BackWebsiteFullName", cacheValue);
        }
        return BackWebsiteFullName;
    }

    /**
     * 后台系统小名
     */
    private ConfigDO BackWebsiteSubName = null;

    public ConfigDO getBackWebsiteSubName() {
        if (BackWebsiteSubName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "BackWebsiteSubName");
            BackWebsiteSubName = new ConfigDO("BackWebsiteSubName", cacheValue);
        }
        return BackWebsiteSubName;
    }

    /**
     * 后台系统全名
     */
    private ConfigDO WebsiteURL = null;

    public ConfigDO getWebsiteURL() {
        if (WebsiteURL == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "WebsiteURL");
            WebsiteURL = new ConfigDO("WebsiteURL", cacheValue);
        }
        return WebsiteURL;
    }

    /**
     * 用户直推多少人并实名，签到可领取奖励金额
     */
    private ConfigDO PushUserNumber = null;

    public ConfigDO getPushUserNumber() {
        if (PushUserNumber == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushUserNumber");
            PushUserNumber = new ConfigDO("PushUserNumber", cacheValue);
        }
        return PushUserNumber;
    }

    /**
     * 用户直推多少人可赠送的币种
     */
    private ConfigDO PushUserNumberCoin = null;

    public ConfigDO getPushUserNumberCoin() {
        if (PushUserNumberCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushUserNumberCoin");
            PushUserNumberCoin = new ConfigDO("PushUserNumberCoin", cacheValue);
        }
        return PushUserNumberCoin;
    }

    /**
     * 用户直推多少人可赠送的币种数量
     */
    private ConfigDO PushUserNumberCoinNum = null;

    public ConfigDO getPushUserNumberCoinNum() {
        if (PushUserNumberCoinNum == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushUserNumberCoinNum");
            PushUserNumberCoinNum = new ConfigDO("PushUserNumberCoinNum", cacheValue);
        }
        return PushUserNumberCoinNum;
    }

    /**
     * 用户直推多少人可获得签到奖励
     */
    private ConfigDO PushUserNumberCheckIn = null;

    public ConfigDO getPushUserNumberCheckIn() {
        if (PushUserNumberCheckIn == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushUserNumberCheckIn");
            PushUserNumberCheckIn = new ConfigDO("PushUserNumberCheckIn", cacheValue);
        }
        return PushUserNumberCheckIn;
    }

    /**
     * 管理员登录开启手机号码验证
     */
    private ConfigDO IsEnableAdminLoginMobileCheck = null;

    public ConfigDO getIsEnableAdminLoginMobileCheck() {
        if (IsEnableAdminLoginMobileCheck == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IsEnableAdminLoginMobileCheck");
            IsEnableAdminLoginMobileCheck = new ConfigDO("IsEnableAdminLoginMobileCheck", cacheValue);
        }
        return IsEnableAdminLoginMobileCheck;
    }

    /**
     * 注册赠送币种
     */
    private ConfigDO UserRegGiveCoin = null;

    public ConfigDO getUserRegGiveCoin() {
        if (UserRegGiveCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "UserRegGiveCoin");
            UserRegGiveCoin = new ConfigDO("UserRegGiveCoin", cacheValue);
        }
        return UserRegGiveCoin;
    }

    /**
     * 注册赠送数量
     */
    private ConfigDO UserRegGiveCoinTotalJson = null;

    public ConfigDO getUserRegGiveCoinTotalJson() {
        if (UserRegGiveCoinTotalJson == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "UserRegGiveCoinTotalJson");
            UserRegGiveCoinTotalJson = new ConfigDO("UserRegGiveCoinTotalJson", cacheValue);
        }
        return UserRegGiveCoinTotalJson;
    }

    /**
     * 网站LOGO
     */
    private ConfigDO WebsiteLogo = null;

    public ConfigDO getWebsiteLogo() {
        if (WebsiteLogo == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "WebsiteLogo");
            WebsiteLogo = new ConfigDO("WebsiteLogo", cacheValue);
        }
        return WebsiteLogo;
    }

    /**
     * 网站LOGO
     */
    private ConfigDO SystemAccountId = null;

    public ConfigDO getSystemAccountId() {
        if (SystemAccountId == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SystemAccountId");
            SystemAccountId = new ConfigDO("SystemAccountId", cacheValue);
        }
        return SystemAccountId;
    }


    /**
     * 1个KBT转化KBT+比例
     */
    private ConfigDO KbtToKb2Proportion = null;

    public ConfigDO getKbtToKb2Proportion() {
        if (KbtToKb2Proportion == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "KbtToKb2Proportion");
            KbtToKb2Proportion = new ConfigDO("KbtToKb2Proportion", cacheValue);
        }
        return KbtToKb2Proportion;
    }


    /**
     * 商家消费返佣比例
     */
    private ConfigDO ShopReturnTotalJson = null;

    public ConfigDO getShopReturnTotalJson() {
        if (ShopReturnTotalJson == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ShopReturnTotalJson");
            ShopReturnTotalJson = new ConfigDO("ShopReturnTotalJson", cacheValue);
        }
        return ShopReturnTotalJson;
    }

    /**
     * 消费GCP转换USDT比例
     */
    private ConfigDO ConsumeRevertRatio = null;

    public ConfigDO getConsumeRevertRatio() {
        if (ConsumeRevertRatio == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ConsumeRevertRatio");
            ConsumeRevertRatio = new ConfigDO("ConsumeRevertRatio", cacheValue);
        }
        return ConsumeRevertRatio;
    }

    /**
     * 推荐人奖励规则
     */
    private ConfigDO RewardRuleCode = null;

    public ConfigDO getRewardRuleCode() {
        if (RewardRuleCode == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "RewardRuleCode");
            RewardRuleCode = new ConfigDO("RewardRuleCode", cacheValue);
        }
        return RewardRuleCode;
    }

    /**
     * 推荐满一定数量可获得赠送的币种
     * */
    private ConfigDO PushReachedUserCoinType = null;

    public ConfigDO getPushReachedUserCoinType() {
        if (PushReachedUserCoinType == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushReachedUserCoinType");
            PushReachedUserCoinType = new ConfigDO("PushReachedUserCoinType", cacheValue);
        }
        return PushReachedUserCoinType;
    }

    /**
     * 推荐满一定数量可获得赠送的币种数量
     * */
    private ConfigDO PushReachedUserCoinNumber = null;

    public ConfigDO getPushReachedUserCoinNumber() {
        if (PushReachedUserCoinNumber == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushReachedUserCoinNumber");
            PushReachedUserCoinNumber = new ConfigDO("PushReachedUserCoinNumber", cacheValue);
        }
        return PushReachedUserCoinNumber;
    }

    /**
     * 每推荐满多少人可获得奖励
     * */
    private ConfigDO PushReachedUserNumber = null;

    public ConfigDO getPushReachedUserNumber() {
        if (PushReachedUserNumber == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PushReachedUserNumber");
            PushReachedUserNumber = new ConfigDO("PushReachedUserNumber", cacheValue);
        }
        return PushReachedUserNumber;
    }


    /**
     * 礼包奖励规则
     * */
    private ConfigDO PackageRuleJson = null;

    public ConfigDO getPackageRuleJson() {
        if (PackageRuleJson == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PackageRuleJson");
            PackageRuleJson = new ConfigDO("PackageRuleJson", cacheValue);
        }
        return PackageRuleJson;
    }

 /*   *//**
     * 超值礼包48小时内倍数
     * *//*
    private ConfigDO Before48HourMultiple = null;

    public ConfigDO getBefore48HourMultiple() {
        if (Before48HourMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before48HourMultiple");
            Before48HourMultiple = new ConfigDO("Before48HourMultiple", cacheValue);
        }
        return Before48HourMultiple;
    }

    *//**
     * 超值礼包96小时内倍数
     * *//*
    private ConfigDO Before96HourMultiple = null;

    public ConfigDO getBefore96HourMultiple() {
        if (Before96HourMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before96HourMultiple");
            Before96HourMultiple = new ConfigDO("Before96HourMultiple", cacheValue);
        }
        return Before96HourMultiple;
    }

    *//**
     * 超值礼包96小时后倍数
     * *//*
    private ConfigDO After96HourMultiple = null;

    public ConfigDO getAfter96HourMultiple() {
        if (After96HourMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "After96HourMultiple");
            After96HourMultiple = new ConfigDO("After96HourMultiple", cacheValue);
        }
        return After96HourMultiple;
    }*/

    /**
     * 超值礼包第一阶段分割点
     * */
    private ConfigDO FirstLevelDay = null;

    public ConfigDO getFirstLevelDay() {
        if (FirstLevelDay == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "FirstLevelDay");
            FirstLevelDay = new ConfigDO("FirstLevelDay", cacheValue);
        }
        return FirstLevelDay;
    }

    /**
     * 超值礼包第二阶段分割点
     * */
    private ConfigDO SecondLevelDay = null;

    public ConfigDO getSecondLevelDay() {
        if (SecondLevelDay == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SecondLevelDay");
            SecondLevelDay = new ConfigDO("SecondLevelDay", cacheValue);
        }
        return SecondLevelDay;
    }

    /**
     * 超值礼包附赠币种第一阶段内倍数
     * */
    private ConfigDO Before7DayMultiple = null;

    public ConfigDO getBefore7DayMultiple() {
        if (Before7DayMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before7DayMultiple");
            Before7DayMultiple = new ConfigDO("Before7DayMultiple", cacheValue);
        }
        return Before7DayMultiple;
    }

    /**
     * 超值礼包附赠币种第二阶段内倍数
     * */
    private ConfigDO Before21DayMultiple = null;

    public ConfigDO getBefore21DayMultiple() {
        if (Before21DayMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before21DayMultiple");
            Before21DayMultiple = new ConfigDO("Before21DayMultiple", cacheValue);
        }
        return Before21DayMultiple;
    }

    /**
     * 超值礼包附赠币种第三阶段后倍数
     * */
    private ConfigDO After21DayMultiple = null;

    public ConfigDO getAfter21DayMultiple() {
        if (After21DayMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "After21DayMultiple");
            After21DayMultiple = new ConfigDO("After21DayMultiple", cacheValue);
        }
        return After21DayMultiple;
    }

    /**
     * 超值礼包兑换币种第一阶段内倍数
     * */
    private ConfigDO Before7DayMultipleInner = null;

    public ConfigDO getBefore7DayMultipleInner() {
        if (Before7DayMultipleInner == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before7DayMultipleInner");
            Before7DayMultipleInner = new ConfigDO("Before7DayMultipleInner", cacheValue);
        }
        return Before7DayMultipleInner;
    }

    /**
     * 超值礼包兑换币种第二阶段内倍数
     * */
    private ConfigDO Before21DayMultipleInner = null;

    public ConfigDO getBefore21DayMultipleInner() {
        if (Before21DayMultipleInner == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Before21DayMultipleInner");
            Before21DayMultipleInner = new ConfigDO("Before21DayMultipleInner", cacheValue);
        }
        return Before21DayMultipleInner;
    }

    /**
     * 超值礼包兑换币种第三阶段后倍数
     * */
    private ConfigDO After21DayMultipleInner = null;

    public ConfigDO getAfter21DayMultipleInner() {
        if (After21DayMultipleInner == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "After21DayMultipleInner");
            After21DayMultipleInner = new ConfigDO("After21DayMultipleInner", cacheValue);
        }
        return After21DayMultipleInner;
    }

    /**
     * 每月礼包附赠币种
     * */
    private ConfigDO MonthPackageIncidentalCoin = null;

    public ConfigDO getMonthPackageIncidentalCoin() {
        if (MonthPackageIncidentalCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "MonthPackageIncidentalCoin");
            MonthPackageIncidentalCoin = new ConfigDO("MonthPackageIncidentalCoin", cacheValue);
        }
        return MonthPackageIncidentalCoin;
    }

    /**
     * 每月礼包附赠币种数量
     * */
    private ConfigDO MonthPackageIncidentalCoinNum = null;

    public ConfigDO getMonthPackageIncidentalCoinNum() {
        if (MonthPackageIncidentalCoinNum == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "MonthPackageIncidentalCoinNum");
            MonthPackageIncidentalCoinNum = new ConfigDO("MonthPackageIncidentalCoinNum", cacheValue);
        }
        return MonthPackageIncidentalCoinNum;
    }

    /**
     * 超值礼包附赠币种
     * */
    private ConfigDO SuperPackageIncidentalCoin = null;

    public ConfigDO getSuperPackageIncidentalCoin() {
        if (SuperPackageIncidentalCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SuperPackageIncidentalCoin");
            SuperPackageIncidentalCoin = new ConfigDO("SuperPackageIncidentalCoin", cacheValue);
        }
        return SuperPackageIncidentalCoin;
    }

    /**
     * 满足分红第一阶段的礼包编码
     * */
    private ConfigDO FirstShareLevelOfPackage = null;

    public ConfigDO getFirstShareLevelOfPackage() {
        if (FirstShareLevelOfPackage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "FirstShareLevelOfPackage");
            FirstShareLevelOfPackage = new ConfigDO("FirstShareLevelOfPackage", cacheValue);
        }
        return FirstShareLevelOfPackage;
    }


    /**
     * 满足分红第二阶段的礼包编码
     * */
    private ConfigDO SecondShareLevelOfPackage = null;

    public ConfigDO getSecondShareLevelOfPackage() {
        if (SecondShareLevelOfPackage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SecondShareLevelOfPackage");
            SecondShareLevelOfPackage = new ConfigDO("SecondShareLevelOfPackage", cacheValue);
        }
        return SecondShareLevelOfPackage;
    }

    /**
     * 满足分红第三阶段的礼包编码
     * */
    private ConfigDO ThirdShareLevelOfPackage = null;

    public ConfigDO getThirdShareLevelOfPackage() {
        if (ThirdShareLevelOfPackage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ThirdShareLevelOfPackage");
            ThirdShareLevelOfPackage = new ConfigDO("ThirdShareLevelOfPackage", cacheValue);
        }
        return ThirdShareLevelOfPackage;
    }

    /**
     * 分红第一阶段的代数界限
     * */
    private ConfigDO FirstShareLevelBorder = null;

    public ConfigDO getFirstShareLevelBorder() {
        if (FirstShareLevelBorder == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "FirstShareLevelBorder");
            FirstShareLevelBorder = new ConfigDO("FirstShareLevelBorder", cacheValue);
        }
        return FirstShareLevelBorder;
    }

    /**
     * 分红第二阶段的代数界限
     * */
    private ConfigDO SecondShareLevelBorder = null;

    public ConfigDO getSecondShareLevelBorder() {
        if (SecondShareLevelBorder == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SecondShareLevelBorder");
            SecondShareLevelBorder = new ConfigDO("SecondShareLevelBorder", cacheValue);
        }
        return SecondShareLevelBorder;
    }

    /**
     * 分红第三阶段的代数界限
     * */
    private ConfigDO ThirdShareLevelOfBorder = null;

    public ConfigDO getThirdShareLevelOfBorder() {
        if (ThirdShareLevelOfBorder == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ThirdShareLevelOfBorder");
            ThirdShareLevelOfBorder = new ConfigDO("ThirdShareLevelOfBorder", cacheValue);
        }
        return ThirdShareLevelOfBorder;
    }

    /**
     * 超值礼包下放速率
     * */
    private ConfigDO SuperPackageRate = null;

    public ConfigDO getSuperPackageRate() {
        if (SuperPackageRate == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "SuperPackageRate");
            SuperPackageRate = new ConfigDO("SuperPackageRate", cacheValue);
        }
        return SuperPackageRate;
    }

    /**
     * 购买每月礼包替代币种
     * */
    private ConfigDO MonthPackageInsteadCoin = null;

    public ConfigDO getMonthPackageInsteadCoin() {
        if (MonthPackageInsteadCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "MonthPackageInsteadCoin");
            MonthPackageInsteadCoin = new ConfigDO("MonthPackageInsteadCoin", cacheValue);
        }
        return MonthPackageInsteadCoin;
    }

    /**
     * 购买每月礼包替代币种比例
     * */
    private ConfigDO MonthPackageInsteadPercent = null;

    public ConfigDO getMonthPackageInsteadPercent() {
        if (MonthPackageInsteadPercent == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "MonthPackageInsteadPercent");
            MonthPackageInsteadPercent = new ConfigDO("MonthPackageInsteadPercent", cacheValue);
        }
        return MonthPackageInsteadPercent;
    }


    /**
     * 礼包利润给1288的分红比例
     * */
    private ConfigDO PackageOf1288SharePercent = null;

    public ConfigDO getPackageOf1288SharePercent() {
        if (PackageOf1288SharePercent == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PackageOf1288SharePercent");
            PackageOf1288SharePercent = new ConfigDO("PackageOf1288SharePercent", cacheValue);
        }
        return PackageOf1288SharePercent;
    }

    /**
     * 1288兑换源币种
     * */
    private ConfigDO ShareOf1288SourceCoin = null;

    public ConfigDO getShareOf1288SourceCoin() {
        if (ShareOf1288SourceCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ShareOf1288SourceCoin");
            ShareOf1288SourceCoin = new ConfigDO("ShareOf1288SourceCoin", cacheValue);
        }
        return ShareOf1288SourceCoin;
    }

    /**
     * 1288兑换目标币种
     * */
    private ConfigDO ShareOf1288TargetCoin = null;

    public ConfigDO getShareOf1288TargetCoin() {
        if (ShareOf1288TargetCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ShareOf1288TargetCoin");
            ShareOf1288TargetCoin = new ConfigDO("ShareOf1288TargetCoin", cacheValue);
        }
        return ShareOf1288TargetCoin;
    }

    /**
     * 1288特殊礼包编码
     * */
    private ConfigDO PackageOf1288Code = null;

    public ConfigDO getPackageOf1288Code() {
        if (PackageOf1288Code == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "PackageOf1288Code");
            PackageOf1288Code = new ConfigDO("PackageOf1288Code", cacheValue);
        }
        return PackageOf1288Code;
    }

    /**
     * 达到1级领导需达成商户数量
     * */
    private ConfigDO ShopNumOfL1 = null;

    public ConfigDO getShopNumOfL1() {
        if (ShopNumOfL1 == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ShopNumOfL1");
            ShopNumOfL1 = new ConfigDO("ShopNumOfL1", cacheValue);
        }
        return ShopNumOfL1;
    }

    /**
     * 达到1级领导需达成会员数量
     * */
    private ConfigDO UserNumOfL1 = null;

    public ConfigDO getUserNumOfL1() {
        if (UserNumOfL1 == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "UserNumOfL1");
            UserNumOfL1 = new ConfigDO("UserNumOfL1", cacheValue);
        }
        return UserNumOfL1;
    }

    /**
     * 达到1级领导需达成币种类型
     * */
    private ConfigDO CoinTypeOfL1 = null;

    public ConfigDO getCoinTypeOfL1() {
        if (CoinTypeOfL1 == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoinTypeOfL1");
            CoinTypeOfL1 = new ConfigDO("CoinTypeOfL1", cacheValue);
        }
        return CoinTypeOfL1;
    }

    /**
     * 达到1级领导需达成币种数量
     * */
    private ConfigDO CoinNumOfL1 = null;

    public ConfigDO getCoinNumOfL1() {
        if (CoinNumOfL1 == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoinNumOfL1");
            CoinNumOfL1 = new ConfigDO("CoinNumOfL1", cacheValue);
        }
        return CoinNumOfL1;
    }

    /**
     * 提币手续费
     * */
    private ConfigDO WithFee = null;

    public ConfigDO getWithFee() {
        if (WithFee == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "WithFee");
            WithFee = new ConfigDO("WithFee", cacheValue);
        }
        return WithFee;
    }

    /**
     * 最低提现额度
     * */
    private ConfigDO MinWithLimit = null;

    public ConfigDO getMinWithLimit() {
        if (MinWithLimit == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "MinWithLimit");
            MinWithLimit = new ConfigDO("MinWithLimit", cacheValue);
        }
        return MinWithLimit;
    }

    /**
     * 商家消费返还币种
     * */
    private ConfigDO ConsumeCoin = null;

    public ConfigDO getConsumeCoin() {
        if (ConsumeCoin == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ConsumeCoin");
            ConsumeCoin = new ConfigDO("ConsumeCoin", cacheValue);
        }
        return ConsumeCoin;
    }

    /**
     * 商家消费返还币种倍数
     * */
    private ConfigDO ConsumeCoinMultiple = null;

    public ConfigDO getConsumeCoinMultiple() {
        if (ConsumeCoinMultiple == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ConsumeCoinMultiple");
            ConsumeCoinMultiple = new ConfigDO("ConsumeCoinMultiple", cacheValue);
        }
        return ConsumeCoinMultiple;
    }

    /**
     * 是否拦截所有请求  1-拦截  0-不拦截
     * */
    private ConfigDO FilterInterface = null;

    public ConfigDO getFilterInterface() {
        if (FilterInterface == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "FilterInterface");
            FilterInterface = new ConfigDO("FilterInterface", cacheValue);
        }
        return FilterInterface;
    }
}
