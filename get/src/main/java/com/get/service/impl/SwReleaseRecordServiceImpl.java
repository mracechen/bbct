package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwReleaseRecordDao;
import com.get.domain.SwReleaseRecordDO;
import com.get.service.SwReleaseRecordService;


@Service
public class SwReleaseRecordServiceImpl implements SwReleaseRecordService {
    @Autowired
    private SwReleaseRecordDao swReleaseRecordDao;

    @Override
    public SwReleaseRecordDO get(String tid) {
        return swReleaseRecordDao.get(tid);
    }

    @Override
    public List<SwReleaseRecordDO> list(Map<String, Object> map) {
        return swReleaseRecordDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swReleaseRecordDao.count(map);
    }

    @Override
    public int save(SwReleaseRecordDO swReleaseRecord) {
        return swReleaseRecordDao.save(swReleaseRecord);
    }

    @Override
    public int update(SwReleaseRecordDO swReleaseRecord) {
        return swReleaseRecordDao.update(swReleaseRecord);
    }

    @Override
    public int remove(String tid) {
        SwReleaseRecordDO swReleaseRecord = new SwReleaseRecordDO();
        swReleaseRecord.setDelFlag(CommonStatic.DELETE);
        swReleaseRecord.setTid(tid);
        return swReleaseRecordDao.update(swReleaseRecord);
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
