package com.rbnelite.udyogvishwa.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Comment {
	@Id
	private Long Id;
	private String cmnt;
	private String cmtWhom;
	private Long StatusId;

	public String getCmtWhom() {
		return cmtWhom;
	}

	public void setCmtWhom(String cmtWhom) {
		this.cmtWhom = cmtWhom;
	}

	public Long getStatusId() {
		return StatusId;
	}

	public void setStatusId(Long StatusId) {
		this.StatusId = StatusId;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getCmnt() {
		return cmnt;
	}

	public void setCmnt(String cmnt) {
		this.cmnt = cmnt;
	}

}
