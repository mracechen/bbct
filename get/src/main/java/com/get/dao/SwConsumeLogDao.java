package com.get.dao;

import com.get.domain.SwConsumeLogDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 消费记录表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-05 15:45:41
 */
@Mapper
public interface SwConsumeLogDao {

    SwConsumeLogDO get(String tid);

    List<SwConsumeLogDO> list(Map<String, Object> map);

    List<SwConsumeLogDO> checkDrawCondition(@Param("beginDate") Date beginDate, @Param("endDate") Date endDate, @Param("payUser") Integer payUser);

    List<SwConsumeLogDO> list1(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwConsumeLogDO swConsumeLog);

    int update(SwConsumeLogDO swConsumeLog);

    int remove(String tid);

    int batchRemove(String[] tids);

    List<SwConsumeLogDO> getConsumeRecord(Map<String, Object> map);

    SwConsumeLogDO getConsumeRecordDetail(@Param("consumeId") String consumeId);
}
