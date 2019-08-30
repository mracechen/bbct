package com.get.dao;

import com.get.domain.SwAccountRecordDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 账户记录表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:53:13
 */
@Mapper
public interface SwAccountRecordDao {

    SwAccountRecordDO get(String tid);

    List<SwAccountRecordDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwAccountRecordDO swAccountRecord);

    int update(SwAccountRecordDO swAccountRecord);

    int remove(String tid);

    int batchRemove(String[] tids);

    List<SwAccountRecordDO> transferList(Map<String, Object> map);

    List<String> getType(@Param("userId") String userId);

    Double getPerformance(@Param("userId") String userId, @Param("type") String type);
}
