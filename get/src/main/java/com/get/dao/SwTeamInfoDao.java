package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwTeamInfoDO;

/**
 * 社群表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-09 20:25:15
 */
@Mapper
public interface SwTeamInfoDao {

    SwTeamInfoDO get(String tid);

    List<SwTeamInfoDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwTeamInfoDO swTeamInfo);

    int update(SwTeamInfoDO swTeamInfo);

    int remove(String tid);

    int batchRemove(String[] tids);
}
