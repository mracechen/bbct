package com.common.utils.backup.dao;

import com.common.utils.backup.domain.OpLogDo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/*
 * @author
 * @email
 * @date 2018-10-22
 */

@Repository
@Mapper
public interface OpLogDao {
    void insertOpLog(OpLogDo opLog);
}
