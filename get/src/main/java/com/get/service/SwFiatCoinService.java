package com.get.service;

import com.evowallet.common.ServerResponse;
import com.get.domain.SwFiatCoinDO;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:54:01
 */
public interface SwFiatCoinService {

    SwFiatCoinDO get(Integer id);

    List<SwFiatCoinDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwFiatCoinDO swFiatCoin);

    int update(SwFiatCoinDO swFiatCoin);

    int remove(Integer id);

    int batchRemove(Integer[] ids);

    ServerResponse<List<SwFiatCoinDO>> getOtcFiatCoinTypeAndPrice(String coin_id);

    List<SwFiatCoinDO> getCountryOfShow(byte isShow);
}
