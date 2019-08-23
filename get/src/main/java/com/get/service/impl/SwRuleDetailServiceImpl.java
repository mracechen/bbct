package com.get.service.impl;

import com.get.dao.SwRuleDetailDao;
import com.get.domain.SwRuleDetailDO;
import com.get.service.SwRuleDetailService;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class SwRuleDetailServiceImpl implements SwRuleDetailService {
    @Autowired
    private SwRuleDetailDao swRuleDetailDao;

    @Override
    public SwRuleDetailDO get(String tid) {
        return swRuleDetailDao.get(tid);
    }

    @Override
    public List<SwRuleDetailDO> list(Map<String, Object> map) {
        return swRuleDetailDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swRuleDetailDao.count(map);
    }

    @Override
    public int save(SwRuleDetailDO swRuleDetail) {
        return swRuleDetailDao.save(swRuleDetail);
    }

    @Override
    public int update(SwRuleDetailDO swRuleDetail) {
        return swRuleDetailDao.update(swRuleDetail);
    }

    @Override
    public int remove(String tid) {
        SwRuleDetailDO swRuleDetail = new SwRuleDetailDO();
        swRuleDetail.setDelFlag(CommonStatic.DELETE);
        swRuleDetail.setTid(tid);
        return swRuleDetailDao.update(swRuleDetail);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

    @Override
    public List<SwRuleDetailDO> getByRuleCode(String code) {
        return swRuleDetailDao.getByRuleCode(code);
    }

}
