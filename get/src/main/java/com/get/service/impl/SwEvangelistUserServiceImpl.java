package com.get.service.impl;

import com.common.utils.i18n.Languagei18nUtils;
import com.get.domain.SwAccountRecordDO;
import com.get.domain.SwEvangelistDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwEvangelistService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.RecordEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwEvangelistUserDao;
import com.get.domain.SwEvangelistUserDO;
import com.get.service.SwEvangelistUserService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwEvangelistUserServiceImpl implements SwEvangelistUserService {
    @Autowired
    private SwEvangelistUserDao swEvangelistUserDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwEvangelistService swEvangelistService;

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Override
    public SwEvangelistUserDO get(String tid) {
        return swEvangelistUserDao.get(tid);
    }

    @Override
    public List<SwEvangelistUserDO> list(Map<String, Object> map) {
        return swEvangelistUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swEvangelistUserDao.count(map);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save(SwEvangelistUserDO swEvangelistUser) throws Exception {
        SwEvangelistDO swEvangelistDO = swEvangelistService.get(swEvangelistUser.getEvangelistId());
        if(swEvangelistDO == null){
            throw new Exception("优币金异常");
        }
        SwWalletsDO wallet = swWalletsService.getWallet(swEvangelistUser.getUserId(), swEvangelistDO.getCoinTypeId());
        if(wallet == null){
            throw new Exception("钱包异常");
        }
        BigDecimal currency = wallet.getCurrency();
        wallet.setCurrency(new BigDecimal("0").subtract(new BigDecimal(String.valueOf(swEvangelistDO.getEvangelistNum()))));
        wallet.setUpdateDate(new Date());
        swWalletsService.update(wallet);
        swAccountRecordService.save(SwAccountRecordDO.create(
                swEvangelistUser.getUserId(),
                RecordEnum.purchasing.getType(),
                languagei18nUtils.getMessage("SwEvangelistUserServiceImpl.save.purchasing.evangelist"),
                swEvangelistDO.getCoinTypeId(),
                -swEvangelistDO.getEvangelistNum(),
                currency.doubleValue() - swEvangelistDO.getEvangelistNum()
        ));
        return swEvangelistUserDao.save(swEvangelistUser);
    }

    @Override
    public int update(SwEvangelistUserDO swEvangelistUser) {
        return swEvangelistUserDao.update(swEvangelistUser);
    }

    @Override
    public int remove(String tid) {
        SwEvangelistUserDO swEvangelistUser = new SwEvangelistUserDO();
        swEvangelistUser.setDelFlag(CommonStatic.DELETE);
        swEvangelistUser.setTid(tid);
        return swEvangelistUserDao.update(swEvangelistUser);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

    @Override
    public SwEvangelistUserDO getByUserId(Integer userId, Integer status, String delFlag) {
        return swEvangelistUserDao.getByUserId(userId,status,delFlag);
    }

}
