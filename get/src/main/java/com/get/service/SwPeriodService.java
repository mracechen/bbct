package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPeriodDO;

/**
 * 定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:23:16
 */
public interface SwPeriodService {

    SwPeriodDO get(String tid);

    List<SwPeriodDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPeriodDO swPeriod);

    int update(SwPeriodDO swPeriod);

    int remove(String tid);

    int batchRemove(String[] tids);
}
