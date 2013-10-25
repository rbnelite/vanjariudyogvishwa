package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CommentDao {
	@Id
	private Long Id;
	private String cmnt;
	private String cmt_whom;
	private Long Status_id;

	public String getCmt_whom() {
		return cmt_whom;
	}

	public void setCmt_whom(String cmt_whom) {
		this.cmt_whom = cmt_whom;
	}

	public Long getStatus_id() {
		return Status_id;
	}

	public void setStatus_id(Long Status_id) {
		this.Status_id = Status_id;
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
