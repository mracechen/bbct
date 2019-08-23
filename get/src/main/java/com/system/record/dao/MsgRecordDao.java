package com.system.record.dao;

import com.system.record.domain.MsgRecordDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


/**
 * 发送短信记录表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-23 15:01:42
 */
@Mapper
public interface MsgRecordDao {

    MsgRecordDO get(String tid);

    List<MsgRecordDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(MsgRecordDO msgRecord);

    int update(MsgRecordDO msgRecord);

    int remove(String tid);

    int batchRemove(String[] tids);
}
