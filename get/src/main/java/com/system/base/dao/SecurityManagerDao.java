package com.system.base.dao;

import com.system.base.domain.SecurityManagerDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-10-16 18:51:21
 */
@Mapper
public interface SecurityManagerDao {

    SecurityManagerDO get(String tid);

    List<SecurityManagerDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SecurityManagerDO securityManager);

    int update(SecurityManagerDO securityManager);

    int remove(String tid);

    int batchRemove(String[] tids);
}
