package com.system.language.service.impl;

import com.alibaba.fastjson.JSON;
import com.common.config.TranslateConfig;
import com.common.utils.HttpClientUtils;
import com.common.utils.IDUtils;
import com.common.utils.RedisUtils;
import com.system.language.dao.LanguageDao;
import com.system.language.domain.LanguageDO;
import com.system.language.domain.TranslateResultPO;
import com.system.language.service.LanguageService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.*;


/**
 * 国际化语言service
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
@Service
public class LanguageServiceImpl implements LanguageService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LanguageDao languageDao;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private TranslateConfig translateConfig;

    @Override
    public LanguageDO get(String tid) {
        return languageDao.get(tid);
    }

    @Override
    public List<LanguageDO> list(Map<String, Object> map) {
        return languageDao.list(map);
    }

    @Override
    public List<LanguageDO> search(LanguageDO languageDO) {
        return languageDao.search(languageDO);
    }

    @Override
    public int count(Map<String, Object> map) {
        return languageDao.count(map);
    }

    @Override
    public int save(LanguageDO language) {
        redisUtils.set(language);
        return languageDao.save(language);
    }

    @Override
    public int update(LanguageDO language) {
        redisUtils.set(language);
        return languageDao.update(language);
    }

    @Override
    public int remove(String tid) {
        LanguageDO languageDO = languageDao.get(tid);
        redisUtils.delete(languageDO);
        return languageDao.remove(tid);
    }

    @Override
    public int batchRemove(String[] tids) {
        List<String> strings = Arrays.asList(tids);
        List<LanguageDO> languageDOS = languageDao.listBatchTid(strings);
        for (LanguageDO languageDO : languageDOS) {
            redisUtils.delete(languageDO);
        }

        return languageDao.batchRemove(tids);
    }

    /**
     * @param zhText
     * @param toStatus
     * @return
     * @see com.system.language.service.LanguageService
     */
    @Override
    public synchronized String toTranslate(String zhText, String toStatus) {
        if ("zh".equals(toStatus) || StringUtils.isBlank(zhText)) {
            return zhText;
        }

        zhText = zhText.replaceAll("\n", "").replaceAll("\r", "");
        // 查询缓存
        String cacheText = redisUtils.get(zhText + toStatus);
        if (StringUtils.isNotBlank(cacheText)) {
            return cacheText;
        }

        // 查询数据库
        Map<String, Object> queryParam = new HashMap<>();
        queryParam.put("zhTextNotLike", zhText);
        queryParam.put("toStatus", toStatus);
        List<LanguageDO> list = languageDao.list(queryParam);
        if (list != null && list.size() > 0) {
            redisUtils.set(list.get(0));
            return list.get(0).getToText();
        }

        // 调用翻译接口,将值保存到数据库和redis
        Map<String, String> requestParam = getTranslateParam(zhText, toStatus);
        String result = null;
        try {
            result = HttpClientUtils.doPost(translateConfig.getUrl(), requestParam, "utf-8");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("调用百度翻译接口错误");
            return null;
        }

        if (StringUtils.isBlank(result)) {
            logger.error("调用百度翻译接口错误");
            return null;
        }

        logger.info("调用百度翻译翻译结果: " + result);
        TranslateResultPO translateResultPO = JSON.parseObject(result, TranslateResultPO.class);
        if (translateResultPO != null && translateResultPO.getTrans_result() != null) {
            // 封装数据
            LanguageDO languageDO = new LanguageDO();
            languageDO.setTid(IDUtils.randomStr());
            languageDO.setCreateDate(new Date());
            languageDO.setUpdateDate(new Date());
            languageDO.setDelFlag("0");
            languageDO.setZhText(zhText);
            languageDO.setToStatus(toStatus);
            languageDO.setToText(translateResultPO.getTrans_result()[0].getDst());
            save(languageDO);
            return translateResultPO.getTrans_result()[0].getDst();
        }
        return null;
    }


    /**
     * 获得调用翻译接口请求的参数
     *
     * @param zhText
     * @param toStatus
     * @return
     */
    private Map<String, String> getTranslateParam(String zhText, String toStatus) {
        Map<String, String> requestParam = new HashMap<>();
        long salt = System.currentTimeMillis();
        String sign = translateConfig.getAppid() + zhText + salt + translateConfig.getSecretKey();
        sign = DigestUtils.md5DigestAsHex(sign.getBytes());
        requestParam.put("q", zhText);
        requestParam.put("from", "zh");
        requestParam.put("to", toStatus);
        requestParam.put("appid", translateConfig.getAppid());
        requestParam.put("salt", String.valueOf(salt));
        requestParam.put("sign", sign);
        return requestParam;
    }

}
