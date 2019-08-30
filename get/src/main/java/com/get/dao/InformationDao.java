package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.InformationDO;

/**
 * 资讯表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-28 19:10:02
 */
@Mapper
public interface InformationDao {

    InformationDO get(String tid);

    List<InformationDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(InformationDO information);

    int update(InformationDO information);

    int remove(String tid);

    int batchRemove(String[] tids);
}
