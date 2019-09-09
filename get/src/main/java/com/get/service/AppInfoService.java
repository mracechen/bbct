package com.get.service;


import com.evowallet.common.ServerResponse;
import com.get.domain.AppInfo;
import com.yunpian.sdk.model.Result;

import java.util.List;
import java.util.Map;

/**
 * app更新记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-04-09 16:12:52
 */
public interface AppInfoService {

    AppInfo get(Integer id);

    List<AppInfo> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(AppInfo appInfo);

    int update(AppInfo appInfo);

    int remove(Integer id);

    int batchRemove(Integer[] ids);

    List<AppInfo> getAppInfo();
}
