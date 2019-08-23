package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPartnerDO;

/**
 * 升币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:20:06
 */
public interface SwPartnerService {

    SwPartnerDO get(String tid);

    List<SwPartnerDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPartnerDO swPartner);

    int update(SwPartnerDO swPartner);

    int remove(String tid);

    int batchRemove(String[] tids);
}
