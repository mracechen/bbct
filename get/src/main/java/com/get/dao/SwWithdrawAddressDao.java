package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwWithdrawAddressDO;

/**
 * 提现地址
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 20:33:36
 */
@Mapper
public interface SwWithdrawAddressDao {

    SwWithdrawAddressDO get(String tid);

    List<SwWithdrawAddressDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWithdrawAddressDO swWithdrawAddress);

    int update(SwWithdrawAddressDO swWithdrawAddress);

    int remove(String tid);

    int batchRemove(String[] tids);
}
