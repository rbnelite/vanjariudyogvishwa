package com.rbnelite.udyogvishwa.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rbnelite.udyogvishwa.dao.MessageDao;

@Service
public class HelloWorldServiceImpl implements HelloWorldService {

	@Resource
	private MessageDao messageDao;
	
	public String getMessage() {
		return messageDao.getMessage();
	}
}
