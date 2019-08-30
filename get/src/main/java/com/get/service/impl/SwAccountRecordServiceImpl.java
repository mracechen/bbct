package com.get.service.impl;

import com.get.dao.SwAccountRecordDao;
import com.get.domain.SwAccountRecordDO;
import com.get.service.SwAccountRecordService;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class SwAccountRecordServiceImpl implements SwAccountRecordService {
    @Autowired
    private SwAccountRecordDao swAccountRecordDao;

    @Override
    public SwAccountRecordDO get(String tid) {
        return swAccountRecordDao.get(tid);
    }

    @Override
    public List<SwAccountRecordDO> list(Map<String, Object> map) {
        return swAccountRecordDao.list(map);
    }

    @Override
    public List<SwAccountRecordDO> transferList(Map<String, Object> map) {
        return swAccountRecordDao.transferList(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swAccountRecordDao.count(map);
    }

    @Override
    public int save(SwAccountRecordDO swAccountRecord) {
        return swAccountRecordDao.save(swAccountRecord);
    }

    @Override
    public int update(SwAccountRecordDO swAccountRecord) {
        return swAccountRecordDao.update(swAccountRecord);
    }

    @Override
    public int remove(String tid) {
        SwAccountRecordDO swAccountRecord = new SwAccountRecordDO();
        swAccountRecord.setDelFlag(CommonStatic.DELETE);
        swAccountRecord.setTid(tid);
        return swAccountRecordDao.update(swAccountRecord);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

}
