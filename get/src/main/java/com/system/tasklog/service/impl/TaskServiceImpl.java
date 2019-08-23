package com.system.tasklog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import com.system.tasklog.dao.TaskDao;
import com.system.tasklog.domain.TaskDO;
import com.system.tasklog.service.TaskService;


@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskDao taskDao;

    @Override
    public TaskDO get(String tid) {
        return taskDao.get(tid);
    }

    @Override
    public List<TaskDO> list(Map<String, Object> map) {
        return taskDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return taskDao.count(map);
    }

    @Override
    public int save(TaskDO task) {
        return taskDao.save(task);
    }

    @Override
    public int update(TaskDO task) {
        return taskDao.update(task);
    }

    @Override
    public int remove(String tid) {
        return taskDao.remove(tid);
    }

    @Override
    public int batchRemove(String[] tids) {
        return taskDao.batchRemove(tids);
    }

}
