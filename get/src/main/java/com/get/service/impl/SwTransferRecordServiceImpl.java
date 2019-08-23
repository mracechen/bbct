package com.get.service.impl;

import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.get.dao.SwTransferRecordDao;
import com.get.domain.SwTransferRecordDO;
import com.get.service.SwTransferRecordService;


@Service
public class SwTransferRecordServiceImpl implements SwTransferRecordService {
    @Autowired
    private SwTransferRecordDao swTransferRecordDao;

    @Override
    public SwTransferRecordDO get(String tid) {
        return swTransferRecordDao.get(tid);
    }

    @Override
    public List<SwTransferRecordDO> list(Map<String, Object> map) {
        return swTransferRecordDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swTransferRecordDao.count(map);
    }

    @Override
    public int save(SwTransferRecordDO swTransferRecord) {
        return swTransferRecordDao.save(swTransferRecord);
    }

    @Override
    public int update(SwTransferRecordDO swTransferRecord) {
        return swTransferRecordDao.update(swTransferRecord);
    }

    @Override
    public int remove(String tid) {
        SwTransferRecordDO swTransferRecord = new SwTransferRecordDO();
        swTransferRecord.setDelFlag(CommonStatic.DELETE);
        swTransferRecord.setTid(tid);
        return swTransferRecordDao.update(swTransferRecord);
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
