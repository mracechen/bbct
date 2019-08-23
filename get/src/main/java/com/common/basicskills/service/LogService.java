package com.common.basicskills.service;

import com.common.basicskills.domain.LogDO;
import com.common.basicskills.domain.PageDO;
import com.get.statuc.Query;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface LogService {
    void save(LogDO logDO);

    PageDO<LogDO> queryList(Query query);

    int remove(Long id);

    int batchRemove(Long[] ids);

    int removeLTDate(Map<String,Object> queryParam);
}
