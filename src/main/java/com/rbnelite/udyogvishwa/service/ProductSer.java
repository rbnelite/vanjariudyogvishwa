package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.ProductDao;

/**
 * 
 * @author RBNElite
 */
public class ProductSer {
	String pName;
	String pDetails;

	public ArrayList getProduct(String user_mail) {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		List allUsers;
		ArrayList list = new ArrayList();
		Query queryResult = s.createQuery("from ProductDao where user_mail='"
				+ user_mail + "'");
		allUsers = queryResult.list();
		String p_name = "";
		String P_details = "";
		for (int i = 0; i < allUsers.size(); i++) {
			ProductDao product1 = (ProductDao) allUsers.get(i);
			pName = product1.getProductName();
			pDetails = product1.getProductInfo();

			list.add(pName);
			list.add(pDetails);
		}
		s.getTransaction().commit();
		s.close();
		sf.close();
		return list;
	}

}
