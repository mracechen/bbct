package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwEvangelistDO;

/**
 * 优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:14:25
 */
public interface SwEvangelistService {

    SwEvangelistDO get(String tid);

    List<SwEvangelistDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwEvangelistDO swEvangelist);

    int update(SwEvangelistDO swEvangelist);

    int remove(String tid);

    int batchRemove(String[] tids);
}
