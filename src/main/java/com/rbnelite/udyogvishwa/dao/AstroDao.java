package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Id;
import org.hibernate.annotations.Entity;

@Entity
public class AstroDao {
	@Id
	private Long Id;
	private String country;
	private String city;
	private String zodiac;
	private String user_mail;

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZodiac() {
		return zodiac;
	}

	public void setZodiac(String zodiac) {
		this.zodiac = zodiac;
	}

}
