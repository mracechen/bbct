package com.get.service;

import com.get.domain.SwRewardRuleDO;

import java.util.List;
import java.util.Map;

/**
 * 推荐人奖励规则表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:49:08
 */
public interface SwRewardRuleService {

    SwRewardRuleDO get(String tid);

    List<SwRewardRuleDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwRewardRuleDO swRewardRule);

    int update(SwRewardRuleDO swRewardRule);

    int remove(String tid);

    int batchRemove(String[] tids);
}
