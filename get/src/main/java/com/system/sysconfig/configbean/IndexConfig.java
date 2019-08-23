package com.system.sysconfig.configbean;

import com.common.utils.ContextUtils;
import com.common.utils.RedisUtils;
import com.system.sysconfig.domain.ConfigDO;

/**
 * 首页配置类
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
public class IndexConfig {

    /**
     * 配置的前缀信息, 将作为缓存的前缀。
     */
    public static final String prefix = "IndexConfig-";

    /**
     * 首页背景图 IndexBackGroundImg
     */
    private ConfigDO IndexBackGroundImg = null;
    /**
     * 展示中文名称图片 ChineseImg
     */
    private ConfigDO ChineseImg = null;
    /**
     * 展示英文名称图片 EnglishImg
     */
    private ConfigDO EnglishImg = null;
    /**
     * 首页英文名称下面的文字展示 IndexShowText
     */
    private ConfigDO IndexShowText = null;
    /**
     * 按钮名称 IndexButtonName
     */
    private ConfigDO IndexButtonName = null;
    /**
     * 按钮跳转地址 IndexButtonName
     */
    private ConfigDO IndexButtonLinked = null;
    /**
     * 核心业务
     */
    private ConfigDO Core = null;
    /**
     * 核心业务第一个动态第一个图片地址 CoreOneImage
     */
    private ConfigDO CoreOneImage = null;
    /**
     * 核心业务第一个动态第一行文字 CoreOneOneText
     */
    private ConfigDO CoreOneOneText = null;
    /**
     * 核心业务第一个动态第二行文字 CoreOneTwoText
     */
    private ConfigDO CoreOneTwoText = null;
    /**
     * 核心业务第一个点击地址 CoreOneUrl
     */
    private ConfigDO CoreOneUrl = null;
    /**
     * 核心业务第二个动态图片地址 CoreTwoImage
     */
    private ConfigDO CoreTwoImage = null;
    /**
     * 核心业务第二个动态第一行文字 CoreTwoOneText
     */
    private ConfigDO CoreTwoOneText = null;
    /**
     * 核心业务第二个动态第二行文字 CoreTwoTwoText
     */
    private ConfigDO CoreTwoTwoText = null;
    /**
     * 核心业务第二个点击地址 CoreTwoUrl
     */
    private ConfigDO CoreTwoUrl = null;
    /**
     * 核心业务第三个动态图片地址 CoreThreeImage
     */
    private ConfigDO CoreThreeImage = null;
    /**
     * 核心业务第三个动态第一行文字 CoreThreeOneText
     */
    private ConfigDO CoreThreeOneText = null;
    /**
     * 核心业务第三个动态第二行文字 CoreThreeTwoText
     */
    private ConfigDO CoreThreeTwoText = null;
    /**
     * 核心业务第三个点击地址 CoreThreeUrl
     */
    private ConfigDO CoreThreeUrl = null;
    /**
     * 核心业务第四个动态图片地址 CoreFourImage
     */
    private ConfigDO CoreFourImage = null;
    /**
     * 核心业务第四个动态第一行文字 CoreFourOneText
     */
    private ConfigDO CoreFourOneText = null;
    /**
     * 核心业务第四个动态第二行文字 CoreFourTwoText
     */
    private ConfigDO CoreFourTwoText = null;
    /**
     * 核心业务第四个点击地址 CoreFourUrl
     */
    private ConfigDO CoreFourUrl = null;
    /**
     * 首页的 关于我们
     */
    private ConfigDO IndexAboutUs = null;
    /**
     * 首页的 为什么选择我们
     */
    private ConfigDO IndexWhyCheckUs = null;
    /**
     * 首页的 解释为什么选择我们
     */
    private ConfigDO IndexAboutUSBecause = null;
    /**
     * 首页关于我们  第一个轮播图背景图 AboutUSOneImage
     */
    private ConfigDO AboutUSOneImage = null;
    /**
     * 首页关于我们  第一个轮播图名称 AboutUSOneText
     */
    private ConfigDO AboutUSOneText = null;
    /**
     * 首页关于我们  第二个轮播图背景图 AboutUSTwoImage
     */
    private ConfigDO AboutUSTwoImage = null;
    /**
     * 首页关于我们  第二个轮播图名称 AboutUSTwoText
     */
    private ConfigDO AboutUSTwoText = null;
    /**
     * 首页关于我们  第三个轮播图背景图 AboutUSThreeImage
     */
    private ConfigDO AboutUSThreeImage = null;
    /**
     * 首页关于我们  第三个轮播图名称 AboutUSThreeText
     */
    private ConfigDO AboutUSThreeText = null;
    /**
     * 首页关于我们  第四个轮播图背景图 AboutUSFourImage
     */
    private ConfigDO AboutUSFourImage = null;
    /**
     * 首页关于我们  第四个轮播图名称 AboutUSFourText
     */
    private ConfigDO AboutUSFourText = null;
    /**
     * 首页关于我们  第五个轮播图背景图 AboutUSFiveImage
     */
    private ConfigDO AboutUSFiveImage = null;
    /**
     * 首页关于我们  第五个轮播图名称 AboutUSFiveText
     */
    private ConfigDO AboutUSFiveText = null;
    /**
     * 首页关于我们  第六个轮播图背景图 AboutUSSixImage
     */
    private ConfigDO AboutUSSixImage = null;
    /**
     * 首页关于我们  第六个轮播图名称 AboutUSSixText
     */
    private ConfigDO AboutUSSixText = null;

    public ConfigDO getIndexBackGroundImg() {
        if (IndexBackGroundImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexBackGroundImg");
            IndexBackGroundImg = new ConfigDO("IndexBackGroundImg", cacheValue);
        }
        return IndexBackGroundImg;
    }

    public ConfigDO getChineseImg() {
        if (ChineseImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "ChineseImg");
            ChineseImg = new ConfigDO("ChineseImg", cacheValue);
        }
        return ChineseImg;
    }

    public ConfigDO getEnglishImg() {
        if (EnglishImg == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "EnglishImg");
            EnglishImg = new ConfigDO("EnglishImg", cacheValue);
        }
        return EnglishImg;
    }

    public ConfigDO getIndexShowText() {
        if (IndexShowText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexShowText");
            IndexShowText = new ConfigDO("IndexShowText", cacheValue);
        }
        return IndexShowText;
    }

    public ConfigDO getIndexButtonName() {
        if (IndexButtonName == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexButtonName");
            IndexButtonName = new ConfigDO("IndexButtonName", cacheValue);
        }
        return IndexButtonName;
    }

    public ConfigDO getIndexButtonLinked() {
        if (IndexButtonLinked == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexButtonLinked");
            IndexButtonLinked = new ConfigDO("IndexButtonLinked", cacheValue);
        }
        return IndexButtonLinked;
    }

    public ConfigDO getCore() {
        if (Core == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "Core");
            Core = new ConfigDO("Core", cacheValue);
        }
        return Core;
    }

    public ConfigDO getCoreOneImage() {
        if (CoreOneImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreOneImage");
            CoreOneImage = new ConfigDO("CoreOneImage", cacheValue);
        }
        return CoreOneImage;
    }

    public ConfigDO getCoreOneOneText() {
        if (CoreOneOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreOneOneText");
            CoreOneOneText = new ConfigDO("CoreOneOneText", cacheValue);
        }
        return CoreOneOneText;
    }

    public ConfigDO getCoreOneTwoText() {
        if (CoreOneTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreOneTwoText");
            CoreOneTwoText = new ConfigDO("CoreOneTwoText", cacheValue);
        }
        return CoreOneTwoText;
    }

    public ConfigDO getCoreOneUrl() {
        if (CoreOneUrl == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreOneUrl");
            CoreOneUrl = new ConfigDO("CoreOneUrl", cacheValue);
        }
        return CoreOneUrl;
    }

    public ConfigDO getCoreTwoImage() {
        if (CoreTwoImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreTwoImage");
            CoreTwoImage = new ConfigDO("CoreTwoImage", cacheValue);
        }
        return CoreTwoImage;
    }

    public ConfigDO getCoreTwoOneText() {
        if (CoreTwoOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreTwoOneText");
            CoreTwoOneText = new ConfigDO("CoreTwoOneText", cacheValue);
        }
        return CoreTwoOneText;
    }

    public ConfigDO getCoreTwoTwoText() {
        if (CoreTwoTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreTwoTwoText");
            CoreTwoTwoText = new ConfigDO("CoreTwoTwoText", cacheValue);
        }
        return CoreTwoTwoText;
    }

    public ConfigDO getCoreTwoUrl() {
        if (CoreTwoUrl == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreTwoUrl");
            CoreTwoUrl = new ConfigDO("CoreTwoUrl", cacheValue);
        }
        return CoreTwoUrl;
    }

    public ConfigDO getCoreThreeImage() {
        if (CoreThreeImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreThreeImage");
            CoreThreeImage = new ConfigDO("CoreThreeImage", cacheValue);
        }
        return CoreThreeImage;
    }

    public ConfigDO getCoreThreeOneText() {
        if (CoreThreeOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreThreeOneText");
            CoreThreeOneText = new ConfigDO("CoreThreeOneText", cacheValue);
        }
        return CoreThreeOneText;
    }

    public ConfigDO getCoreThreeTwoText() {
        if (CoreThreeTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreThreeTwoText");
            CoreThreeTwoText = new ConfigDO("CoreThreeTwoText", cacheValue);
        }
        return CoreThreeTwoText;
    }

    public ConfigDO getCoreThreeUrl() {
        if (CoreThreeUrl == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreThreeUrl");
            CoreThreeUrl = new ConfigDO("CoreThreeUrl", cacheValue);
        }
        return CoreThreeUrl;
    }

    public ConfigDO getCoreFourImage() {
        if (CoreFourImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreFourImage");
            CoreFourImage = new ConfigDO("CoreFourImage", cacheValue);
        }
        return CoreFourImage;
    }

    public ConfigDO getCoreFourOneText() {
        if (CoreFourOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreFourOneText");
            CoreFourOneText = new ConfigDO("CoreFourOneText", cacheValue);
        }
        return CoreFourOneText;
    }

    public ConfigDO getCoreFourTwoText() {
        if (CoreFourTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreFourTwoText");
            CoreFourTwoText = new ConfigDO("CoreFourTwoText", cacheValue);
        }
        return CoreFourTwoText;
    }

    public ConfigDO getCoreFourUrl() {
        if (CoreFourUrl == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "CoreFourUrl");
            CoreFourUrl = new ConfigDO("CoreFourUrl", cacheValue);
        }
        return CoreFourUrl;
    }

    public ConfigDO getIndexAboutUs() {
        if (IndexAboutUs == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexAboutUs");
            IndexAboutUs = new ConfigDO("IndexAboutUs", cacheValue);
        }
        return IndexAboutUs;
    }

    public ConfigDO getIndexWhyCheckUs() {
        if (IndexWhyCheckUs == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexWhyCheckUs");
            IndexWhyCheckUs = new ConfigDO("IndexWhyCheckUs", cacheValue);
        }
        return IndexWhyCheckUs;
    }

    public ConfigDO getIndexAboutUSBecause() {
        if (IndexAboutUSBecause == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "IndexAboutUSBecause");
            IndexAboutUSBecause = new ConfigDO("IndexAboutUSBecause", cacheValue);
        }
        return IndexAboutUSBecause;
    }

    public ConfigDO getAboutUSOneImage() {
        if (AboutUSOneImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSOneImage");
            AboutUSOneImage = new ConfigDO("AboutUSOneImage", cacheValue);
        }
        return AboutUSOneImage;
    }

    public ConfigDO getAboutUSOneText() {
        if (AboutUSOneText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSOneText");
            AboutUSOneText = new ConfigDO("AboutUSOneText", cacheValue);
        }
        return AboutUSOneText;
    }

    public ConfigDO getAboutUSTwoImage() {
        if (AboutUSTwoImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSTwoImage");
            AboutUSTwoImage = new ConfigDO("AboutUSTwoImage", cacheValue);
        }
        return AboutUSTwoImage;
    }

    public ConfigDO getAboutUSTwoText() {
        if (AboutUSTwoText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSTwoText");
            AboutUSTwoText = new ConfigDO("AboutUSTwoText", cacheValue);
        }
        return AboutUSTwoText;
    }

    public ConfigDO getAboutUSThreeImage() {
        if (AboutUSThreeImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSThreeImage");
            AboutUSThreeImage = new ConfigDO("AboutUSThreeImage", cacheValue);
        }
        return AboutUSThreeImage;
    }

    public ConfigDO getAboutUSThreeText() {
        if (AboutUSThreeText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSThreeText");
            AboutUSThreeText = new ConfigDO("AboutUSThreeText", cacheValue);
        }
        return AboutUSThreeText;
    }

    public ConfigDO getAboutUSFourImage() {
        if (AboutUSFourImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFourImage");
            AboutUSFourImage = new ConfigDO("AboutUSFourImage", cacheValue);
        }
        return AboutUSFourImage;
    }

    public ConfigDO getAboutUSFourText() {
        if (AboutUSFourText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFourText");
            AboutUSFourText = new ConfigDO("AboutUSFourText", cacheValue);
        }
        return AboutUSFourText;
    }

    public ConfigDO getAboutUSFiveImage() {
        if (AboutUSFiveImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFiveImage");
            AboutUSFiveImage = new ConfigDO("AboutUSFiveImage", cacheValue);
        }
        return AboutUSFiveImage;
    }

    public ConfigDO getAboutUSFiveText() {
        if (AboutUSFiveText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSFiveText");
            AboutUSFiveText = new ConfigDO("AboutUSFiveText", cacheValue);
        }
        return AboutUSFiveText;
    }

    public ConfigDO getAboutUSSixImage() {
        if (AboutUSSixImage == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSSixImage");
            AboutUSSixImage = new ConfigDO("AboutUSSixImage", cacheValue);
        }
        return AboutUSSixImage;
    }

    public ConfigDO getAboutUSSixText() {
        if (AboutUSSixText == null) {
            RedisUtils bean = (RedisUtils) ContextUtils.getBean(RedisUtils.class);
            String cacheValue = bean.get(prefix + "AboutUSSixText");
            AboutUSSixText = new ConfigDO("AboutUSSixText", cacheValue);
        }
        return AboutUSSixText;
    }

}
