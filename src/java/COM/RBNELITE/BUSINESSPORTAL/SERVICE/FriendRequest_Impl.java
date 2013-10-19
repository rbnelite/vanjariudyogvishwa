/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.BUSINESSPORTAL.SERVICE;

import COM.RBNELITE.ENTITY.Frnd_requestDao;
import COM.RBNELITE.ENTITY.OtherDao;
import COM.RBNELITE.ENTITY.ReligionDao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author RBNelite
 */
public class FriendRequest_Impl 

{

    public void Update_Status(String status,String userId,String to_User_id)
    {
        
        try
                            {
                            SessionFactory sf =  new Configuration().configure().buildSessionFactory();
                            Session s=sf.openSession();
                            s.beginTransaction();  
                            List allUsers;  
                             Query queryResult = s.createQuery("FROM Frnd_requestDao F  WHERE  F.req_status='N' AND F.req_to='"+userId+"' and F.req_from='"+to_User_id+"'");  
                allUsers = queryResult.list();   
                for (int i = 0; i < allUsers.size(); i++) 
                {  
                Frnd_requestDao frd = (Frnd_requestDao) allUsers.get(i);   
                frd.setReq_status(status); 
                 s.beginTransaction();
                s.update(frd);  
                s.getTransaction().commit();
                }  
                   s.close();
                   sf.close();

                   
                 
                 
    }
        catch(Exception e)
        {
            
        }
    
}
}
