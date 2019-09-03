package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwEvangelistUserDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户持有优币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:18:09
 */
@Mapper
public interface SwEvangelistUserDao {

    SwEvangelistUserDO get(String tid);

    List<SwEvangelistUserDO> list(Map<String, Object> map);

    SwEvangelistUserDO getByUserId(@Param("userId") Integer userId, @Param("status") Integer status, @Param("delFlag") String delFlag);

    int count(Map<String, Object> map);

    int save(SwEvangelistUserDO swEvangelistUser);

    int update(SwEvangelistUserDO swEvangelistUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
