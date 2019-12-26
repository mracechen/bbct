package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.get.dao.InformationDao;
import com.get.domain.InformationDO;
import com.get.service.InformationService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    private InformationDao informationDao;

    @Override
    public InformationDO get(String tid) {
        return informationDao.get(tid);
    }

    @Override
    public List<InformationDO> list(Map<String, Object> map) {
        return informationDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return informationDao.count(map);
    }

    @Override
    public int save(InformationDO information) {
        return informationDao.save(information);
    }

    @Override
    public int update(InformationDO information) {
        return informationDao.update(information);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(String tid) throws Exception{
        Map<String,Object> params = new HashMap<>();
        params.put("delFlag",CommonStatic.NOTDELETE);
        params.put("ex1",tid);
        List<InformationDO> list = this.list(params);
        for (InformationDO informationDO : list) {
            informationDO.setDelFlag(CommonStatic.DELETE);
            int update = informationDao.update(informationDO);
            if(update <= 0){
                throw new Exception();
            }
        }
        InformationDO information = new InformationDO();
        information.setDelFlag(CommonStatic.DELETE);
        information.setTid(tid);
        return informationDao.update(information);
    }

    @Override
    public int batchRemove(String[]tids)  throws Exception{
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
