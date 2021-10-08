package com.comac.usersupport_web.model;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.Id;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

/**
 * Author:zhouhui
 * Date:2021/9/27 16:15
 */
@Entity
public class User {
    //主键
    @javax.persistence.Id
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    private Long id;

    @Column(unique = true)
    private String enumber;
    private Boolean status = true;
    private Long roleId;

    public Long getId() {
        return id;
    }

    public String getEnumber() {
        return enumber;
    }

    public Boolean getStatus() {
        return status;
    }

    public Long getRoleId() {
        return roleId;
    }
}
