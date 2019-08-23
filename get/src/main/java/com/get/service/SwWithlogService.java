package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwWithlogDO;

/**
 * 提币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */
public interface SwWithlogService {

    SwWithlogDO get(String tid);

    List<SwWithlogDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWithlogDO swWithlog);

    int update(SwWithlogDO swWithlog);

    int remove(String tid);

    int batchRemove(String[] tids);
}
