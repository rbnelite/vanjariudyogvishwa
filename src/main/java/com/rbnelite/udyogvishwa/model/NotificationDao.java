package com.rbnelite.udyogvishwa.model;

public class NotificationDao {

	private Integer notification_id;
	private String notification;
	private String date_time;
	private String user_mail;

	public Integer getNotification_id() {
		return notification_id;
	}

	public void setNotification_id(Integer notification_id) {
		this.notification_id = notification_id;
	}

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getDate_time() {
		return date_time;
	}

	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

}
