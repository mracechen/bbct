package com.system.base.service;

import com.system.base.domain.OfficialWebsiteUserDO;

import java.util.List;
import java.util.Map;

/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-17 14:29:57
 */
public interface OfficialWebsiteUserService {

    OfficialWebsiteUserDO get(Integer id);

    List<OfficialWebsiteUserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(OfficialWebsiteUserDO officialWebsiteUser);

    int update(OfficialWebsiteUserDO officialWebsiteUser);

    int remove(Integer id);

    int batchRemove(Integer[] ids);

    OfficialWebsiteUserDO findUserByUsername(String username);
}
