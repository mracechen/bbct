package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.QuartzDao;
import com.get.domain.QuartzDO;
import com.get.service.QuartzService;


@Service
public class QuartzServiceImpl implements QuartzService {
    @Autowired
    private QuartzDao quartzDao;

    @Override
    public QuartzDO get(String tid) {
        return quartzDao.get(tid);
    }

    @Override
    public List<QuartzDO> list(Map<String, Object> map) {
        return quartzDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return quartzDao.count(map);
    }

    @Override
    public int save(QuartzDO quartz) {
        return quartzDao.save(quartz);
    }

    @Override
    public int update(QuartzDO quartz) {
        return quartzDao.update(quartz);
    }

    @Override
    public int remove(String tid) {
        QuartzDO quartz = new QuartzDO();
        quartz.setDelFlag(CommonStatic.DELETE);
        quartz.setTid(tid);
        return quartzDao.update(quartz);
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
