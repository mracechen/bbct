package com.get.service;

import com.evowallet.common.ServerResponse;
import com.get.domain.SwConsumeLogDO;
import com.get.domain.SwUserBasicDO;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 消费记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-01 16:56:29
 */
public interface SwConsumeLogService {

    SwConsumeLogDO get(String tid);

    List<SwConsumeLogDO> list(Map<String, Object> map);

    List<SwConsumeLogDO> checkDrawCondition(Date beginDate, Date endDate, Integer payUser);

    List<SwConsumeLogDO> list1(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwConsumeLogDO swConsumeLog);

    int update(SwConsumeLogDO swConsumeLog);

    int remove(String tid);

    int batchRemove(String[] tids);

    String transfer(SwUserBasicDO user, Integer userId, double amount, String coinId, String remark, String tradingPassword);

    List<SwConsumeLogDO> getConsumeRecord(Map<String, Object> map);

    SwConsumeLogDO getConsumeRecordDetail(String consumeId);
}
