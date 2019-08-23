package com.system.record.service.impl;

import com.system.record.dao.MsgRecordDao;
import com.system.record.domain.MsgRecordDO;
import com.system.record.service.MsgRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MsgRecordServiceImpl implements MsgRecordService {
    @Autowired
    private MsgRecordDao msgRecordDao;

    @Override
    public MsgRecordDO get(String tid) {
        return msgRecordDao.get(tid);
    }

    @Override
    public List<MsgRecordDO> list(Map<String, Object> map) {
        return msgRecordDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return msgRecordDao.count(map);
    }

    @Override
    public int save(MsgRecordDO msgRecord) {
        return msgRecordDao.save(msgRecord);
    }

    @Override
    public int update(MsgRecordDO msgRecord) {
        return msgRecordDao.update(msgRecord);
    }

    @Override
    public int remove(String tid) {
        return msgRecordDao.remove(tid);
    }

    @Override
    public int batchRemove(String[] tids) {
        return msgRecordDao.batchRemove(tids);
    }

}
