package com.get.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwReleaseRecordDO;

/**
 * 释放记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:23:28
 */
public interface SwReleaseRecordService {

    SwReleaseRecordDO get(String tid);

    List<SwReleaseRecordDO> list(Map<String, Object> map);

    Double getSumByUserIdAndDate(Integer userId, Date beginDate, Date endDate);

    List<SwReleaseRecordDO> getCauseRelease(Integer userId, Integer myRelease);

    int count(Map<String, Object> map);

    int save(SwReleaseRecordDO swReleaseRecord);

    int update(SwReleaseRecordDO swReleaseRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
