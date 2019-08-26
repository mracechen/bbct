package com.get.service.impl;

import com.common.utils.MyMD5Utils;
import com.common.utils.Result;
import com.get.domain.SwCoinTypeDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwCoinTypeService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

import com.get.dao.SwUserBasicDao;
import com.get.domain.SwUserBasicDO;
import com.get.service.SwUserBasicService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwUserBasicServiceImpl implements SwUserBasicService {
    @Autowired
    private SwUserBasicDao swUserBasicDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwCoinTypeService swCoinTypeService;

    @Override
    public SwUserBasicDO get(Integer tid) {
        return swUserBasicDao.get(tid);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Object userReg(SwUserBasicDO userBasicDO) {

        userBasicDO.setLoginPass(MyMD5Utils.encodingAdmin(userBasicDO.getLoginPass()));
        userBasicDO.setCreateDate(new Date());
        userBasicDO.setUpdateDate(new Date());
        userBasicDO.setDelFlag(CommonStatic.NOTDELETE);
        save(userBasicDO);

        Map<String, Object> queryParam = new HashMap<>();
        queryParam.put("email", userBasicDO.getEmail());
        List<SwUserBasicDO> list = swUserBasicDao.list(queryParam);

        SwUserBasicDO user = list.get(0);


        //取出数据库所有币种，每个币种均给他创建一个钱包
        queryParam.clear();
        queryParam.put("delFlag", CommonStatic.NOTDELETE);
        queryParam.put("enable", "0");
        Map<String, String> coinTypeResult = new HashMap<>();
        List<SwCoinTypeDO> list1 = swCoinTypeService.list(queryParam);
        for (SwCoinTypeDO swCoinTypeDO : list1) {
            coinTypeResult.put(swCoinTypeDO.getTid(), swCoinTypeDO.getCoinName());
        }
        Iterator<Map.Entry<String, String>> iterator = coinTypeResult.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry entry = iterator.next();
            Object objKey = entry.getKey();
            if(objKey != null){
                Object objValue = entry.getValue();
                String coinTypeId = objKey.toString();
                if(objValue != null){
                    SwWalletsDO nonemWall = swWalletsService.createWallet(userBasicDO.getTid(),coinTypeId);
                    swWalletsService.save(nonemWall);
                }
            }
        }
        //TODO 调用区块链接口，将UserID传过去

        user.setUsername("sz" + user.getTid());
        swUserBasicDao.update(user);
        return Result.ok();
    }

    @Override
    public List<SwUserBasicDO> list(Map<String, Object> map) {
        return swUserBasicDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swUserBasicDao.count(map);
    }

    @Override
    public int save(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.save(swUserBasic);
    }

    @Override
    public int update(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int remove(Integer tid) {
        SwUserBasicDO swUserBasic = new SwUserBasicDO();
        swUserBasic.setDelFlag(CommonStatic.DELETE);
        swUserBasic.setTid(tid);
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int batchRemove(Integer[]tids) {
        int count = 0;
        for(Integer ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
