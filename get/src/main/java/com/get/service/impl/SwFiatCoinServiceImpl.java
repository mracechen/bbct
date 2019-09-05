package com.get.service.impl;

import com.evowallet.common.ServerResponse;
import com.evowallet.utils.ResponseCode;
import com.get.dao.SwCoinTypeDao;
import com.get.dao.SwFiatCoinDao;
import com.get.domain.SwCoinTypeDO;
import com.get.domain.SwFiatCoinDO;
import com.get.service.SwFiatCoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class SwFiatCoinServiceImpl implements SwFiatCoinService {
    @Autowired
    private SwFiatCoinDao swFiatCoinDao;

    @Autowired
    private SwCoinTypeDao mSwCoinTypeDao;

    @Override
    public SwFiatCoinDO get(Integer id) {
        return swFiatCoinDao.get(id);
    }

    @Override
    public List<SwFiatCoinDO> list(Map<String, Object> map) {
        return swFiatCoinDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swFiatCoinDao.count(map);
    }

    @Override
    public int save(SwFiatCoinDO swFiatCoin) {
        return swFiatCoinDao.save(swFiatCoin);
    }

    @Override
    public int update(SwFiatCoinDO swFiatCoin) {
        return swFiatCoinDao.update(swFiatCoin);
    }

    @Override
    public int remove(Integer id) {
        return swFiatCoinDao.remove(id);
    }

    @Override
    public int batchRemove(Integer[]ids) {
        int count = 0;
        for(Integer id : ids){
            count = count + remove(id);
        }
        return count;
    }

    @Override
    public ServerResponse<List<SwFiatCoinDO>> getOtcFiatCoinTypeAndPrice(String coin_id) {

        SwCoinTypeDO swCoinTypeDO = mSwCoinTypeDao.get(coin_id);
        if (swCoinTypeDO == null){
            return  ServerResponse.createByError("虚拟货币不存在");
        }
        List<SwFiatCoinDO> fiatCoins = swFiatCoinDao.selectByCoinId(coin_id,(byte)1);
        return  ServerResponse.createBySuccess(ResponseCode.SUCCESS.getDesc(),fiatCoins);
    }

    @Override
    public List<SwFiatCoinDO> getCountryOfShow(byte isShow) {
        return swFiatCoinDao.selectByShow(isShow);
    }

}
