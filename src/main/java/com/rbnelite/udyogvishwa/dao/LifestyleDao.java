package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class LifestyleDao {
	@Id
	private Long id;
	private String diet;
	private String smoke;
	private String drink;
	private String complexion;
	private String body_type;
	private String bld_grp;
	private String weight;
	// private String spoken_lang;
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

	public void setId(Long id) {
		this.id = id;
	}

	public String getDiet() {
		return diet;
	}

	public void setDiet(String diet) {
		this.diet = diet;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getComplexion() {
		return complexion;
	}

	public void setComplexion(String complexion) {
		this.complexion = complexion;
	}

	public String getBody_type() {
		return body_type;
	}

	public void setBody_type(String body_type) {
		this.body_type = body_type;
	}

	public String getBld_grp() {
		return bld_grp;
	}

	public void setBld_grp(String bld_grp) {
		this.bld_grp = bld_grp;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

}
