package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwPartnerUserDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户持有升币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:21:37
 */
@Mapper
public interface SwPartnerUserDao {

    SwPartnerUserDO get(String tid);

    List<SwPartnerUserDO> list(Map<String, Object> map);

    SwPartnerUserDO getByUserId(@Param("userId") Integer userId, @Param("status") Integer status, @Param("delFlag") String delFlag);

    int count(Map<String, Object> map);

    int save(SwPartnerUserDO swPartnerUser);

    int update(SwPartnerUserDO swPartnerUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
