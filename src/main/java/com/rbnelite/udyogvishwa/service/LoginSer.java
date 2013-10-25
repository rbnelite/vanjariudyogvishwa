package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.rbnelite.udyogvishwa.dao.LoginDao;

public class LoginSer {
     
    String fname;
    String lname;
    
    public List getName(String user_mail)
    {
        SessionFactory sf11 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
              Session s11=sf11.openSession();
              s11.beginTransaction();  
              List allUsers11;  
              ArrayList list=new ArrayList();
              Query queryResult11 = s11.createQuery("from LoginDao where email_id='"+user_mail+"'");  
              allUsers11 = queryResult11.list();
               
              for (int i = 0; i < allUsers11.size(); i++)
               {  
                LoginDao log = (LoginDao) allUsers11.get(i);        
                fname=log.getfName();
                lname=log.getlName();
                
                list.add(fname);
                list.add(lname);
               }
             s11.getTransaction().commit();
               s11.close();
               sf11.close();
               return list;
     
        
    }
}
