/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.BUSINESSPORTAL.SERVICE;

import COM.RBNELITE.ENTITY.AstroDao;
import COM.RBNELITE.ENTITY.ContactDao;
import COM.RBNELITE.ENTITY.EducationDao;
import COM.RBNELITE.ENTITY.FamilyDao;
import COM.RBNELITE.ENTITY.HobbiesDao;
import COM.RBNELITE.ENTITY.LifestyleDao;
import COM.RBNELITE.ENTITY.OtherDao;
import COM.RBNELITE.ENTITY.ProductDao;
import COM.RBNELITE.ENTITY.RegistrationDao;
import COM.RBNELITE.ENTITY.ReligionDao;
import java.util.ArrayList;
import java.util.List;
import javax.security.auth.login.Configuration;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author RBNelite
 */
public class ProfileSer {
    String fname;
    String mname;
    String lname;
    public List getMemberName( String user_mail)
    {
      
              SessionFactory sf11 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
              Session s11=sf11.openSession();
              s11.beginTransaction();  
              List allUsers11;  
              ArrayList list=new ArrayList();
              Query queryResult11 = s11.createQuery("from RegistrationDao where email_id='"+user_mail+"'");  
              allUsers11 = queryResult11.list();
               
              for (int i = 0; i < allUsers11.size(); i++)
               {  
                RegistrationDao reg = (RegistrationDao) allUsers11.get(i);        
                fname=reg.getfName();
                mname=reg.getmName();
                lname=reg.getlName();
                list.add(fname);
                list.add(mname);
                list.add(lname);
               }
             s11.getTransaction().commit();
               s11.close();
               sf11.close();
               return list;
                  
    }
    
    
    public List getEducationDetails(String user_mail)
    {
               String Pg_Clg="";
               String Pg_degree="";
               String clg="";
               String degree="";
               String school="";
               String grad_special="";
               String pg_special="";
               ArrayList list=new ArrayList();
               SessionFactory sf = new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
               Session s=sf.openSession();
               s.beginTransaction();  
               List allUsers;  
               Query queryResult = s.createQuery("from EducationDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult.list();
               
               for (int i = 0; i < allUsers.size(); i++)
               {  
               EducationDao edu = (EducationDao) allUsers.get(i);        
               Pg_Clg=edu.getPg_clg(); 
               Pg_degree=edu.getPg_degree();
               clg=edu.getClg();
               degree=edu.getGraduation();
               school=edu.getSchool();
               grad_special=edu.getOthr_graduation();
               pg_special=edu.getOthr_pg_degree();
               list.add(Pg_Clg);
               list.add(Pg_degree);
               list.add(clg);
               list.add(degree);
               list.add(school);
               list.add(grad_special);
               list.add(pg_special);
                  
             }
               s.getTransaction().commit();
               s.close();
               sf.close();
            return list;
    }
    
     public List getContactDetails(String user_mail)
     {
          String home="";
          String office="";
          String residential="";
          String Telephone="";
           
              SessionFactory sf4 = new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
              Session s4=sf4.openSession();
              s4.beginTransaction();  
              List allUsers;
              ArrayList list=new ArrayList();
              Query queryResult5 = s4.createQuery("from ContactDao where user_mail='"+user_mail+"'");  
              allUsers = queryResult5.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               ContactDao con = (ContactDao) allUsers.get(i);        
              home=con.getHome_addr();
              office=con.getOff_addr();
              Telephone=con.getTelephone();
              
              }
              s4.getTransaction().commit();
              s4.close();
              sf4.close();
              list.add(home);
              list.add(office);
              list.add(residential);
              list.add(Telephone);
            
              return list; 
             }
     
     public List getAstroDetails(String user_mail)
     {
          String country="";
          String city="";
          String zodiac="";
    
               SessionFactory sf3 =new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
               Session s3=sf3.openSession();
              s3.beginTransaction();  
             ArrayList list=new ArrayList();
              Query queryResult4 = s3.createQuery("from AstroDao where user_mail='"+user_mail+"'");  
              List allUsers = queryResult4.list();
             
              for (int i = 0; i < allUsers.size(); i++)
               {  
               AstroDao astro = (AstroDao) allUsers.get(i);        
             country=astro.getCountry();
              city=astro.getCity();
              zodiac=astro.getZodiac();
              list.add(country);
              list.add(city);
              list.add(zodiac);
              }
              s3.getTransaction().commit();
              s3.close();
              sf3.close();
              return list;
     }
     
     public List getFamilyDetails(String user_mail)
     {
          String fam_value="";
          String fam_type="";
          String fam_status="";
          String fam_income="";
          ArrayList list=new ArrayList();
              SessionFactory sf5 = new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
              Session s5=sf5.openSession();
              s5.beginTransaction();  
             
              Query queryResult6 = s5.createQuery("from FamilyDao where user_mail='"+user_mail+"'");  
               List allUsers = queryResult6.list();
             
              for (int i = 0; i < allUsers.size(); i++)
              {  
               FamilyDao fam = (FamilyDao) allUsers.get(i);        
              fam_value=fam.getFam_values();
              fam_type=fam.getFam_type();
              fam_status=fam.getFam_status();
              fam_income=fam.getFam_income();
              
              list.add(fam_value);
              list.add(fam_type);
              list.add(fam_status);
              list.add(fam_income);
              
             
              }
              s5.getTransaction().commit();
              s5.close();
              sf5.close();
               return list;
     }
     
     public List getReligionDetails(String user_mail)
     {
           String religion="";
                    String cast="";
                    String subcast="";
                    String mthr_tng="";
                    String native_place="";
                    String gotre="";
    ArrayList list=new ArrayList();
                SessionFactory sf6 = new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
                Session s6=sf6.openSession();
               s6.beginTransaction();  
             
              Query queryResult7 = s6.createQuery("from ReligionDao where user_mail='"+user_mail+"'");  
              List allUsers = queryResult7.list();
             
              for (int i = 0; i < allUsers.size(); i++)
               {  
               ReligionDao rel = (ReligionDao) allUsers.get(i);        
               religion=rel.getReligion();
               cast=rel.getCast();
               mthr_tng=rel.getMthr_tng();
                native_place=rel.getNative_place();
             list.add(religion);
             list.add(cast);
             list.add(mthr_tng);
             list.add(native_place);
              }
              s6.getTransaction().commit();
              s6.close();
              sf6.close();
              return list;
     }
     
     public List getLifeStyleDetails(String user_mail)
     {
    String diet="";
    String smoke="";
    String drink="";
    String complexion="";
    String body_type="";
    String bld_grp="";
    String weight="";
    //String spoken_lang="";
   ArrayList list=new ArrayList();
     SessionFactory sf2 =new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
             Session s2=sf2.openSession();
             s2.beginTransaction();  
            
             Query queryResult3 = s2.createQuery("from LifestyleDao where user_mail='"+user_mail+"'");  
             List allUsers = queryResult3.list();
             
             for (int i = 0; i < allUsers.size(); i++)
               {  
               LifestyleDao Lif = (LifestyleDao) allUsers.get(i);        
             diet=Lif.getDiet();
              smoke=Lif.getSmoke();
              drink=Lif.getDrink();
              complexion=Lif.getComplexion();
              body_type=Lif.getBody_type();
              bld_grp=Lif.getBld_grp();
              weight=Lif.getWeight();
              //spoken_lang=Lif.getSpoken_lang();
              
              list.add(diet);
              list.add(smoke);
              list.add(drink);
              list.add(complexion);
              list.add(body_type);
              list.add(bld_grp);
              list.add(weight);
              //list.add(spoken_lang);
              }
             s2.getTransaction().commit();
             s2.close();
             sf2.close();
             return list;
     }
     
    
     
     public List getHobbiedDetails(String user_mail)
     {
         String hobbies="";
    String music="";
    String books="";
    String dress="";
    String tv="";
    String pref_movies="";
    String fav_movies="";
    String sports="";
    //String cusine="";
    String food="";
    String vacation="";
    ArrayList list=new ArrayList();
     SessionFactory sf1 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
               Session s1=sf1.openSession();
             s1.beginTransaction();  
             
             Query queryResult2 = s1.createQuery("from HobbiesDao where user_mail='"+user_mail+"'");  
             List allUsers = queryResult2.list();
             
             for (int i = 0; i < allUsers.size(); i++)
               {  
               HobbiesDao edu = (HobbiesDao) allUsers.get(i);        
               hobbies=edu.getHobbies() ;
               music=edu.getMusic();
               books=edu.getBooks();
               dress=edu.getDress();
               tv=edu.getTv();
               pref_movies=edu.getPref_movies();
               fav_movies=edu.getFav_movies();
               sports=edu.getSports();
               
               food=edu.getFood();
               vacation=edu.getVacation();
               
               list.add(hobbies);
               list.add(music);
               list.add(books);
               list.add(dress);
               list.add(tv);
               list.add(pref_movies);
               list.add(fav_movies);
               list.add(sports);
               
               list.add(food);
               list.add(vacation);
             }
             s1.getTransaction().commit();
             s1.close();
             sf1.close();
             return list;
     }
     
     public List getOtgerDetails(String user_mail)
     {
                String social_stat="";
                String poly_stat="";
                String social_act="";
                String poly_act="";
                String cultural_act="";
                String games="";
                ArrayList list=new ArrayList();
                SessionFactory sf7 = new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
                Session s7=sf7.openSession();
                s7.beginTransaction();  
             
             Query queryResult8 = s7.createQuery("from OtherDao where user_mail='"+user_mail+"'");  
             List allUsers = queryResult8.list();
             
             for (int i = 0; i < allUsers.size(); i++)
               {  
               OtherDao con = (OtherDao) allUsers.get(i);        
              social_stat=con.getSocial_stat();
              poly_stat=con.getPoly_stat();
              social_act=con.getSocial_act();
              poly_act=con.getPoly_act();
              cultural_act=con.getCultural_act();
              games =con.getGames(); 
               
               list.add(social_stat);
               list.add(poly_stat);
               list.add(social_act);
               list.add(poly_act);
               list.add(cultural_act);
               list.add(games);
              }
             s7.getTransaction().commit();
             s7.close();
             sf7.close();
             return list;
     }
     
     public List getProductDetails(String user_mail)
     {
               String prod_name="";
               String prod_details="";
               ArrayList list=new ArrayList();
               SessionFactory sf10 =  new org.hibernate.cfg.Configuration().configure().buildSessionFactory(); 
               Session s10=sf10.openSession();
               s10.beginTransaction();  
               List allUsers10;  
               Query queryResult10 = s10.createQuery("from ProductDao where user_mail='"+user_mail+"'");  
               allUsers10 = queryResult10.list();
              for (int i = 0; i < allUsers10.size(); i++)
               {  
               ProductDao prod = (ProductDao) allUsers10.get(i);        
               prod_name=prod.getProductName();
               prod_details=prod.getProductInfo();
               list.add(prod_name);
               list.add(prod_details);
                }
               s10.getTransaction().commit();
               s10.close();
               sf10.close();
               return list;
     }
   }
