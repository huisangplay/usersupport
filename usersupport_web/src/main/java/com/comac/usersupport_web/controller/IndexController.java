package com.comac.usersupport_web.controller;

import com.comac.usersupport_web.constants.StatusContants;
import com.comac.usersupport_web.constants.UserConstants;
import com.comac.usersupport_web.dao.RoleMenuRepository;
import com.comac.usersupport_web.dao.UserRepository;
import com.comac.usersupport_web.model.Menu;
import com.comac.usersupport_web.model.RoleMenu;
import com.comac.usersupport_web.model.User;
import com.sgcc.isc.ualogin.client.util.IscSSOResourceUtil;
import com.sgcc.isc.ualogin.client.vo.IscSSOUserBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月19日
 * @description:
 */
@Controller
public class IndexController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    RoleMenuRepository roleMenuRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginAndReturnHomePage(HttpServletRequest request,Model model){
        IscSSOUserBean iscSSOUserBean = null;
        try {
            iscSSOUserBean = IscSSOResourceUtil.getIscUserBean(request);
            String enumber=iscSSOUserBean.getIscUserSourceId();
            System.out.println("login account enumber:"+enumber);
            if(StringUtils.isEmpty(enumber)) throw new Exception();

            HttpSession session=request.getSession();
            session.setAttribute(UserConstants.IDENTIFIES,enumber);

            User user=userRepository.findByEnumber(enumber);
            List<RoleMenu> roleMenuList=null;
            if(user==null){
                roleMenuList=roleMenuRepository.findByRoleId(UserConstants.DEFAULTROLEID);
            }else{
                roleMenuList=roleMenuRepository.findByRoleId(user.getRoleId());
            }

            session.setAttribute("roleMenuList",roleMenuList);

        } catch (Exception e) {
            model.addAttribute("warning", StatusContants.LOGIN_STATUS_BY_SSO_FAILED);
        }
        return "layout";
    }

    @GetMapping("/")
    public String homePage() {
        return "layout";
    }

    @GetMapping("/contact")
    public String contactPage() {
        return "contact";
    }

    @GetMapping("/about")
    public String aboutPage() {
        return "about";
    }

    @GetMapping("/logout")
    public String logout(Model model) {

        String identifies=(String)request.getSession().getAttribute(UserConstants.IDENTIFIES);
        if(StringUtils.isEmpty(identifies)){
            model.addAttribute("warning",StatusContants.LOGOUT_STATUS_INVALID_LOGOUT);
        }else{
            request.getSession().removeAttribute(UserConstants.IDENTIFIES);
            model.addAttribute("message", StatusContants.LOGOUT_STATUS_SUCCESS_MESSAGE);
        }
        return "layout";
    }
}