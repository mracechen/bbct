package com.common.utils;

import com.system.language.domain.LanguageDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * redis工具类
 *
 * @author sunYaLong
 * @data 2018/9/5
 */
@Component
public class RedisUtils {

    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    StringRedisTemplate stringRedisTemplate;

    @Resource(name = "stringRedisTemplate")
    ValueOperations<String, String> valOpsStr;

    public RedisTemplate getRedisTemplate() {
        return redisTemplate;
    }

    /**
     * 删除
     *
     * @param key
     */
    public void delete(LanguageDO key) {
        redisTemplate.delete(key.getZhText() + key.getToStatus());
    }

    /**
     * 删除
     *
     * @param key
     */
    public void delete(Object key) {
        if (key == null) {
            return;
        }
        redisTemplate.delete(key);
    }

    /**
     * 设置值
     *
     * @param key
     * @param value
     */
    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }


    /**
     * 设置值
     *
     * @param key
     * @param value
     */
    public void set(String key, Object value) {
        redisTemplate.opsForValue().set(key,value);
    }

    /**
     * 设置值
     *
     * @param key
     * @param value
     */
    public void set(String key, Object value,int time) {
        redisTemplate.opsForValue().set(key, value);
        setExpire(key,time);
    }

    /**
     * 设置值
     *
     * @param key
     * @param value
     */
    public void set(String key, String value,int time) {
        redisTemplate.opsForValue().set(key, value);
        setExpire(key,time);
    }

    /**
     * 设置值
     *
     * @param languageDO
     */
    public void set(LanguageDO languageDO) {
        redisTemplate.opsForValue().set(languageDO.getZhText() + languageDO.getToStatus(), languageDO.getToText());
    }

    /**
     * 获得值
     *
     * @param key
     * @return
     */
    public String get(String key) {
        return (String) redisTemplate.opsForValue().get(key);
    }

    /**
     * 获得值
     *
     * @param key
     * @return
     */
    public Object getObject(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    /**
     * 设置过期时间 30天
     *
     * @param key 要设置的数据的key
     * @param time 设置过期的时间
     * @return
     */
    public boolean setExpire(String key, int time) {
        Boolean expire = redisTemplate.expire(key, time,  TimeUnit.MILLISECONDS);
        return expire;
    }

    /**
     * 设置过期时间 自定义
     *
     * @param key 要设置的数据的key
     * @param time 设置过期的时间
     * @param  timeUnit 时间粒度
     * @return
     */
    public boolean setExpire(String key, Object value, int time, TimeUnit timeUnit) {
        redisTemplate.opsForValue().set(key, value);
        Boolean expire = redisTemplate.expire(key, time,  timeUnit);
        return expire;
    }

    /**
     * 默认设置三十天过期
     *
     * @param languageDO
     * @return
     */
    public boolean setExpire(LanguageDO languageDO) {
        return redisTemplate.expire(languageDO.getZhText() + languageDO.getToStatus(), 30, TimeUnit.DAYS);
    }


    public void setKey(String key, String value,int time){
        stringRedisTemplate.opsForValue().set(key,value,time);
    }

}
