package com.system.base.service.impl;

import com.system.base.dao.OfficialWebsiteUserDao;
import com.system.base.domain.OfficialWebsiteUserDO;
import com.system.base.service.OfficialWebsiteUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 官网用户登录
 */
@Service
public class OfficialWebsiteUserServiceImpl implements OfficialWebsiteUserService {
    @Autowired
    private OfficialWebsiteUserDao officialWebsiteUserDao;

    @Override
    public OfficialWebsiteUserDO get(Integer id) {
        return officialWebsiteUserDao.get(id);
    }

    @Override
    public List<OfficialWebsiteUserDO> list(Map<String, Object> map) {
        return officialWebsiteUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return officialWebsiteUserDao.count(map);
    }

    @Override
    public int save(OfficialWebsiteUserDO officialWebsiteUser) {
        return officialWebsiteUserDao.save(officialWebsiteUser);
    }

    @Override
    public int update(OfficialWebsiteUserDO officialWebsiteUser) {
        return officialWebsiteUserDao.update(officialWebsiteUser);
    }

    @Override
    public int remove(Integer id) {
        return officialWebsiteUserDao.remove(id);
    }

    @Override
    public int batchRemove(Integer[] ids) {
        return officialWebsiteUserDao.batchRemove(ids);
    }

    @Override
    public OfficialWebsiteUserDO findUserByUsername(String username) {
        return officialWebsiteUserDao.findUserByUsername(username);
    }

}
