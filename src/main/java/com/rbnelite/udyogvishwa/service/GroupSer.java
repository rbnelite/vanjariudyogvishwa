package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.Intrest_areasDao;

public class GroupSer {

	public void saveGroup(String uid, String result1) {
		try {
			SessionFactory sf = new Configuration().configure()
					.buildSessionFactory();
			Session s = sf.openSession();
			Intrest_areasDao ia = new Intrest_areasDao();
			ia.setUser_mail(uid);
			ia.setGroup_name(result1);
			s.beginTransaction();
			s.save(ia);
			s.getTransaction().commit();
			s.close();
			sf.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List getResult(String user_mail, String pageNumber) {
		int pageSize = 3;
		int pNumber = Integer.parseInt(pageNumber);
		ArrayList list = new ArrayList();
		SessionFactory sf9 = new Configuration().configure()
				.buildSessionFactory();
		Session s9 = sf9.openSession();
		s9.beginTransaction();
		List allUsers9;
		Query queryResult9 = s9
				.createQuery("from Intrest_areasDao where user_mail='"
						+ user_mail + "'");
		queryResult9 = queryResult9.setFirstResult(pageSize * (pNumber - 1));
		queryResult9.setMaxResults(pageSize);
		allUsers9 = queryResult9.list();
		for (int i = 0; i < allUsers9.size(); i++) {
			Intrest_areasDao ia = (Intrest_areasDao) allUsers9.get(i);
			String groupName = ia.getGroup_name();
			list.add(groupName);
		}
		s9.getTransaction().commit();
		s9.close();
		sf9.close();
		return list;
	}

	public String GroupImages(String group_name) {
		String imgpath = "";
		SessionFactory sf9 = new Configuration().configure()
				.buildSessionFactory();
		Session s9 = sf9.openSession();
		s9.beginTransaction();
		List allUsers9;
		SQLQuery queryResult9 = s9
				.createSQLQuery("SELECT grp_image_path FROM tbl_group_image WHERE grp_name='"
						+ group_name + "'");
		queryResult9.getNamedParameters();
		List allUsers = queryResult9.list();
		for (int i = 0; i < allUsers.size(); i++) {
			imgpath = allUsers.get(i).toString();
		}

		s9.getTransaction().commit();
		s9.close();
		sf9.close();
		return imgpath;
	}
}
