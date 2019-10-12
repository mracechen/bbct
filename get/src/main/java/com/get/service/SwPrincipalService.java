package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPrincipalDO;

/**
 * 固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:27:04
 */
public interface  SwPrincipalService {

    SwPrincipalDO get(String tid);

    List<SwPrincipalDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPrincipalDO swPrincipal);

    int update(SwPrincipalDO swPrincipal);

    int remove(String tid);

    int batchRemove(String[] tids);
}
