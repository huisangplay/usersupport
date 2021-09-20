package com.comac.usersupport_admin.model;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import javax.persistence.*;

/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月18日
 * @description:
 */
@Erupt(name = "工资单")
@Table(name = "salary")
@Entity
public class Salary {
    //主键
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    @EruptField
    private Long id;

    @EruptField(
            views = @View(title = "月份",width = "8"),
            edit = @Edit(title = "月份")
    )
    private String month;

    @EruptField(
            views = @View(title = "岗位工资"),
            edit = @Edit(title = "岗位工资")
    )
    private double postSalary;

    @EruptField(
            views = @View(title = "工龄工资"),
            edit = @Edit(title = "工龄工资")
    )
    private double ageSalary;

    @EruptField(
            views = @View(title = "绩效工资预发数"),
            edit = @Edit(title = "绩效工资预发数")
    )
    private double performanceSalaryTotal;

    @EruptField(
            views = @View(title = "通讯补贴"),
            edit = @Edit(title = "通讯补贴")
    )
    private double communicationSubsidy;

    @EruptField(
            views = @View(title = "绩效工资兑现数"),
            edit = @Edit(title = "绩效工资兑现数")
    )
    private double performanceSalaryCash;

    @EruptField(
            views = @View(title = "独生子女费"),
            edit = @Edit(title = "独生子女费")
    )
    private double oneChildBonus;

    @EruptField(
            views = @View(title = "补发工资"),
            edit = @Edit(title = "补发工资")
    )
    private double backPay;

    @EruptField(
            views = @View(title = "应发工资"),
            edit = @Edit(title = "应发工资")
    )
    private double totalPayAmount;

    @EruptField(
            views = @View(title = "养老保险"),
            edit = @Edit(title = "养老保险")
    )
    private double endowmentInsurance;

    @EruptField(
            views = @View(title = "医疗保险"),
            edit = @Edit(title = "医疗保险")
    )
    private double medicalInsurance;

    @EruptField(
            views = @View(title = "失业保险"),
            edit = @Edit(title = "失业保险")
    )
    private double unemploymentInsurance;

    @EruptField(
            views = @View(title = "住房公积金"),
            edit = @Edit(title = "住房公积金")
    )
    private double housingProvidentFund;

    @EruptField(
            views = @View(title = "补充公积金"),
            edit = @Edit(title = "补充公积金")
    )
    private double supplementaryProvidentFund;

    @EruptField(
            views = @View(title = "企业年金"),
            edit = @Edit(title = "企业年金")
    )
    private double supplementaryPension;

    @EruptField(
            views = @View(title = "工会会费"),
            edit = @Edit(title = "工会会费")
    )
    private double unionDues;

    @EruptField(
            views = @View(title = "税前扣款"),
            edit = @Edit(title = "税前扣款")
    )
    private double preTaxDeduction;

    @EruptField(
            views = @View(title = "税后扣款"),
            edit = @Edit(title = "税后扣款")
    )
    private double afterTaxDeduction;

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public double getPostSalary() {
        return postSalary;
    }

    public void setPostSalary(double postSalary) {
        this.postSalary = postSalary;
    }

    public double getAgeSalary() {
        return ageSalary;
    }

    public void setAgeSalary(double ageSalary) {
        this.ageSalary = ageSalary;
    }

    public double getPerformanceSalaryTotal() {
        return performanceSalaryTotal;
    }

    public void setPerformanceSalaryTotal(double performanceSalaryTotal) {
        this.performanceSalaryTotal = performanceSalaryTotal;
    }

    public double getCommunicationSubsidy() {
        return communicationSubsidy;
    }

    public void setCommunicationSubsidy(double communicationSubsidy) {
        this.communicationSubsidy = communicationSubsidy;
    }

    public double getPerformanceSalaryCash() {
        return performanceSalaryCash;
    }

    public void setPerformanceSalaryCash(double performanceSalaryCash) {
        this.performanceSalaryCash = performanceSalaryCash;
    }

    public double getOneChildBonus() {
        return oneChildBonus;
    }

    public void setOneChildBonus(double oneChildBonus) {
        this.oneChildBonus = oneChildBonus;
    }

    public double getBackPay() {
        return backPay;
    }

    public void setBackPay(double backPay) {
        this.backPay = backPay;
    }

    public double getTotalPayAmount() {
        return totalPayAmount;
    }

    public void setTotalPayAmount(double totalPayAmount) {
        this.totalPayAmount = totalPayAmount;
    }

    public double getEndowmentInsurance() {
        return endowmentInsurance;
    }

    public void setEndowmentInsurance(double endowmentInsurance) {
        this.endowmentInsurance = endowmentInsurance;
    }

    public double getMedicalInsurance() {
        return medicalInsurance;
    }

    public void setMedicalInsurance(double medicalInsurance) {
        this.medicalInsurance = medicalInsurance;
    }

    public double getUnemploymentInsurance() {
        return unemploymentInsurance;
    }

    public void setUnemploymentInsurance(double unemploymentInsurance) {
        this.unemploymentInsurance = unemploymentInsurance;
    }

    public double getHousingProvidentFund() {
        return housingProvidentFund;
    }

    public void setHousingProvidentFund(double housingProvidentFund) {
        this.housingProvidentFund = housingProvidentFund;
    }

    public double getSupplementaryProvidentFund() {
        return supplementaryProvidentFund;
    }

    public void setSupplementaryProvidentFund(double supplementaryProvidentFund) {
        this.supplementaryProvidentFund = supplementaryProvidentFund;
    }

    public double getSupplementaryPension() {
        return supplementaryPension;
    }

    public void setSupplementaryPension(double supplementaryPension) {
        this.supplementaryPension = supplementaryPension;
    }

    public double getUnionDues() {
        return unionDues;
    }

    public void setUnionDues(double unionDues) {
        this.unionDues = unionDues;
    }

    public double getPreTaxDeduction() {
        return preTaxDeduction;
    }

    public void setPreTaxDeduction(double preTaxDeduction) {
        this.preTaxDeduction = preTaxDeduction;
    }

    public double getAfterTaxDeduction() {
        return afterTaxDeduction;
    }

    public void setAfterTaxDeduction(double afterTaxDeduction) {
        this.afterTaxDeduction = afterTaxDeduction;
    }

    public double getIndividualIncomeTax() {
        return individualIncomeTax;
    }

    public void setIndividualIncomeTax(double individualIncomeTax) {
        this.individualIncomeTax = individualIncomeTax;
    }

    public double getRealSalary() {
        return realSalary;
    }

    public void setRealSalary(double realSalary) {
        this.realSalary = realSalary;
    }

    @EruptField(
            views = @View(title = "个税"),
            edit = @Edit(title = "个税")
    )
    private double individualIncomeTax;

    @EruptField(
            views = @View(title = "实发工资"),
            edit = @Edit(title = "实发工资")
    )
    private double realSalary;

    public String getEnumber() {
        return enumber;
    }

    public void setEnumber(String enumber) {
        this.enumber = enumber;
    }

    @EruptField(
            views = @View(title = "工号",width = "8"),
            edit = @Edit(title = "工号")
    )
    private String enumber;

}
