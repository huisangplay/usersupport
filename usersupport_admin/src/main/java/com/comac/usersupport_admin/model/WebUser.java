package com.comac.usersupport_admin.model;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.model.EruptOrg;
import xyz.erupt.upms.model.EruptPost;

import javax.persistence.*;
/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月18日
 * @description:
 */
@Erupt(name = "前台用户")
@Table(name = "web_user")
@Entity
public class WebUser {

    //主键
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    @EruptField
    private Long id;

    @Column(name = "enumber")
    @EruptField(
            views = @View(title = "工号")
    )
    private Long enumber;

    @EruptField(
            views = {@View(
                    title = "姓名",
                    sortable = true
            )},
            edit = @Edit(
                    title = "姓名",
                    notNull = true,
                    search = @Search(
                            vague = true
                    )
            )
    )
    private String name;

    @EruptField(
            views = {@View(
                    title = "账户状态"
            )},
            edit = @Edit(
                    title = "账户状态",
                    search = @Search,
                    type = EditType.BOOLEAN,
                    notNull = true,
                    boolType = @BoolType(
                            trueText = "激活",
                            falseText = "锁定"
                    )
            )
    )
    private Boolean status = true;

    @EruptField(
            views = {@View(
                    title = "手机号码"
            )},
            edit = @Edit(
                    title = "手机号码",
                    search = @Search(
                            vague = true
                    ),
                    inputType = @InputType(
                            regex = "^[1][3,4,5,6,7,8,9][0-9]{9}$"
                    )
            )
    )
    private String phone;

    @EruptField(
            views = {@View(
                    title = "邮箱"
            )},
            edit = @Edit(
                    title = "邮箱",
                    search = @Search(
                            vague = true
                    ),
                    inputType = @InputType(
                            regex = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"
                    )
            )
    )
    private String email;

    @ManyToOne
    @EruptField(
            views = {@View(
                    title = "所属组织",
                    column = "name"
            )},
            edit = @Edit(
                    title = "所属组织",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(
                            pid = "parentOrg.id"
                    )
            )
    )
    private EruptOrg eruptOrg;
    @ManyToOne
    @EruptField(
            views = {@View(
                    title = "岗位",
                    column = "name"
            )},
            edit = @Edit(
                    title = "岗位",
                    type = EditType.REFERENCE_TREE
            )
    )
    private EruptPost eruptPost;
    @EruptField(
            edit = @Edit(
                    title = "密码"
            )
    )
    private String password;
}
