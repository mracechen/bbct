package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwWithlogDO;

/**
 * 提币记录表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */
@Mapper
public interface SwWithlogDao {

    SwWithlogDO get(String tid);

    SwWithlogDO getByTxid(String txid);

    List<SwWithlogDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWithlogDO swWithlog);

    int update(SwWithlogDO swWithlog);

    int remove(String tid);

    int batchRemove(String[] tids);
}
