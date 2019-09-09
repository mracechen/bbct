package com.get.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwCurrentUserDO;

/**
 * 用户持有活币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:12:24
 */
public interface SwCurrentUserService {

    SwCurrentUserDO get(String tid);

    List<SwCurrentUserDO> getWaitingResolveCurrent(Date beginDate, Date endDate);

    List<SwCurrentUserDO> getByUserId(Integer userId, Integer status, String delFlag);

    List<SwCurrentUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwCurrentUserDO swCurrentUser) throws Exception;

    int update(SwCurrentUserDO swCurrentUser);

    int cancel(SwCurrentUserDO swCurrentUser) throws Exception;

    int remove(String tid);

    int batchRemove(String[] tids);
}
