package com.comac.usersupport_web.controller;

import com.comac.usersupport_web.constants.StatusContants;
import com.comac.usersupport_web.constants.UserConstants;
import com.comac.usersupport_web.dao.SalaryRepository;
import com.comac.usersupport_web.model.Salary;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月18日
 * @description:
 */
@Controller
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    SalaryRepository salaryRepository;

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value ="/index")
    public String getSalaryByEnumber(Model model){
        String enumber=(String)request.getSession().getAttribute(UserConstants.IDENTIFIES);
        if(StringUtils.isEmpty(enumber)){
            model.addAttribute("warning", StatusContants.LOGIN_STATUS_IS_INVALID);
            return "layout";
        }
        List<Salary> list=salaryRepository.findByEnumber(enumber);
        model.addAttribute("salaryList",list);
        return "salary/index";
    }
}
