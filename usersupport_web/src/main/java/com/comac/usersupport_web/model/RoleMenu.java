package com.comac.usersupport_web.model;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.Id;

import javax.persistence.*;

/**
 * Author:zhouhui
 * Date:2021/9/27 16:39
 */
@Entity
public class RoleMenu {
    //主键
    @javax.persistence.Id
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "roleId")
    private Role role;

    public Long getId() {
        return id;
    }

    public Role getRole() {
        return role;
    }

    public Menu getMenu() {
        return menu;
    }

    @ManyToOne
    @JoinColumn(name = "menuId")
    private Menu menu;
}
