package com.system.ids.dao;

import com.system.ids.domin.Ids;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

/**
 * 配置表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-06 11:20:36
 */
@Mapper
public interface IdsDao {

    @Insert("insert into t_ids (random) values (#{random})")
    @Options(useGeneratedKeys=true, keyColumn="tid",keyProperty = "tid")
    int getUniqueId(Ids ids);
}
