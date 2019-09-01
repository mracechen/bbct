package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.QuartzDO;

/**
 * 定时任务表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-31 17:33:23
 */
@Mapper
public interface QuartzDao {

    QuartzDO get(String tid);

    List<QuartzDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(QuartzDO quartz);

    int update(QuartzDO quartz);

    int remove(String tid);

    int batchRemove(String[] tids);
}
