package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwEvangelistUserDO;

/**
 * 用户持有优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:18:09
 */
public interface SwEvangelistUserService {

    SwEvangelistUserDO get(String tid);

    List<SwEvangelistUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwEvangelistUserDO swEvangelistUser) throws Exception;

    int update(SwEvangelistUserDO swEvangelistUser);

    int remove(String tid);

    int batchRemove(String[] tids);

    SwEvangelistUserDO getByUserId(Integer userId, Integer status, String delFlag);
}
