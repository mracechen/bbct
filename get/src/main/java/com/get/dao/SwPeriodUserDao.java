package com.get.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwPeriodUserDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户持有定币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:25:02
 */
@Mapper
public interface SwPeriodUserDao {

    SwPeriodUserDO get(String tid);

    List<SwPeriodUserDO> list(Map<String, Object> map);

    List<SwPeriodUserDO> getWaitingResolvePeriod(@Param("beginDate") Date beginDate, @Param("endDate") Date endDate);

    List<SwPeriodUserDO> getByUserId(@Param("userId") Integer userId, @Param("status") Integer status, @Param("delFlag") String delFlag);

    int count(Map<String, Object> map);

    int save(SwPeriodUserDO swPeriodUser);

    int update(SwPeriodUserDO swPeriodUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
