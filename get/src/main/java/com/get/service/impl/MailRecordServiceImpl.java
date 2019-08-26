package com.get.service.impl;

import com.get.dao.MailRecordDao;
import com.get.domain.MailRecordDO;
import com.get.service.MailRecordService;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MailRecordServiceImpl implements MailRecordService {
    @Autowired
    private MailRecordDao mailRecordDao;

    @Override
    public MailRecordDO get(String tid) {
        return mailRecordDao.get(tid);
    }

    @Override
    public List<MailRecordDO> list(Map<String, Object> map) {
        return mailRecordDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return mailRecordDao.count(map);
    }

    @Override
    public int save(MailRecordDO mailRecord) {
        return mailRecordDao.save(mailRecord);
    }

    @Override
    public int update(MailRecordDO mailRecord) {
        return mailRecordDao.update(mailRecord);
    }

    @Override
    public int remove(String tid) {
        MailRecordDO mailRecord = new MailRecordDO();
        mailRecord.setDelFlag(CommonStatic.DELETE);
        mailRecord.setTid(tid);
        return mailRecordDao.update(mailRecord);
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
