/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.BUSINESSPORTAL.SERVICE;

import COM.RBNELITE.ENTITY.ProfileImageDao;
import java.util.ArrayList;
import java.util.List;
import javax.security.auth.login.Configuration;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author RBNElite
 */
public class ProfileImage {
    
    public String getProfileImage(String user_mail)
    {
            String result="";
            String photo="";
            String p="";
            String a="/";
            String ab="";
            SessionFactory sf5 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
            Session s5=sf5.openSession();
            s5.beginTransaction();  
            List allUsers5;  
            Query queryResult5 = s5.createQuery("from ProfileImageDao where user_mail='"+user_mail+"'");  
            allUsers5 = queryResult5.list();
               
               for (int i = 0; i < allUsers5.size(); i++)
               {  
               ProfileImageDao prf_mmg = (ProfileImageDao)allUsers5.get(i);   
              photo=prf_mmg.getPath();
              p=photo.substring(73);  
              result= p.replace("\\", a) ;
             }
               s5.getTransaction().commit();
               s5.close();
               sf5.close();
               if(photo.equals("") || photo == null)
     
               {
                    result="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/33.png"; 
                    p=result.substring(73);
                    result= p.replace("\\", a);
               }
              return result;  
    }
    
   public List getImageforEvent()
   {
       String path="";
        String result1="";
            String photo1="";
            String p1="";
            String a1="/";
            String ab1="";
            ArrayList list=new ArrayList();
            SessionFactory sf51 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
            Session s51=sf51.openSession();
            s51.beginTransaction();  
           SQLQuery queryResult51 = s51.createSQLQuery("SELECT path FROM tbl_profileimages WHERE user_mail IN (SELECT DISTINCT user_mail FROM tbl_event)");  
           queryResult51.getNamedParameters();
                List allUsers51 = queryResult51.list();
                String uid = "";
                for (int i = 0; i < allUsers51.size(); i++) {
                    path = allUsers51.get(i).toString();
                    list.add(path);
                }
               
               s51.getTransaction().commit();
               s51.close();
               sf51.close();
               
               if(photo1.equals("") || photo1 == null)
     
               {
                    result1="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/BG 1.png"; 
                    p1=result1.substring(73);
                    result1= p1.replace("\\", a1);
               }
               //session.setAttribute("result",result1);
               return list;
               
   }
}
