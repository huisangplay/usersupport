package com.comac.usersupport_web.model;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Table;
import org.springframework.context.annotation.Primary;
import org.springframework.data.annotation.Id;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

/**
 * @title：
 * @author: zhouhui
 * @date: 2021年09月18日
 * @description:
 */
@Entity
public class Salary {
    //主键
    @javax.persistence.Id
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    private Long id;

    private String month;

    private double postSalary;

    private double ageSalary;

    private double performanceSalaryTotal;

    private double communicationSubsidy;

    private double performanceSalaryCash;

    private double oneChildBonus;

    private double backPay;

    private double totalPayAmount;

    private double endowmentInsurance;

    private double medicalInsurance;

    private double unemploymentInsurance;

    private double housingProvidentFund;

    private double supplementaryProvidentFund;

    private double supplementaryPension;

    private double unionDues;

    private double preTaxDeduction;

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

    private double individualIncomeTax;

    private double realSalary;

    public String getEnumber() {
        return enumber;
    }

    public void setEnumber(String enumber) {
        this.enumber = enumber;
    }

    private String enumber;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
