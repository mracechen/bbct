package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwCoinTypeDO;

/**
 * 平台币种表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:01:32
 */
@Mapper
public interface SwCoinTypeDao {

    SwCoinTypeDO get(String tid);

    SwCoinTypeDO getByCoinName(String coinName);

    List<SwCoinTypeDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwCoinTypeDO swCoinType);

    int update(SwCoinTypeDO swCoinType);

    int remove(String tid);

    int batchRemove(String[] tids);
}
