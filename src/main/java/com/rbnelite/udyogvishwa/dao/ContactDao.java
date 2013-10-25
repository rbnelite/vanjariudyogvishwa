package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ContactDao {
	@Id
	private Long Id;
	private String home_addr;
	private String off_addr;
	private String telephone;
	private String uid;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getHome_addr() {
		return home_addr;
	}

	public void setHome_addr(String home_addr) {
		this.home_addr = home_addr;
	}

	public String getOff_addr() {
		return off_addr;
	}

	public void setOff_addr(String off_addr) {
		this.off_addr = off_addr;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
}
