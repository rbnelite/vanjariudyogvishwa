package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.Frnd_requestDao;
import com.rbnelite.udyogvishwa.dao.NotificationDao;

public class HomeSer {

	public int getNotifications(String user_mail) {
		int cntt = 0;
		try {

			int ac;
			SessionFactory sf = new Configuration().configure()
					.buildSessionFactory();
			Session s = sf.openSession();
			s.beginTransaction();
			List allUsers;
			Query queryResult = s
					.createQuery("from NotificationDao where user_mail='"
							+ user_mail + "'");
			allUsers = queryResult.list();
			for (int i = 0; i < allUsers.size(); i++) {
				NotificationDao nt = (NotificationDao) allUsers.get(i);
				ac = nt.getNotification_id();
				cntt = cntt + 1;
			}

			s.getTransaction().commit();
			s.close();
			sf.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return cntt;
	}

	public List getEvent(String user_mail) {
		int k = 0;
		String name = "";
		ArrayList list = new ArrayList();
		SessionFactory sf1 = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = sf1.openSession();
		s1.beginTransaction();

		SQLQuery queryResult1 = s1
				.createSQLQuery("SELECT CONCAT (r.fname,' ',r.lname,' created an event : ',e.name) FROM registration r , tbl_event e WHERE e.user_mail=r.email_id AND e.user_mail='"
						+ user_mail + "'");

		queryResult1.getNamedParameters();
		List allUsers1 = queryResult1.list();
		for (int v = 0; v < allUsers1.size(); v++) {
			name = allUsers1.get(v).toString();
			list.add(name);
		}
		s1.getTransaction().commit();
		s1.close();
		sf1.close();
		return list;
	}

	public int getFriendRequestcnt(String user_mail) {
		int cnttt = 0;
		int act;

		SessionFactory sf16 = new Configuration().configure()
				.buildSessionFactory();
		Session s16 = sf16.openSession();
		s16.beginTransaction();
		List allUsers16;
		Query queryResult16 = s16
				.createQuery("from Frnd_requestDao where req_to='" + user_mail
						+ "' and req_status='N'");
		allUsers16 = queryResult16.list();
		for (int i = 0; i < allUsers16.size(); i++) {
			Frnd_requestDao fnt = (Frnd_requestDao) allUsers16.get(i);
			act = fnt.getFrnd_req_id();
			cnttt = cnttt + 1;

		}

		s16.getTransaction().commit();
		s16.close();
		sf16.close();
		return cnttt;
	}

	public List getPeople(String userName) {
		String pfname = "";
		String plname = "";
		String eid = "";
		Long sid;
		ArrayList list = new ArrayList();
		SessionFactory sf8 = new Configuration().configure()
				.buildSessionFactory();
		Session s8 = sf8.openSession();
		s8.beginTransaction();
		// SQLQuery queryResult8 =
		// s8.createSQLQuery("SELECT CONCAT(fname,' ',lname) fullname FROM registration WHERE email_id IN(SELECT DISTINCT user_mail FROM tbl_groups WHERE user_mail!='anil@gmail.com' AND group_name IN(SELECT group_name FROM tbl_groups WHERE user_mail='anil@gmail.com')) AND email_id NOT IN(SELECT To_Id FROM tbl_frd_request WHERE From_Id='anil@gmail.com')");
		SQLQuery queryResult8 = s8
				.createSQLQuery("SELECT CONCAT(fname,'"
						+ " "
						+ "',lname,'"
						+ ":"
						+ "',email_id,'"
						+ "::"
						+ "') fullname FROM registration WHERE email_id IN(SELECT DISTINCT user_mail FROM tbl_groups WHERE user_mail!='"
						+ userName
						+ "' AND group_name IN(SELECT group_name FROM tbl_groups WHERE user_mail='"
						+ userName
						+ "')) AND email_id NOT IN(SELECT To_Id FROM tbl_frd_request WHERE From_Id='"
						+ userName + "') ");
		queryResult8.getNamedParameters();
		List allUsers8 = queryResult8.list();
		for (int v = 0; v < allUsers8.size(); v++) {
			String pumknow = allUsers8.get(v).toString();
			list.add(pumknow);

		}
		s8.getTransaction().commit();
		s8.close();
		sf8.close();
		return list;
	}

}
