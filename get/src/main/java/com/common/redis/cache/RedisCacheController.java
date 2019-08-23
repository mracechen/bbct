package com.common.redis.cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:54:01
 */

@Controller
//@RequestMapping("/manager/get/redis/cache")
@RequestMapping("/api/app/pc/redis/cache")
public class RedisCacheController {

    @Autowired
    RedisTemplate redisTemplate;

 /*   @GetMapping()
    public String clearByPrefix() {
        return "common/redis/ClearRedisCache";
    }*/

    @RequestMapping(value = "/clearByPrefix", method = RequestMethod.GET)
    public @ResponseBody String clearByPrefix(String cacheKey) {
        System.out.println(cacheKey);
        Set<String> keys = redisTemplate.keys(cacheKey);
        redisTemplate.delete(keys);
        return "OK";
    }


    @RequestMapping(value = "/searchByPrefix", method = RequestMethod.GET)
    public @ResponseBody Object searchByPrefix(String cacheKey) {
        Map<String,Object> map = new HashMap<>();
        System.out.println(cacheKey);
        Set<String> keys = redisTemplate.keys(cacheKey);
        for(String key:keys){
            Object o = redisTemplate.opsForValue().get(key);
            map.put(key,o);
        }
        return map;
    }
}
