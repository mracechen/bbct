package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwWithdrawAddressDao;
import com.get.domain.SwWithdrawAddressDO;
import com.get.service.SwWithdrawAddressService;


@Service
public class SwWithdrawAddressServiceImpl implements SwWithdrawAddressService {
    @Autowired
    private SwWithdrawAddressDao swWithdrawAddressDao;

    @Override
    public SwWithdrawAddressDO get(String tid) {
        return swWithdrawAddressDao.get(tid);
    }

    @Override
    public List<SwWithdrawAddressDO> list(Map<String, Object> map) {
        return swWithdrawAddressDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swWithdrawAddressDao.count(map);
    }

    @Override
    public int save(SwWithdrawAddressDO swWithdrawAddress) {
        return swWithdrawAddressDao.save(swWithdrawAddress);
    }

    @Override
    public int update(SwWithdrawAddressDO swWithdrawAddress) {
        return swWithdrawAddressDao.update(swWithdrawAddress);
    }

    @Override
    public int remove(String tid) {
        SwWithdrawAddressDO swWithdrawAddress = new SwWithdrawAddressDO();
        swWithdrawAddress.setDelFlag(CommonStatic.DELETE);
        swWithdrawAddress.setTid(tid);
        return swWithdrawAddressDao.update(swWithdrawAddress);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
