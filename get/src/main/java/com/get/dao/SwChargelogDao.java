package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwChargelogDO;

/**
 * 充币记录表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:20:59
 */
@Mapper
public interface SwChargelogDao {

    SwChargelogDO get(String tid);

    SwChargelogDO getByTxid(String txid);

    List<SwChargelogDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwChargelogDO swChargelog);

    int update(SwChargelogDO swChargelog);

    int remove(String tid);

    int batchRemove(String[] tids);
}
