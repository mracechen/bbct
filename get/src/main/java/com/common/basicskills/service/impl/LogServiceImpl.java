package com.common.basicskills.service.impl;

import com.common.basicskills.dao.LogDao;
import com.common.basicskills.domain.LogDO;
import com.common.basicskills.domain.PageDO;
import com.common.basicskills.service.LogService;
import com.get.statuc.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    LogDao logMapper;

    @Async
    @Override
    public void save(LogDO logDO) {
        logMapper.save(logDO);
    }

    @Override
    public PageDO<LogDO> queryList(Query query) {
        int total = logMapper.count(query);
        List<LogDO> logs = logMapper.list(query);
        PageDO<LogDO> page = new PageDO<>();
        page.setTotal(total);
        page.setRows(logs);
        return page;
    }

    @Override
    public int remove(Long id) {
        int count = logMapper.remove(id);
        return count;
    }

    @Override
    public int batchRemove(Long[] ids) {
        return logMapper.batchRemove(ids);
    }

    @Override
    public int removeLTDate(Map<String, Object> queryParam) {
        return logMapper.removeLTDate(queryParam);
    }
}
