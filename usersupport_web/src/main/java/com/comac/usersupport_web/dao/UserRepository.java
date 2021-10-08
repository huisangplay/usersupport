package com.comac.usersupport_web.dao;

import com.comac.usersupport_web.model.Salary;
import com.comac.usersupport_web.model.User;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Author:zhouhui
 * Date:2021/9/28 9:38
 */
public interface UserRepository extends Repository<User,Long> {
    User findByEnumber(String enumber);
}
