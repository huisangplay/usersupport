package com.comac.usersupport_web.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Author:zhouhui
 * Date:2021/9/29 9:22
 */
public class SalaryUtil {
    public static Map<String, String> getSalaryTitleToNameMap() {
        Map<String, String> map = new HashMap<>();
        map.put("工号", "enumber");
        map.put("月份", "month");
        map.put("岗位工资", "postSalary");
        map.put("工龄工资", "ageSalary");
        map.put("绩效工资预发数", "performanceSalaryTotal");
        map.put("通讯补贴", "communicationSubsidy");
        map.put("绩效工资兑现数", "performanceSalaryCash");
        map.put("独生子女费", "oneChildBonus");
        map.put("补发工资", "backPay");
        map.put("应发工资", "totalPayAmount");
        map.put("养老保险", "endowmentInsurance");
        map.put("医疗保险", "medicalInsurance");
        map.put("失业保险", "unemploymentInsurance");
        map.put("住房公积金", "housingProvidentFund");
        map.put("补充公积金", "supplementaryProvidentFund");
        map.put("企业年金", "supplementaryPension");
        map.put("工会会费", "unionDues");
        map.put("税前扣款", "preTaxDeduction");
        map.put("税后扣款", "afterTaxDeduction");
        map.put("个税", "individualIncomeTax");
        map.put("实发工资", "realSalary");
        return map;
    }
}
