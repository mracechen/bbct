package com.get.service;

import java.util.List;
import java.util.Map;
import com.get.domain.SwWithlogDO;
import org.springframework.transaction.annotation.Transactional;

/**
 * 提币记录表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-23 10:10:43
 */
public interface SwWithlogService {

    SwWithlogDO get(String tid);

    SwWithlogDO getByTxid(String txid);

    List<SwWithlogDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwWithlogDO swWithlog);

    int update(SwWithlogDO swWithlog);

    @Transactional(rollbackFor = Exception.class)
    int withlogCompleted(SwWithlogDO swWithlog) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int check(SwWithlogDO swWithlog) throws Exception;

    int remove(String tid);

    void withdraw(Integer userId, String address, Double amount, String coinName) throws Exception;

    int batchRemove(String[] tids);

    List<SwWithlogDO> getByIds(List<String> ids);
}
