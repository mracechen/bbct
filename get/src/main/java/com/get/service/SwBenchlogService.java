package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwBenchlogDO;

/**
 * 对标记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:48:52
 */
public interface SwBenchlogService {

    SwBenchlogDO get(String tid);

    List<SwBenchlogDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwBenchlogDO swBenchlog);

    int update(SwBenchlogDO swBenchlog);

    int remove(String tid);

    int batchRemove(String[] tids);
}
