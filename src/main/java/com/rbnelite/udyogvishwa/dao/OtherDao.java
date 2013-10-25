package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class OtherDao {
	@Id
	private Long Id;
	private String social_stat;
	private String poly_stat;
	private String social_act;
	private String poly_act;
	private String cultural_act;
	private String games;
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

	public String getSocial_stat() {
		return social_stat;
	}

	public void setSocial_stat(String social_stat) {
		this.social_stat = social_stat;
	}

	public String getPoly_stat() {
		return poly_stat;
	}

	public void setPoly_stat(String poly_stat) {
		this.poly_stat = poly_stat;
	}

	public String getSocial_act() {
		return social_act;
	}

	public void setSocial_act(String social_act) {
		this.social_act = social_act;
	}

	public String getPoly_act() {
		return poly_act;
	}

	public void setPoly_act(String poly_act) {
		this.poly_act = poly_act;
	}

	public String getCultural_act() {
		return cultural_act;
	}

	public void setCultural_act(String cultural_act) {
		this.cultural_act = cultural_act;
	}

	public String getGames() {
		return games;
	}

	public void setGames(String games) {
		this.games = games;
	}

}
