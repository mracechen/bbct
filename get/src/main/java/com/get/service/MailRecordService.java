package com.get.service;

import com.get.domain.MailRecordDO;

import java.util.List;
import java.util.Map;

/**
 * 邮箱注册码表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:50:52
 */
public interface MailRecordService {

    MailRecordDO get(String tid);

    List<MailRecordDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(MailRecordDO mailRecord);

    int update(MailRecordDO mailRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
