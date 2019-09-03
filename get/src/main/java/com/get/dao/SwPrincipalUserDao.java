package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwPrincipalUserDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户持有固币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:28:52
 */
@Mapper
public interface SwPrincipalUserDao {

    SwPrincipalUserDO get(String tid);

    List<SwPrincipalUserDO> list(Map<String, Object> map);

    SwPrincipalUserDO getByUserId(@Param("userId") Integer userId, @Param("status") Integer status, @Param("delFlag") String delFlag);

    int count(Map<String, Object> map);

    int save(SwPrincipalUserDO swPrincipalUser);

    int update(SwPrincipalUserDO swPrincipalUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
