package com.rbnelite.udyogvishwa.model;

public class OccupationDao {
	private Long id;
	private String org_name;
	private String occupation;
	private String product_details;
	private String total_emp;
	private String emp_type;
	private String annual_income;
	private String user_mail;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getProduct_details() {
		return product_details;
	}

	public void setProduct_details(String product_details) {
		this.product_details = product_details;
	}

	public String getTotal_emp() {
		return total_emp;
	}

	public void setTotal_emp(String total_emp) {
		this.total_emp = total_emp;
	}

	public String getEmp_type() {
		return emp_type;
	}

	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}

	public String getAnnual_income() {
		return annual_income;
	}

	public void setAnnual_income(String annual_income) {
		this.annual_income = annual_income;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

}
