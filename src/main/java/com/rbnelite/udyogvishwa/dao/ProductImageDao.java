package com.rbnelite.udyogvishwa.dao;

public class ProductImageDao {
	private int prod_id;
	private String prod_paath;
	private int img_id;

	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_paath() {
		return prod_paath;
	}

	public void setProd_paath(String prod_paath) {
		this.prod_paath = prod_paath;
	}

}
