package com.rbnelite.udyogvishwa.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Family implements Serializable {
	@Id
	private Long id;
	private String fam_values;
	private String fam_type;
	private String fam_status;
	private String fam_income;
	private String uid;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFam_values() {
		return fam_values;
	}

	public void setFam_values(String fam_values) {
		this.fam_values = fam_values;
	}

	public String getFam_type() {
		return fam_type;
	}

	public void setFam_type(String fam_type) {
		this.fam_type = fam_type;
	}

	public String getFam_status() {
		return fam_status;
	}

	public void setFam_status(String fam_status) {
		this.fam_status = fam_status;
	}

	public String getFam_income() {
		return fam_income;
	}

	public void setFam_income(String fam_income) {
		this.fam_income = fam_income;
	}

}
