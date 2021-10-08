package com.comac.usersupport_web.model;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.Id;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

/**
 * Author:zhouhui
 * Date:2021/9/27 16:25
 */
@Entity
public class Menu {
    //主键
    @javax.persistence.Id
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    private Long id;

    private String name;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getUrl() {
        return url;
    }

    public String getRemark() {
        return remark;
    }

    private String url;
    private String remark;
}
