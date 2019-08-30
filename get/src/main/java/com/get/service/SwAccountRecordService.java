package com.get.service;

import com.get.domain.SwAccountRecordDO;

import java.util.List;
import java.util.Map;

/**
 * 账户记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:53:13
 */
public interface SwAccountRecordService {

    SwAccountRecordDO get(String tid);

    List<SwAccountRecordDO> list(Map<String, Object> map);

    List<SwAccountRecordDO> transferList(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwAccountRecordDO swAccountRecord);

    int update(SwAccountRecordDO swAccountRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
