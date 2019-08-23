package com.get.service.impl;

import com.get.dao.SwRewardRuleDao;
import com.get.domain.SwRewardRuleDO;
import com.get.domain.SwRuleDetailDO;
import com.get.service.SwRewardRuleService;
import com.get.service.SwRuleDetailService;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class SwRewardRuleServiceImpl implements SwRewardRuleService {
    @Autowired
    private SwRewardRuleDao swRewardRuleDao;

    @Autowired
    private SwRuleDetailService swRuleDetailService;

    @Override
    public SwRewardRuleDO get(String tid) {
        return swRewardRuleDao.get(tid);
    }

    @Override
    public List<SwRewardRuleDO> list(Map<String, Object> map) {
        return swRewardRuleDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swRewardRuleDao.count(map);
    }

    @Override
    public int save(SwRewardRuleDO swRewardRule) {
        return swRewardRuleDao.save(swRewardRule);
    }

    @Override
    public int update(SwRewardRuleDO swRewardRule) {
        return swRewardRuleDao.update(swRewardRule);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(String tid) {
        Map<String,Object> params = new HashMap<>();
        params.put("ruleId",tid);
        List<SwRuleDetailDO> list = swRuleDetailService.list(params);
        for(SwRuleDetailDO swRuleDetailDO:list){
            swRuleDetailService.remove(swRuleDetailDO.getTid());
        }
        SwRewardRuleDO swRewardRule = new SwRewardRuleDO();
        swRewardRule.setDelFlag(CommonStatic.DELETE);
        swRewardRule.setTid(tid);
        return swRewardRuleDao.update(swRewardRule);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
