//package com.common.initexecute;
//
//import com.common.utils.RedisUtils;
//import com.system.language.domain.LanguageDO;
//import com.system.language.service.LanguageService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * 国际化语言的初始化执行方法
// *
// * @author sunYaLong
// * @data 2018/9/5
// */
//@Component
//public class LanguageInit {
//    private final Logger logger = LoggerFactory.getLogger(this.getClass());
//
//    @Autowired
//    private LanguageService languageService;
//
//    @Autowired
//    private RedisUtils redisUtils;
//
//    public void execute() {
//        logger.info("初始化国际化文本值到缓存");
//        Map<String, Object> queryParan = new HashMap<>();
//        queryParan.put("toStatus", "en");
//        List<LanguageDO> languages = languageService.list(queryParan);
//        for (LanguageDO language : languages) {
//            redisUtils.set(language.getZhText() + language.getToStatus(), language.getToText());
//        }
//        logger.info("初始化国际化文本共: " + languages.size() + "条");
//
//    }
//}
