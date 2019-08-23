package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwCurrentDO;

/**
 * 活币金表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:07:19
 */
@Mapper
public interface SwCurrentDao {

    SwCurrentDO get(String tid);

    List<SwCurrentDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwCurrentDO swCurrent);

    int update(SwCurrentDO swCurrent);

    int remove(String tid);

    int batchRemove(String[] tids);
}
