package com.comac.usersupport_web.controller;

import com.comac.usersupport_web.constants.StatusContants;
import com.comac.usersupport_web.constants.UserConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

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

    @GetMapping("/")
    public String homePage(Model model) {
        request.getSession().setAttribute(UserConstants.IDENTIFIES,"500958");
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
        request.getSession().removeAttribute(UserConstants.IDENTIFIES);
        model.addAttribute("message", StatusContants.LOGOUT_STATUS_SUCCESS_MESSAGE);
        return "layout";
    }
}