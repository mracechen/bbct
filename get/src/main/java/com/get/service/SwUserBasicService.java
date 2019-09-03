package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwUserBasicDO;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户基本表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:39:28
 */
public interface SwUserBasicService {

    SwUserBasicDO get(Integer tid);

    SwUserBasicDO getByEmail(String email);

    List<Integer> getByIds(List<Integer> ids);

    SwUserBasicDO get(SwUserBasicDO swUserBasic);

    List<SwUserBasicDO> findRecommenders(Integer userId, Integer generate);

    Boolean checkTradingPassword(Integer userId, String email, String sPassword);

    @Transactional(rollbackFor = Exception.class)
    Object userReg(SwUserBasicDO userBasicDO);

    List<SwUserBasicDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwUserBasicDO swUserBasic);

    int update(SwUserBasicDO swUserBasic);

    int remove(Integer tid);

    int batchRemove(Integer[] tids);
}
