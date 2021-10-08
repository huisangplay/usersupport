package com.comac.usersupport_web.controller;

import com.comac.usersupport_web.constants.StatusContants;
import com.comac.usersupport_web.constants.UserConstants;
import com.comac.usersupport_web.dao.SalaryRepository;
import com.comac.usersupport_web.model.Salary;
import com.comac.usersupport_web.service.SalaryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
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

    @Autowired
    SalaryService salaryService;

    @RequestMapping(value = "/index")
    public String getSalaryByEnumber(Model model) {
        String enumber = (String) request.getSession().getAttribute(UserConstants.IDENTIFIES);
        if (StringUtils.isEmpty(enumber)) {
            model.addAttribute("warning", StatusContants.LOGIN_STATUS_IS_INVALID);
            return "layout";
        }
        List<Salary> list = salaryRepository.findByEnumber(enumber);
        model.addAttribute("salaryList", list);
        if (list.size() == 0) model.addAttribute("warning", StatusContants.SALARY_QUERY_IS_EMPTY);
        return "salary/index";
    }

    @RequestMapping("/manager")
    public String salaryManager(Model model) {
        List<Salary> salaryList = salaryRepository.findAll();
        model.addAttribute("salaryList", salaryList);
        return "salary/manager";
    }

    @RequestMapping("/uploadSalaryData")
    public String uploadSalaryData(Model model, @RequestParam("salaryListFile") MultipartFile salaryListFile){
        try {
            if(salaryListFile.isEmpty()) throw new Exception(StatusContants.SALARY_FILE_IS_EMPTY);
            String fileName=salaryListFile.getOriginalFilename();
            InputStream inputStream=salaryListFile.getInputStream();
            salaryService.getSalaryListByExcel(inputStream,fileName);
            model.addAttribute("message",StatusContants.SALARY_LIST_IMPORT_SUCCESS);
        } catch (Exception e) {
            String message=e.getMessage();
            model.addAttribute("warning",message);
        }
        List<Salary> salaryList = salaryRepository.findAll();
        model.addAttribute("salaryList", salaryList);
        return "salary/manager";
    }
}
