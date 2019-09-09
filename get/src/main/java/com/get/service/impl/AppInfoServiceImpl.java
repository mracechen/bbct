package com.get.service.impl;


import com.evowallet.common.ServerResponse;
import com.get.dao.AppInfoDao;
import com.get.domain.AppInfo;
import com.get.service.AppInfoService;
import com.yunpian.sdk.model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    private AppInfoDao appInfoDao;

    @Override
    public AppInfo get(Integer id) {
        return appInfoDao.get(id);
    }

    @Override
    public List<AppInfo> list(Map<String, Object> map) {
        return appInfoDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return appInfoDao.count(map);
    }

    @Override
    public int save(AppInfo appInfo) {
        return appInfoDao.save(appInfo);
    }

    @Override
    public int update(AppInfo appInfo) {
        return appInfoDao.update(appInfo);
    }

    @Override
    public int remove(Integer id) {
        AppInfo appInfo = new AppInfo();
//        appInfo.setDelFlag(CommonStatic.DELETE);
//        appInfo.setTid(id);
        return appInfoDao.deleteByPrimaryKey(id);
    }

    @Override
    public int batchRemove(Integer[]ids) {
        int count = 0;
        for(Integer ids1 : ids){
            count = count + remove(ids1);
        }
        return count;
    }

    @Override
    public List<AppInfo> getAppInfo() {
        List<AppInfo> appInfos = appInfoDao.selectAppInfo();
        return appInfos;
    }

}
