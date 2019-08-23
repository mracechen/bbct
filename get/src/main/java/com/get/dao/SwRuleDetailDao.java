package com.get.dao;

import com.get.domain.SwRuleDetailDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 推荐人奖励规则详情表
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:46:50
 */
@Mapper
public interface SwRuleDetailDao {

    SwRuleDetailDO get(String tid);

    List<SwRuleDetailDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwRuleDetailDO swRuleDetail);

    int update(SwRuleDetailDO swRuleDetail);

    int remove(String tid);

    int batchRemove(String[] tids);

    List<SwRuleDetailDO> getByRuleCode(String code);
}
