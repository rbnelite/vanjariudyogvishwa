package com.rbnelite.udyogvishwa.model;

import javax.persistence.Id;
import org.hibernate.annotations.Entity;

@Entity
public class Astro {
	@Id
	private Long Id;
	private String country;
	private String city;
	private String zodiac;
	private String userMail;

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
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
