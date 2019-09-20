package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwTransferRecordDO;

/**
 * 转账记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:28:18
 */
public interface SwTransferRecordService {

    SwTransferRecordDO get(String tid);

    List<SwTransferRecordDO> list(Map<String, Object> map);

    List<SwTransferRecordDO> transferRecord(Integer userId, String beginDate, String endDate);

    int count(Map<String, Object> map);

    int save(SwTransferRecordDO swTransferRecord);

    int update(SwTransferRecordDO swTransferRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
