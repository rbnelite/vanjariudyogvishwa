package com.rbnelite.udyogvishwa.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.MessageDao;
import com.rbnelite.udyogvishwa.dao.RegistrationDao;

public class MessageSer
{
               String fname="";
               String other="";
               String me="";
               String actual_msg="";
               public List getMessageConversation(String uname)
               {
              
               SessionFactory sf =  new Configuration().configure().buildSessionFactory(); 
               Session s=sf.openSession();
               List allUsers;
               ArrayList list=new ArrayList();
               s.beginTransaction();  
               Query queryResult = s.createQuery("from MessageDao where sender='"+uname+"'or Tomsg='"+uname+"' ");  
               allUsers = queryResult.list();
               for (int i = 0; i < allUsers.size(); i++)
               {  
               MessageDao mes = (MessageDao) allUsers.get(i);        
               other=mes.getSender();
               me=mes.getTomsg();
               actual_msg=mes.getMessage();
              list.add(actual_msg);
             
              
              Query queryResult3 = s.createQuery("from RegistrationDao where emailId='"+other+"'");  
              List allUsers3 = queryResult3.list();
               
               for (int k = 0; k < allUsers3.size(); k++)
              {  
               RegistrationDao reg = (RegistrationDao) allUsers3.get(k);  
               fname=reg.getfName();   
               list.add(fname);
               
              }
               
               }  
             
               s.getTransaction().commit();
               s.close();
               sf.close();
                return list;
               }
               
        public List getMessageInbox(String uname)
        {
             String inbox1="";
               String inbox2="";
               SessionFactory sf1 =  new Configuration().configure().buildSessionFactory(); 
               Session s1=sf1.openSession();
               s1.beginTransaction();  
               List allUsers;
               ArrayList list=new ArrayList();
               SQLQuery queryResult1 = s1.createSQLQuery("SELECT SenderID AS abc FROM tbl_message WHERE SenderID!='"+uname+"'  UNION SELECT ReceiverID AS abc FROM tbl_message WHERE ReceiverID!='"+uname+"' ORDER BY abc");
               queryResult1.getNamedParameters();
               allUsers = queryResult1.list();
               for (int i = 0; i < allUsers.size(); i++)
               {  
                inbox1=allUsers.get(i).toString();
                list.add(inbox1);
                }
                s1.getTransaction().commit();
                s1.close();
                sf1.close();
                return list;
        
        
        }
        
        
        
      
} 
   
