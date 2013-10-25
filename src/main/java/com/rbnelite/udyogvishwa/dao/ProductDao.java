package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ProductDao {
	@Id
	private int Id;
	private String ProductName;
	private String ProductInfo;
	private String user_mail;

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public int getId() {
		return Id;
	}

	public void setId(int Id) {
		this.Id = Id;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String ProductName) {
		this.ProductName = ProductName;
	}

	public String getProductInfo() {
		return ProductInfo;
	}

	public void setProductInfo(String ProductInfo) {
		this.ProductInfo = ProductInfo;
	}

}
