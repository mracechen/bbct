package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwEvangelistInfoDO;

/**
 * 布道者资料申请表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-26 20:24:44
 */
public interface SwEvangelistInfoService {

    SwEvangelistInfoDO get(String tid);

    List<SwEvangelistInfoDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwEvangelistInfoDO swEvangelistInfo);

    int update(SwEvangelistInfoDO swEvangelistInfo);

    int remove(String tid);

    int batchRemove(String[] tids);
}
