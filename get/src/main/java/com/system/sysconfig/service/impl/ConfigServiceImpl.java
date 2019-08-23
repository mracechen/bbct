package com.system.sysconfig.service.impl;

import com.common.utils.RedisUtils;
import com.system.sysconfig.dao.ConfigDao;
import com.system.sysconfig.domain.ConfigDO;
import com.system.sysconfig.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 系统常亮配置service
 *
 * @author sunYaLong
 * @data 2018/9/6
 */
@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private ConfigDao configDao;

    @Autowired
    private RedisUtils redisUtils;

    @Override
    public ConfigDO get(String tid) {
        return configDao.get(tid);
    }

    @Override
    public List<ConfigDO> list(Map<String, Object> map) {
        return configDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return configDao.count(map);
    }

    @Override
    public int save(ConfigDO config) {
        redisUtils.set(config.getFieldName(), config.getFieldValue());
        return configDao.save(config);
    }

    @Override
    public int update(ConfigDO config) {
        Map<String, Object> qeruyParam = new HashMap<>();
        qeruyParam.put("fieldName", config.getFieldName());
        List<ConfigDO> list = list(qeruyParam);
        // 如果数据库中没有就保存
        if (list == null || list.size() == 0) {
            return save(config);
        }
        // 更新缓存
        redisUtils.set(config.getFieldName(), config.getFieldValue());
        config.setCreateDate(null);
        return configDao.update(config);
    }

    @Override
    public int remove(String tid) {
        return configDao.remove(tid);
    }

    @Override
    public int batchRemove(String[] tids) {
        return configDao.batchRemove(tids);
    }

    @Override
    public String getCache(String prefix, String suffix) {
        String cacheValue = redisUtils.get(prefix + suffix);
        return cacheValue;
    }

}
