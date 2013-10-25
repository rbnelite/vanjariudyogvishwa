package com.rbnelite.udyogvishwa.dao;

import java.io.Serializable;
import org.hibernate.annotations.Entity;

@Entity
public class RegistrationDao implements Serializable {
	private Long id;
	private String fName;
	private String mName;
	private String lName;

	private String emailId;
	private String contact;
	private String gender;
	private String bday;
	private String bmonth;
	private String byear;
	private String pass1;
	private String LastLogin;
	private String bDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBday() {
		return bday;
	}

	public void setBday(String bday) {
		this.bday = bday;
	}

	public String getBmonth() {
		return bmonth;
	}

	public void setBmonth(String bmonth) {
		this.bmonth = bmonth;
	}

	public String getByear() {
		return byear;
	}

	public void setByear(String byear) {
		this.byear = byear;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getLastLogin() {
		return LastLogin;
	}

	public void setLastLogin(String LastLogin) {
		this.LastLogin = LastLogin;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

}
