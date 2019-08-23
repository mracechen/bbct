package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPartnerUserDO;

/**
 * 用户持有升币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:21:37
 */
public interface SwPartnerUserService {

    SwPartnerUserDO get(String tid);

    List<SwPartnerUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPartnerUserDO swPartnerUser);

    int update(SwPartnerUserDO swPartnerUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
