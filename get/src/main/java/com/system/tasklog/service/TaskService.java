package com.system.tasklog.service;

import java.util.List;
import java.util.Map;
import com.system.tasklog.domain.TaskDO;

/**
 * 系统定时任务, 废弃sys_task表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-11-24 13:45:42
 */
public interface TaskService {

    TaskDO get(String tid);

    List<TaskDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(TaskDO task);

    int update(TaskDO task);

    int remove(String tid);

    int batchRemove(String[] tids);
}
