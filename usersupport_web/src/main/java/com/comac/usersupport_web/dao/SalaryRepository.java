package com.comac.usersupport_web.dao;
import com.comac.usersupport_web.model.Salary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月18日
 * @description:
 */
public interface SalaryRepository extends JpaRepository<Salary,Long> {
    List<Salary> findByEnumber(String enumber);

    List<Salary> findAll();
}
