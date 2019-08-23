package com.system.sysconfig.dao;

import com.system.sysconfig.domain.ConfigDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 配置表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-06 11:20:36
 */
@Mapper
public interface ConfigDao {

    ConfigDO get(String tid);

    List<ConfigDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(ConfigDO config);

    int update(ConfigDO config);

    int remove(String tid);

    int batchRemove(String[] tids);
}
