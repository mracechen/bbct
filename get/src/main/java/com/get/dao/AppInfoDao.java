package com.get.dao;


import com.get.domain.AppInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AppInfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AppInfo record);

    int insertSelective(AppInfo record);

    AppInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppInfo record);

    int updateByPrimaryKey(AppInfo record);

    List<AppInfo> selectAppInfo();


    AppInfo get(Integer id);

    List<AppInfo> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(AppInfo appInfo);

    int update(AppInfo appInfo);

    int remove(Integer id);

    int batchRemove(Integer[] ids);
}