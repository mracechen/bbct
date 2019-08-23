package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwWalletsDO;

/**
 * 钱包表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:41:45
 */
@Mapper
public interface SwWalletsDao {

    SwWalletsDO get(String tid);

    List<SwWalletsDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWalletsDO swWallets);

    int update(SwWalletsDO swWallets);

    int remove(String tid);

    int batchRemove(String[] tids);
}
