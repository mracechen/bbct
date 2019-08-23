package com.system.tasklog.dao;

import com.system.tasklog.domain.TaskDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;



/**
 * 系统定时任务, 废弃sys_task表
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-11-24 13:45:42
 */
@Mapper
public interface TaskDao {

        TaskDO get(String tid);

    List<TaskDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(TaskDO task);

    int update(TaskDO task);

    int remove(String tid);

    int batchRemove(String[] tids);
}
