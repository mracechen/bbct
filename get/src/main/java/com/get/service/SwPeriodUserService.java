package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPeriodUserDO;

/**
 * 用户持有定币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:25:02
 */
public interface SwPeriodUserService {

    SwPeriodUserDO get(String tid);

    List<SwPeriodUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPeriodUserDO swPeriodUser);

    int update(SwPeriodUserDO swPeriodUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
