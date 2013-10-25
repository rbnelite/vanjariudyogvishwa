package com.rbnelite.udyogvishwa.dao;

public class SolutionDao {
	private int solution_id;
	private String solution;
	private int need_id;
	private String user_mail;

	public int getSolution_id() {
		return solution_id;
	}

	public void setSolution_id(int solution_id) {
		this.solution_id = solution_id;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public int getNeed_id() {
		return need_id;
	}

	public void setNeed_id(int need_id) {
		this.need_id = need_id;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

}
