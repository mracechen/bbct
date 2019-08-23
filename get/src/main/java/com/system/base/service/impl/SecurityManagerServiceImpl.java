package com.system.base.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.get.statuc.CommonStatic;
import com.common.utils.IDUtils;
import com.system.base.dao.SecurityManagerDao;
import com.system.base.domain.SecurityManagerDO;
import com.system.base.service.SecurityManagerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


@Service
@Slf4j
public class SecurityManagerServiceImpl implements SecurityManagerService {

    public static String securityKey = "123";

    @Value("${configs.trading.url}")
    String url = null;
    @Autowired
    private SecurityManagerDao securityManagerDao;

    @Override
    public SecurityManagerDO get(String tid) {
        return securityManagerDao.get(tid);
    }

    @Override
    public List<SecurityManagerDO> list(Map<String, Object> map) {
        return securityManagerDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return securityManagerDao.count(map);
    }

    @Override
    public int save(SecurityManagerDO securityManager) {
        Map<String, Object> param = new LinkedHashMap<>();
        param.put("key", securityManager.getSecurityKey());
        JSONObject json = new JSONObject(param);
        json.put("securityKey", securityKey);
        log.info("请求地址为："+url);
       try {
           securityManager.setTid(IDUtils.randomStr());
           securityManager.setCreateDate(new Date());
           securityManager.setDelFlag(CommonStatic.NOTDELETE);
           SecurityManagerServiceImpl.securityKey = securityManager.getSecurityKey();

           return securityManagerDao.save(securityManager);
       }catch (Exception e){
           e.printStackTrace();
           log.info("安全key保存错误");
           return 0;
       }
    }

    @Override
    public int update(SecurityManagerDO securityManager) {
        return securityManagerDao.update(securityManager);
    }

    @Override
    public int remove(String tid) {
        return securityManagerDao.remove(tid);
    }

    @Override
    public int batchRemove(String[] tids) {
        return securityManagerDao.batchRemove(tids);
    }

}
