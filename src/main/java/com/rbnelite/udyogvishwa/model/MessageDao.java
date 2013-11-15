package com.rbnelite.udyogvishwa.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class MessageDao implements Serializable {
	@Id
	private Long Id;
	private String Tomsg;
	private String Message;
	private String sender;
	private String MsgDate;
	private String sen_flg;
	private String res_flg;

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}

	public String getTomsg() {
		return Tomsg;
	}

	public void setTomsg(String Tomsg) {
		this.Tomsg = Tomsg;
	}

	public String getMessage() {
		return Message;
	}

	public void setMessage(String Message) {
		this.Message = Message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMsgDate() {
		return MsgDate;
	}

	public void setMsgDate(String MsgDate) {
		this.MsgDate = MsgDate;
	}

	public String getSen_flg() {
		return sen_flg;
	}

	public void setSen_flg(String sen_flg) {
		this.sen_flg = sen_flg;
	}

	public String getRes_flg() {
		return res_flg;
	}

	public void setRes_flg(String res_flg) {
		this.res_flg = res_flg;
	}

}
