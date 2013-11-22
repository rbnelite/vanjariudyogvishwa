package com.rbnelite.udyogvishwa.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.model.LoginDao;

public class LoginImpl {
	public void updateLogin(String UserName, String Password) {
		System.out.println("111");
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List allUsers;
		System.out.println("22222");
		Query queryResult = session
				.createQuery("from LoginDao where password='" + Password
						+ "' and email_id='" + UserName + "'");
		allUsers = queryResult.list();
		for (int i = 0; i < allUsers.size(); i++) {
			LoginDao login = (LoginDao) allUsers.get(i);
			System.out.println("33333");
			login.setLastLogin("22222");
			session.update(login);
			System.out.println("444444");
			session.getTransaction().commit();
			session.close();
			sf.close();
			System.out.println("555555");
		}
	}

	public String RetriveData(String UserName, String Password) {

		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List allUsers;
		Query queryResult = session
				.createQuery("from LoginDao where password='" + Password
						+ "' and email_id='" + UserName + "'");
		allUsers = queryResult.list();
		String lastLogin = "";
		for (int i = 0; i < allUsers.size(); i++) {
			LoginDao login = (LoginDao) allUsers.get(i);
			lastLogin = login.getLastLogin();
			session.getTransaction().commit();
			session.close();
			sf.close();
		}
		return lastLogin;
	}
}
