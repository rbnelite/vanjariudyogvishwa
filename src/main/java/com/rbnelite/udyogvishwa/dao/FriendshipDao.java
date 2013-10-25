package com.rbnelite.udyogvishwa.dao;

public class FriendshipDao {
	private Long Id;
	private String whom_frd;
	private String who_frd;
	private String date;

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getWhom_frd() {
		return whom_frd;
	}

	public void setWhom_frd(String whom_frd) {
		this.whom_frd = whom_frd;
	}

	public String getWho_frd() {
		return who_frd;
	}

	public void setWho_frd(String who_frd) {
		this.who_frd = who_frd;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
