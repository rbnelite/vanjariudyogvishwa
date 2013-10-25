package com.rbnelite.udyogvishwa.dao;

public class PhotoUploadDao {
	private Integer photo_Id;
	private String path;
	private String user_mail;

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public Integer getPhoto_Id() {
		return photo_Id;
	}

	public void setPhoto_Id(Integer photo_Id) {
		this.photo_Id = photo_Id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
