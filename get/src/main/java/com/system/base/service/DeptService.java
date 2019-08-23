package com.system.base.service;

import com.common.basicskills.domain.Tree;
import com.system.base.domain.DeptDO;

import java.util.List;
import java.util.Map;

/**
 * 部门管理
 *
 * @author chglee
 * @date 2017-09-27 14:28:36
 */
public interface DeptService {

    DeptDO get(Long deptId);

    List<Integer> findSortIdByParentId(Long id);

    List<DeptDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(DeptDO sysDept);

    int update(DeptDO sysDept);

    int remove(Long deptId);

    int batchRemove(Long[] deptIds);

    Tree<DeptDO> getTree();

    boolean checkDeptHasUser(Long deptId);
}
