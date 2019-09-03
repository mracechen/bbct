package com.get.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwCurrentUserDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户持有活币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:12:24
 */
@Mapper
public interface SwCurrentUserDao {

    SwCurrentUserDO get(String tid);

    List<SwCurrentUserDO> list(Map<String, Object> map);

    List<SwCurrentUserDO> getWaitingResolveCurrent(@Param("beginDate") Date beginDate, @Param("endDate") Date endDate);

    int count(Map<String, Object> map);

    int save(SwCurrentUserDO swCurrentUser);

    int update(SwCurrentUserDO swCurrentUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
