package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.InformationDO;

/**
 * 资讯表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-23 19:56:59
 */
public interface InformationService {

    InformationDO get(String tid);

    List<InformationDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(InformationDO information);

    int update(InformationDO information);

    int remove(String tid) throws Exception;

    int batchRemove(String[] tids) throws Exception;
}
