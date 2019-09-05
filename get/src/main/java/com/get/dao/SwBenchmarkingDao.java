package com.get.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.get.domain.SwBenchmarkingDO;

/**
 * 对标项目表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-05 15:56:30
 */
@Mapper
public interface SwBenchmarkingDao {

    SwBenchmarkingDO get(String tid);

    List<SwBenchmarkingDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwBenchmarkingDO swBenchmarking);

    int update(SwBenchmarkingDO swBenchmarking);

    int remove(String tid);

    int batchRemove(String[] tids);
}
