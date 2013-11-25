package com.rbnelite.udyogvishwa.dao;

import org.springframework.stereotype.Repository;

import com.rbnelite.udyogvishwa.model.Message;


@Repository
public class MessageDaoImpl extends BaseDao implements MessageDao{

	public MessageDaoImpl() {
		super(Message.class);
	}

	@Override
	public String getMessage() {
		return ((Message) get(1)).getMessage();
	}
}
