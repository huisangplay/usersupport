package com.comac.usersupport_web.dao;

import com.comac.usersupport_web.model.RoleMenu;
import com.comac.usersupport_web.model.Salary;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Author:zhouhui
 * Date:2021/9/28 10:54
 */
public interface RoleMenuRepository extends Repository<RoleMenu,Long> {
    List<RoleMenu> findByRoleId(Long roleId);
}
