package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwPrincipalUserDO;

/**
 * 用户持有固币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:28:52
 */
public interface SwPrincipalUserService {

    SwPrincipalUserDO get(String tid);

    List<SwPrincipalUserDO> getByUserId(Integer userId, Integer status, String delFlag);

    List<SwPrincipalUserDO> getWaitingResolvePrincipal();

    List<SwPrincipalUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwPrincipalUserDO swPrincipalUser) throws Exception;

    int update(SwPrincipalUserDO swPrincipalUser);

    int remove(String tid);

    int batchRemove(String[] tids);
}
