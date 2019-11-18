package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwUserBasicDO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户基本表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:39:28
 */
@Mapper
public interface SwUserBasicDao {

    SwUserBasicDO get(Integer tid);

    List<Integer> getByIds(@Param("ids") List<Integer> ids);

    List<Integer> getChildrenByIds(@Param("ids") List<Integer> ids);

    SwUserBasicDO getByEmail(String email);

    SwUserBasicDO getByUserBasic(SwUserBasicDO swUserBasic);

    List<SwUserBasicDO> findRecommenders(@Param("userId") Integer userId, @Param("generate") Integer generate);

    List<SwUserBasicDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwUserBasicDO swUserBasic);

    int update(SwUserBasicDO swUserBasic);

    int remove(Integer tid);

    int batchRemove(Integer[] tids);

    List<SwUserBasicDO> getByRecomId(Integer recomId);
}
