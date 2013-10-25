package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.CreateEventDao;

public class EventSer {
	public static List getEvent() {
		String e_name = "";
		String e_date = "";
		String e_details = "";
		ArrayList list = new ArrayList();

		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		List allUsers;
		Query queryResult = s
				.createQuery("from CreateEventDao order by date_time");
		allUsers = queryResult.list();
		for (int i = 0; i < allUsers.size(); i++) {
			CreateEventDao event = (CreateEventDao) allUsers.get(i);
			e_name = event.getName();
			e_date = event.getDate_time();
			e_details = event.getDetails();
			list.add(e_name);
			list.add(e_date);

		}

		s.getTransaction().commit();
		s.close();
		sf.close();
		return list;

	}

}