package com.rbnelite.udyogvishwa.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StatusUpdateDao {
	@Id
	private Long Id;
	private String status_details;
	private String status_date;
	private String user_email;

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getStatus_details() {
		return status_details;
	}

	public void setStatus_details(String status_details) {
		this.status_details = status_details;
	}

	public String getStatus_date() {
		return status_date;
	}

	public void setStatus_date(String status_date) {
		this.status_date = status_date;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

}
