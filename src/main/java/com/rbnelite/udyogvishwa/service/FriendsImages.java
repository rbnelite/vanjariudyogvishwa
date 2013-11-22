package com.rbnelite.udyogvishwa.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.rbnelite.udyogvishwa.model.ProfileImageDao;

public class FriendsImages {

	public String getProfileImage(String user_mail) {
		String result1 = "";
		String photo = "";
		String p = "";
		String a = "/";
		String ab = "";
		SessionFactory sf5 = new org.hibernate.cfg.Configuration().configure()
				.buildSessionFactory();
		Session s5 = sf5.openSession();
		s5.beginTransaction();
		List allUsers5;
		Query queryResult5 = s5
				.createQuery("from ProfileImage where user_mail='"
						+ user_mail + "'");
		allUsers5 = queryResult5.list();

		for (int i = 0; i < allUsers5.size(); i++) {
			ProfileImageDao prf_mmg = (ProfileImageDao) allUsers5.get(i);
			photo = prf_mmg.getPath();
			p = photo.substring(73);
			result1 = p.replace("\\", a);
		}
		s5.getTransaction().commit();
		s5.close();
		sf5.close();
		if (photo.equals("") || photo == null)

		{
			result1 = "C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/33.png";
			p = result1.substring(73);
			result1 = p.replace("\\", a);
		}
		return result1;
	}
}
