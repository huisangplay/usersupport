package com.comac.usersupport_web.service;

import com.comac.usersupport_web.dao.SalaryRepository;
import com.comac.usersupport_web.model.Salary;
import com.comac.usersupport_web.util.SalaryUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:zhouhui
 * Date:2021/9/28 16:39
 */
@Service
public class SalaryService {

    @Autowired
    SalaryRepository salaryRepository;

    public List getSalaryListByExcel(InputStream in, String fileName) throws Exception {
        List<Salary> list = new ArrayList<>();
        //创建Excel工作薄
        Workbook work = this.getWorkbook(in, fileName);
        if (null == work) {
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;

        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if (sheet == null) {
                continue;
            }
            Map<Integer, String> map = new HashMap<>();
            Map<String, String> salaryTitleToNameMap = SalaryUtil.getSalaryTitleToNameMap();
            for (int j = 0; j <= sheet.getLastRowNum(); j++) {
                row = sheet.getRow(j);
                if (j == 0) {
                    for (int k = row.getFirstCellNum(); k < row.getLastCellNum(); k++) {
                        cell = row.getCell(k);
                        String title = cell.getStringCellValue();
                        String name = salaryTitleToNameMap.get(title);
                        if (name == null) throw new Exception("excel数据格式不对，请检查后重新上传");
                        map.put(k, name);
                    }
                    continue;
                }
                if (row == null) {
                    continue;
                }
                Salary salary = new Salary();
                for (int k = 0; k < map.size(); k++) {
                    cell = row.getCell(k);
                    String name = map.get(k);
                    if(cell==null||StringUtils.isEmpty(cell.toString())) continue;
                    if(name.equals("enumber")||name.equals("month")) cell.setCellType(CellType.STRING);
                    else cell.setCellType(CellType.NUMERIC);
                    CellType cellType = cell.getCellType();

                    if (cellType == CellType.STRING) {
                        String value = cell.getStringCellValue();
                        if (name.equals("enumber")) salary.setEnumber(value);
                        else if (name.equals("month")) salary.setMonth(value);
                    } else if (cellType == CellType.NUMERIC) {
                        double num = cell.getNumericCellValue();
                        if (name.equals("postSalary")) salary.setPostSalary(num);
                        else if (name.equals("ageSalary")) salary.setAgeSalary(num);
                        else if (name.equals("performanceSalaryTotal")) salary.setPerformanceSalaryTotal(num);
                        else if (name.equals("communicationSubsidy")) salary.setCommunicationSubsidy(num);
                        else if (name.equals("performanceSalaryCash")) salary.setPerformanceSalaryCash(num);
                        else if (name.equals("oneChildBonus")) salary.setOneChildBonus(num);
                        else if (name.equals("backPay")) salary.setBackPay(num);
                        else if (name.equals("totalPayAmount")) salary.setTotalPayAmount(num);
                        else if (name.equals("endowmentInsurance")) salary.setEndowmentInsurance(num);
                        else if (name.equals("medicalInsurance")) salary.setMedicalInsurance(num);
                        else if (name.equals("unemploymentInsurance")) salary.setUnemploymentInsurance(num);
                        else if (name.equals("housingProvidentFund")) salary.setHousingProvidentFund(num);
                        else if (name.equals("supplementaryProvidentFund")) salary.setSupplementaryProvidentFund(num);
                        else if (name.equals("supplementaryPension")) salary.setSupplementaryPension(num);
                        else if (name.equals("unionDues")) salary.setUnionDues(num);
                        else if (name.equals("preTaxDeduction")) salary.setPreTaxDeduction(num);
                        else if (name.equals("afterTaxDeduction")) salary.setAfterTaxDeduction(num);
                        else if (name.equals("individualIncomeTax")) salary.setIndividualIncomeTax(num);
                        else if (name.equals("realSalary")) salary.setRealSalary(num);
                    }
                }
                if(StringUtils.isEmpty(salary.getEnumber())||StringUtils.isEmpty(salary.getMonth())) continue;
                list.add(salary);
            }
        }
        work.close();
        for (Salary sa : list) {
            salaryRepository.save(sa);
        }
        return list;
    }

    /**
     * 判断文件格式
     *
     * @param inStr
     * @param fileName
     * @return
     * @throws Exception
     */
    public Workbook getWorkbook(InputStream inStr, String fileName) throws Exception {
        Workbook workbook = null;
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        if (".xls".equals(fileType)) {
            workbook = new HSSFWorkbook(inStr);
        } else if (".xlsx".equals(fileType)) {
            workbook = new XSSFWorkbook(inStr);
        } else {
            throw new Exception("请上传excel文件！");
        }
        return workbook;
    }

}
