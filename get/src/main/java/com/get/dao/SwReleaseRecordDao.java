package com.get.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwReleaseRecordDO;
import org.apache.ibatis.annotations.Param;

/**
 * 释放记录表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:23:28
 */
@Mapper
public interface SwReleaseRecordDao {

    SwReleaseRecordDO get(String tid);

    Double getSumByUserIdAndDate(@Param("userId") Integer userId, @Param("beginDate") Date beginDate, @Param("endDate") Date endDate);

    List<SwReleaseRecordDO> list(Map<String, Object> map);

    List<SwReleaseRecordDO> getCauseRelease(@Param("userId") Integer userId, @Param("myRelease") Integer myRelease);

    int count(Map<String, Object> map);

    int save(SwReleaseRecordDO swReleaseRecord);

    int update(SwReleaseRecordDO swReleaseRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
