package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class EducationDao {
	@Id
	private Long id;
	private String school;
	private String clg;
	private String graduation;
	private String othr_graduation;
	private String pg_clg;
	private String pg_degree;
	private String othr_pg_degree;

	private String user_mail;

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long Id) {
		this.id = Id;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getClg() {
		return clg;
	}

	public void setClg(String clg) {
		this.clg = clg;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getOthr_graduation() {
		return othr_graduation;
	}

	public void setOthr_graduation(String othr_graduation) {
		this.othr_graduation = othr_graduation;
	}

	public String getPg_clg() {
		return pg_clg;
	}

	public void setPg_clg(String pg_clg) {
		this.pg_clg = pg_clg;
	}

	public String getPg_degree() {
		return pg_degree;
	}

	public void setPg_degree(String pg_degree) {
		this.pg_degree = pg_degree;
	}

	public String getOthr_pg_degree() {
		return othr_pg_degree;
	}

	public void setOthr_pg_degree(String othr_pg_degree) {
		this.othr_pg_degree = othr_pg_degree;
	}

}
