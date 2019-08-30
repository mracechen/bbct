package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwWalletsDO;
import org.springframework.transaction.annotation.Transactional;

/**
 * 钱包表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:41:45
 */
public interface SwWalletsService {

    SwWalletsDO get(String tid);

    List<SwWalletsDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWalletsDO swWallets);

    int update(SwWalletsDO swWallets);

    int remove(String tid);

    int batchRemove(String[] tids);

    @Transactional(rollbackFor = Exception.class)
    SwWalletsDO createWallet(Integer userID, String coinTypeId);

    SwWalletsDO getWallet(Integer user_id,String coin_id);
}
