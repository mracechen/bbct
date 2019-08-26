package com.get.dao;

import com.get.domain.MailRecordDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 邮箱注册码表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:50:52
 */
@Mapper
public interface MailRecordDao {

    MailRecordDO get(String tid);

    List<MailRecordDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(MailRecordDO mailRecord);

    int update(MailRecordDO mailRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
