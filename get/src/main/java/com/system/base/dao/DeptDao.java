package com.system.base.dao;

import com.system.base.domain.DeptDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 部门管理
 *
 * @author chglee
 * @date 2017-10-03 15:35:39
 */
@Mapper
public interface DeptDao {

    DeptDO get(Long deptId);

    List<DeptDO> list(Map<String, Object> map);

    List<Integer> findSortIdByParentId(Long parentId);

    int count(Map<String, Object> map);

    int save(DeptDO dept);

    int update(DeptDO dept);

    int remove(Long deptId);

    int batchRemove(Long[] deptIds);

    Long[] listParentDept();

    int getDeptUserNumber(Long deptId);
}
