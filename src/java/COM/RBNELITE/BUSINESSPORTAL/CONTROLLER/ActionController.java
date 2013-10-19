package COM.RBNELITE.BUSINESSPORTAL.CONTROLLER;
import COM.RBNELITE.ENTITY.AstroDao;
import COM.RBNELITE.ENTITY.CommentDao;
import COM.RBNELITE.ENTITY.ContactDao;
import COM.RBNELITE.ENTITY.CreateEventDao;
import COM.RBNELITE.ENTITY.EducationDao;
import COM.RBNELITE.ENTITY.FamilyDao;
import COM.RBNELITE.ENTITY.FriendshipDao;
import COM.RBNELITE.ENTITY.Frnd_requestDao;
import COM.RBNELITE.ENTITY.HobbiesDao;
import COM.RBNELITE.ENTITY.I_needDao;
import COM.RBNELITE.ENTITY.LifestyleDao;
import COM.RBNELITE.ENTITY.LikeButtonDao;
import COM.RBNELITE.ENTITY.LoginDao;
import COM.RBNELITE.ENTITY.NotificationDao;
import COM.RBNELITE.ENTITY.OccupationDao;
import COM.RBNELITE.ENTITY.OtherDao;
import COM.RBNELITE.ENTITY.ProductDao;
import COM.RBNELITE.ENTITY.RegistrationDao;
import COM.RBNELITE.ENTITY.ReligionDao;
import COM.RBNELITE.ENTITY.StatusUpdateDao;
import COM.RBNELITE.ENTITY.UnlikeButtonDao;
import COM.RBNELITE.BUSINESSPORTAL.SERVICE.FriendRequest_Impl;
import COM.RBNELITE.BUSINESSPORTAL.SERVICE.GroupSer;
import COM.RBNELITE.BUSINESSPORTAL.SERVICE.LoginImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author RBNelite
 */
public class ActionController extends HttpServlet {

    private String LastLogin;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        ActionController ac = new ActionController();

        java.sql.Timestamp date11 = new java.sql.Timestamp(new java.util.Date().getTime());
        String now_date = date11.toString();
        if (request.getParameter("login") != null) {
            String uname = request.getParameter("user_name").trim();
            String pass = request.getParameter("pass");
            String User_Name = "";
            String Password = "";
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                String queryString = "from LoginDao where password='" + pass + "' and email_id='" + uname + "'";
                Query query = s.createQuery(queryString);
                List allUsers1 = query.list();
                if (allUsers1.isEmpty() == true) {
                     request.setAttribute("message", "User Name Or Password Is Incorrect.");
                    RequestDispatcher r = request.getRequestDispatcher("index.jsp");
                    r.forward(request, response);
                }
                Object queryResult = query.uniqueResult();
                LoginDao login = (LoginDao) queryResult;
                s.getTransaction().commit();
                User_Name = login.getEmailId();
                Password = login.getPass1();
                if (User_Name.equals(uname) && Password.equals(pass)) {
                    LoginImpl l = new LoginImpl();
                    // ac.RetriveData(User_Name,Password);
                    List allUsers;
                    Query queryResult1 = s.createQuery("from LoginDao where password='" + pass + "' and email_id='" + uname + "'");
                    allUsers = queryResult1.list();
                    String lastLogin = "";
                    for (int i = 0; i < allUsers.size(); i++) {
                        LoginDao login1 = (LoginDao) allUsers.get(i);
                        lastLogin = login1.getLastLogin();
                    }
                    session.setAttribute("User_Name", User_Name);
                    if (lastLogin == " " || lastLogin == null) {
                       
                        RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
                        r.forward(request, response);
                    } else {
                        RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
                        r.forward(request, response);
                    }

                    l.updateLogin(User_Name, Password);
                } else {
                }
                s.close();
                sf.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }



        if (request.getParameter("save_intrests") != null) {
            GroupSer group = new GroupSer();

            String uid=(String)session.getAttribute("User_Name"); 
         
            for(int i=1;i<=24;i++) 
           {
               switch(i)
               {
             case 1 : String sports = request.getParameter("sports");
                        if (sports!=null)
                            {
                            group.saveGroup(uid, sports);
                  
                 
                             } 
                            continue;
         
             case 2 : String drawing = request.getParameter("drawing");
                        if (drawing!=null)
                        {
                    
                        group.saveGroup(uid, drawing);
                 
                 
                     }
                        continue;
           
             case 3 : String photography = request.getParameter("photography"); 
                    if (photography!=null) {
                    group.saveGroup(uid, photography);
                
                        }
                    continue;
           
           case 4 :  String travelling = request.getParameter("travelling");
                        if (travelling!=null) {
                         group.saveGroup(uid, travelling);
               
                         }
                        continue;
           
            case 5 :  String music = request.getParameter("music");
                        if (music!=null) {
                        group.saveGroup(uid, music);
               
                         }
                         continue;   
         
            case 6 :String reading = request.getParameter("reading");
                if (reading!=null ) {
                group.saveGroup(uid, reading);
                }
                continue;
            
           case 7 :  String surfing = request.getParameter("surfing");
                    if (surfing!=null ) {
                        group.saveGroup(uid, surfing);
                            }
                        continue;
           
           case 8 :String bike_riding = request.getParameter("bike_riding");
                    if (bike_riding!=null) {
                    group.saveGroup(uid, bike_riding);
                    }
                    continue;
           
         case 9 :String car_riding = request.getParameter("car_riding");
                if (car_riding!=null) {
                group.saveGroup(uid, car_riding);
                }
                 continue;
            
             case 10 :String tracking = request.getParameter("tracking");
                     if (tracking!=null ) {
                        group.saveGroup(uid, tracking);
                      }
                     continue;
           
            case 11 : String movies = request.getParameter("movies");      
                         if (movies!=null ) {
                           group.saveGroup(uid, movies);
                         }
                         continue;
           
            case 12 : String social = request.getParameter("social");  
                        if (social!=null) {
                            group.saveGroup(uid, social);
                        }
                        continue;
            
            case 13 : String polytics = request.getParameter("polytics");
                        if (polytics!=null) {
                        group.saveGroup(uid, polytics);
                            }
                        continue;
            
             case 14 :  String friends = request.getParameter("friends");  
                         if (friends!=null) {
                         group.saveGroup(uid, friends);
                             }
                         continue;
            
           case 15 :String shopping = request.getParameter("shopping"); 
                             if (shopping!=null) {
                                group.saveGroup(uid, shopping);
                
                            }
                             continue;
            
           case 16 :String business = request.getParameter("business"); 
                        if (business!=null) {
                         group.saveGroup(uid, business);
                             }
                            continue;
            
           case 17 : String drama = request.getParameter("drama"); 
                        if (drama!=null) {
                          group.saveGroup(uid, drama);
                            }
                             continue;
            
           case 18 : String circus = request.getParameter("circus"); 
                        if (circus!=null) {
                        group.saveGroup(uid, circus);
                            }
                         continue;
            
            case 19 : String dance = request.getParameter("dance");
                        if (dance!=null) {
                         group.saveGroup(uid, dance);
                             }       
                            continue;
                
          case 20 : String culteral = request.getParameter("culteral");
                     if (culteral!=null) {
                         group.saveGroup(uid, culteral);
                         }
                        continue;
            
           case 21 :String speech = request.getParameter("speech");
                        if (speech!=null) {
                            group.saveGroup(uid, speech);
                             }
                     continue;
            
       case 22 : String gym = request.getParameter("gym");
                     if (gym!=null) {
                     group.saveGroup(uid, gym);
                      }
                 continue;
            
          case 23 :String teaching = request.getParameter("teaching");
              
                        if (teaching!=null) {
                        group.saveGroup(uid, teaching);
                         }
                            continue;
            
           case 24 :String spirituality = request.getParameter("spirituality");
                        if(spirituality!=null){
                        group.saveGroup(uid, spirituality);
                            }
                        break;
        }
           }
           
            RequestDispatcher r = request.getRequestDispatcher("Occupation.jsp");
            r.forward(request, response);
        }
        if (request.getParameter("Register") != null) {

            //RegistrationDao registration = new RegistrationDao();

            String fname = request.getParameter("fname").trim();
            String mname = request.getParameter("mname").trim();
            String lname = request.getParameter("lname").trim();
            String email = request.getParameter("email_id").trim();
            String contact=request.getParameter("contact").trim();
            String gender = request.getParameter("gender");

            String bday = request.getParameter("bday");
            String bmonth = request.getParameter("bmonth");
            String byear = request.getParameter("byear");
            String pass1 = request.getParameter("pass1");

            String bdate = bday + bmonth + byear;


            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                RegistrationDao r1 = new RegistrationDao();

                r1.setfName(fname);

                r1.setmName(mname);

                r1.setlName(lname);
                r1.setEmailId(email);
                session.setAttribute("User_Name", email);
                r1.setContact(contact);
                r1.setGender(gender);
                r1.setbDate(bdate);
                r1.setPass1(pass1);
                s.beginTransaction();
                s.save(r1);
                s.getTransaction().commit();
                s.close();
                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("Intrest_areas.jsp");
                r.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }


        if (request.getParameter("save_other") != null) {
            //OtherDao other=new OtherDao();
            String social_status = request.getParameter("social_status").trim();
            String polytical_status = request.getParameter("polytical_status").trim();
            String social_act = request.getParameter("social_act").trim();
            String polytical_act = request.getParameter("polytical_act").trim();
            String cultural_act = request.getParameter("cultural_act").trim();
            String games = request.getParameter("games").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                OtherDao oth = new OtherDao();
                oth.setSocial_stat(social_status);
                oth.setPoly_stat(polytical_status);
                oth.setSocial_act(social_act);
                oth.setPoly_act(polytical_act);
                oth.setCultural_act(cultural_act);
                oth.setGames(games);
                oth.setUser_mail(uid);
                s.beginTransaction();

                s.save(oth);

                s.getTransaction().commit();

                s.close();

                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
                r.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }

        }


        if (request.getParameter("save_lifestyle") != null) {

            String diet = request.getParameter("diet").trim();
            String smoke = request.getParameter("smoke").trim();
            String drink = request.getParameter("drink").trim();
            String complexion = request.getParameter("complexion").trim();
            String body_type = request.getParameter("bd_type").trim();
            String bld_grp = request.getParameter("bld_group").trim();
            String weight = request.getParameter("weight").trim();
            //String spoken_lang = request.getParameter("lang").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                LifestyleDao edu = new LifestyleDao();

                edu.setDiet(diet);
                edu.setSmoke(smoke);
                edu.setDrink(drink);
                edu.setComplexion(complexion);
                edu.setBody_type(body_type);
                edu.setBld_grp(bld_grp);
                edu.setWeight(weight);
                //edu.setSpoken_lang(spoken_lang);
                edu.setUser_mail(uid);
                s.beginTransaction();

                s.save(edu);

                s.getTransaction().commit();

                s.close();

                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("HobbiesDetails.jsp");
                r.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }

        }


        if (request.getParameter("save_occupation") != null) {
            String org_name = request.getParameter("org_name").trim();
            String occupation = request.getParameter("occupation").trim();
            String products = request.getParameter("product_details").trim();
            String tot_emp = request.getParameter("total_emp").trim();
            String emp_type = request.getParameter("emp_type").trim();
            String annual_income = request.getParameter("annual_income").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                OccupationDao occ = new OccupationDao();
                occ.setOrg_name(org_name);
                occ.setOccupation(occupation);
                occ.setProduct_details(products);
                occ.setTotal_emp(tot_emp);
                occ.setEmp_type(emp_type);
                occ.setAnnual_income(annual_income);
                occ.setUser_mail(uid);
                s.beginTransaction();
                s.save(occ);
                    
                s.getTransaction().commit();

                s.close();

                sf.close();
                response.sendRedirect("Contact.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        }




        if (request.getParameter("save_hobbies") != null) {

            String hobbies = request.getParameter("hobbies").trim();
            String music = request.getParameter("fav_music").trim();
            String books = request.getParameter("fav_books").trim();
            String dress = request.getParameter("dress_style").trim();
            String tv = request.getParameter("fav_tvShows").trim();
            String pref_movies = request.getParameter("pref_movies").trim();
            String fav_movies = request.getParameter("fav_movies").trim();
            String sports = request.getParameter("sports").trim();
            //String cusine = request.getParameter("fav_cusine").trim();
            String food = request.getParameter("food").trim();
            String vacation = request.getParameter("vac_dest").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                HobbiesDao hob = new HobbiesDao();
                hob.setHobbies(hobbies);
                hob.setMusic(music);
                hob.setBooks(books);
                hob.setDress(dress);
                hob.setTv(tv);
                hob.setPref_movies(pref_movies);
                hob.setFav_movies(fav_movies);
                hob.setSports(sports);
                //hob.setCusine(cusine);
                hob.setFood(food);
                hob.setVacation(vacation);
                hob.setUser_mail(uid);
                s.beginTransaction();

                s.save(hob);

                s.getTransaction().commit();

                s.close();

                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("OtherDetails.jsp");
                r.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }


        if (request.getParameter("save_education_work") != null) {
            String school = request.getParameter("school_name").trim();
            String clg = request.getParameter("clg_name").trim();
            String grad = request.getParameter("graduation").trim();
            String othr_grad = request.getParameter("othr_graduation").trim();
            String pg_clg = request.getParameter("pg_clg").trim();
            String pg_degree = request.getParameter("pg_degree").trim();
            String othr_pg = request.getParameter("othr_pg").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                EducationDao edu = new EducationDao();

                edu.setSchool(school);
                edu.setClg(clg);
                edu.setGraduation(grad);
                edu.setOthr_graduation(othr_grad);
                edu.setPg_clg(pg_clg);
                edu.setPg_degree(pg_degree);
                edu.setOthr_pg_degree(othr_pg);

                edu.setUser_mail(uid);
                s.beginTransaction();

                s.save(edu);

                s.getTransaction().commit();

                s.close();

                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("LifestyleDetails.jsp");
                r.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }


        if (request.getParameter("save_astro") != null) {
            String country = request.getParameter("country").trim();
            String city = request.getParameter("city").trim();
            String zodiac = request.getParameter("zodiac").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                AstroDao as = new AstroDao();
                as.setCountry(country);
                as.setCity(city);
                as.setZodiac(zodiac);
                as.setUser_mail(uid);
                s.beginTransaction();
                s.save(as);
                s.getTransaction().commit();
                s.close();
                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("Education_work.jsp");
                r.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }


        if (request.getParameter("save_contact") != null) {
            String home_addr = request.getParameter("home_ad").trim();
            String off_addr = request.getParameter("off_ad").trim();
            String telephone = request.getParameter("tel_no").trim();
            String uid = (String) session.getAttribute("User_Name");
            //String uid="abc";

            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                ContactDao r2 = new ContactDao();
                r2.setHome_addr(home_addr);
                r2.setOff_addr(off_addr);
                r2.setTelephone(telephone);
                r2.setUid(uid);
                s.beginTransaction();
                s.save(r2);
                s.getTransaction().commit();
                s.close();
                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("Religion.jsp");
                r.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        if (request.getParameter("save_family") != null) {
            String fam_values = request.getParameter("fmly_value").trim();
            String fam_type = request.getParameter("fmly_type").trim();
            String fam_status = request.getParameter("fmly_status").trim();
            String fam_income = request.getParameter("fmly_income").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                FamilyDao f = new FamilyDao();
                f.setFam_values(fam_values);
                f.setFam_type(fam_type);
                f.setFam_status(fam_status);
                f.setFam_income(fam_income);
                f.setUid(uid);
                s.beginTransaction();
                s.save(f);
                s.getTransaction().commit();
                s.close();
                sf.close();
                RequestDispatcher r = request.getRequestDispatcher("Astro.jsp");
                r.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        if (request.getParameter("save_religion") != null) {
            String religion = request.getParameter("religion11").trim();
            String cast = request.getParameter("cast").trim();
            String subcas = request.getParameter("subcaste").trim();
            String mthr_tng = request.getParameter("mother").trim();
            String native_place = request.getParameter("natplace").trim();
            String gotra = request.getParameter("gothra").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                ReligionDao s3 = new ReligionDao();
                s3.setReligion(religion);
                s3.setCast(cast);

                s3.setMthr_tng(mthr_tng);
                s3.setNative_place(native_place);

                s3.setUser_mail(uid);
                s.beginTransaction();
                s.save(s3);
                s.getTransaction().commit();
                s.close();
                sf.close();
                

            } catch (Exception e) {
                System.out.println(e);
            }
            RequestDispatcher r = request.getRequestDispatcher("Family.jsp");
                r.forward(request, response);
        }

        if (request.getParameter("add_product") != null) {
            String prod_name = request.getParameter("prod_name").trim();
            String prod_Info = request.getParameter("prod_info").trim();
            String uid =(String)session.getAttribute("User_Name");
             try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                ProductDao product = new ProductDao();
                product.setProductName(prod_name);
                product.setProductInfo(prod_Info);
                product.setUser_mail(uid);
                s.beginTransaction();
                s.save(product);
                s.getTransaction().commit();
                s.close();
                sf.close();

            } catch (Exception e) {
                System.out.println(e);
            }
            
            
          
        }

        if (request.getParameter("update_education") != null) {

            String school = request.getParameter("school").trim();
            String clg = request.getParameter("clg").trim();
            String graduation = request.getParameter("graduation").trim();
            String othr_degree = request.getParameter("othr_degree").trim();
            String pg_clg = request.getParameter("pg_clg").trim();
            String post_graduation = request.getParameter("post_graduation").trim();
            String othr_pg_degree = request.getParameter("othr_pg_degree").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from EducationDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                System.out.println("# of rows: " + allUsers.size());
                for (int i = 0; i < allUsers.size(); i++) {
                    EducationDao user = (EducationDao) allUsers.get(i);
                    System.out.println(user);
                    user.setSchool(school);
                    user.setClg(clg);
                    user.setGraduation(graduation);
                    user.setOthr_graduation(post_graduation);
                    user.setPg_clg(pg_clg);
                    user.setPg_degree(othr_degree);
                    user.setOthr_pg_degree(othr_pg_degree);
                    s.update(user);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }
                

            } catch (Exception e) {
                System.out.println(e);
            }
            //RequestDispatcher r = request.getRequestDispatcher("Profile.jsp?iPagNo=1");
           //r.forward(request, response);
            
            response.sendRedirect("Profile.jsp?iPagNo=1");
            
        }

        if (request.getParameter("update_religion") != null) {
            String religion = request.getParameter("religion").trim();
            String cast = request.getParameter("cast").trim();
            String subcast = request.getParameter("subcast").trim();
            String mthr_tng = request.getParameter("mthr_tng").trim();
            String native_place = request.getParameter("native_place").trim();
            String gotra = request.getParameter("gotra").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from ReligionDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    ReligionDao rel = (ReligionDao) allUsers.get(i);
                    rel.setReligion(religion);
                    rel.setCast(cast);

                    rel.setMthr_tng(mthr_tng);
                    rel.setNative_place(native_place);


                    s.update(rel);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();

                }

            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }


        if (request.getParameter("update_contact") != null) {
            String home_addr = request.getParameter("home_addr").trim();
            String off_addr = request.getParameter("off_addr").trim();
            String res_addr = request.getParameter("res_addr").trim();
            String telephone = request.getParameter("telephone").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from ContactDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    ContactDao con = (ContactDao) allUsers.get(i);
                    con.setHome_addr(home_addr);
                    con.setOff_addr(off_addr);
                    con.setTelephone(telephone);
                    s.update(con);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }

            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }

        if (request.getParameter("update_family") != null) {
            String fmly_values = request.getParameter("fmly_values").trim();
            String fmly_type = request.getParameter("fmly_type").trim();
            String fmly_status = request.getParameter("fmly_status").trim();
            String fmly_incom = request.getParameter("fmly_incom").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from FamilyDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    FamilyDao fam = (FamilyDao) allUsers.get(i);
                    fam.setFam_values(fmly_values);
                    fam.setFam_type(fmly_type);
                    fam.setFam_status(fmly_status);
                    fam.setFam_income(fmly_incom);

                    s.update(fam);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }

            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }

        if (request.getParameter("update_astro") != null) {
            String a_country = request.getParameter("a_country").trim();
            String a_city = request.getParameter("a_city").trim();
            String a_zodiac = request.getParameter("a_zodiac").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from AstroDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    AstroDao astro = (AstroDao) allUsers.get(i);
                    astro.setCountry(a_country);
                    astro.setCity(a_city);
                    astro.setZodiac(a_zodiac);

                    s.update(astro);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }

        if (request.getParameter("update_lifestyle") != null) {

            String diet = request.getParameter("diet").trim();
            String smoke = request.getParameter("smoke").trim();
            String drink = request.getParameter("drink").trim();
            String complexion = request.getParameter("complx").trim();
            String body_type = request.getParameter("body_type").trim();
            String bld_grp = request.getParameter("bld_grp").trim();
            String weight = request.getParameter("weight").trim();
            //String spoken_lang = request.getParameter("lang").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from LifestyleDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    LifestyleDao life = (LifestyleDao) allUsers.get(i);

                    life.setDiet(diet);
                    life.setSmoke(smoke);
                    life.setDrink(drink);
                    life.setComplexion(complexion);
                    life.setBody_type(body_type);
                    life.setBld_grp(bld_grp);
                    life.setWeight(weight);
                    //life.setSpoken_lang(spoken_lang);

                    s.update(life);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }
        if (request.getParameter("update_hobies") != null) {
            String hobies = request.getParameter("hobies").trim();
            String fav_music = request.getParameter("fav_music").trim();
            String fav_book = request.getParameter("fav_book").trim();
            String dress_style = request.getParameter("dress_style").trim();
            String fav_tv = request.getParameter("fav_tv").trim();
            String pref_movie = request.getParameter("pref_movie").trim();
            String fav_movie = request.getParameter("fav_movie").trim();
            String sports = request.getParameter("sports").trim();
            //String fav_cusion = request.getParameter("fav_cusion").trim();
            String food = request.getParameter("food").trim();
            String fav_destination = request.getParameter("fav_destination").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from HobbiesDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    HobbiesDao hob = (HobbiesDao) allUsers.get(i);
                    hob.setHobbies(hobies);
                    hob.setMusic(fav_music);
                    hob.setBooks(fav_book);
                    hob.setDress(dress_style);
                    hob.setTv(fav_tv);
                    hob.setPref_movies(pref_movie);
                    hob.setFav_movies(fav_movie);
                    hob.setSports(sports);
                    //hob.setCusine(fav_cusion);
                    hob.setFood(food);
                    hob.setVacation(fav_destination);
                    s.update(hob);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }

            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }


        if (request.getParameter("update_other") != null) {
            String soc_status = request.getParameter("soc_status").trim();
            String poly_status = request.getParameter("poly_status").trim();
            String soc_activity = request.getParameter("soc_activity").trim();
            String poly_activity = request.getParameter("poly_activity").trim();
            String cul_activity = request.getParameter("cul_activity").trim();
            String games = request.getParameter("games").trim();
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from OtherDao where user_mail='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    OtherDao oth = (OtherDao) allUsers.get(i);
                    oth.setSocial_stat(soc_status);
                    oth.setPoly_stat(poly_status);
                    oth.setSocial_act(soc_activity);
                    oth.setPoly_act(poly_activity);
                    oth.setCultural_act(cul_activity);
                    oth.setGames(games);
                    s.update(oth);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }

        if (request.getParameter("create_event") != null) {
            String event_name = request.getParameter("event_name").trim();
            String event_details = request.getParameter("event_details").trim();
            String event_location = request.getParameter("event_location").trim();
            String event_time = request.getParameter("event_date").trim();
            String uid = (String) session.getAttribute("User_Name");
            try {

                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                CreateEventDao ce = new CreateEventDao();
                ce.setName(event_name);
                ce.setDetails(event_details);
                ce.setLocation(event_location);
                ce.setDate_time(event_time);
                ce.setUser_mail(uid);
                s.beginTransaction();

                s.save(ce);

                s.getTransaction().commit();

                s.close();

                sf.close();


            } catch (Exception e) {
                System.out.println(e);
            }

        }

        if (request.getParameter("Save_need") != null) {
            String need_what = request.getParameter("need_what").trim();
            String need_desc = request.getParameter("need_desc").trim();
            String mobile = request.getParameter("mobile").trim();
            String uid = (String) session.getAttribute("User_Name");
            String status = uid + " needs " + need_what;
            //String mdate=request.getParameter("mdate");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                I_needDao need = new I_needDao();
                need.setNeed(need_what);
                need.setDescription(need_desc);
                need.setMno(mobile);
                need.setUser_mail(uid);

                NotificationDao not = new NotificationDao();
                not.setNotification(status);
                not.setDate_time(now_date);
                not.setUser_mail(uid);

                s.beginTransaction();
                s.save(need);
                s.save(not);
                s.getTransaction().commit();
                s.close();
                sf.close();
             RequestDispatcher r=request.getRequestDispatcher("Home.jsp");
             r.forward(request, response);
              
            } catch (Exception e) {
                System.out.println(e);
            }
            
            
        }

        if (request.getParameter("Accept") != null) {

            String to = request.getParameter("e_id").trim();

            String date = request.getParameter("date").trim();

            String Status = "A";
            String uid = (String) session.getAttribute("User_Name");
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                FriendshipDao r1 = new FriendshipDao();
                r1.setDate(date);
                r1.setWho_frd(to);
                r1.setWhom_frd(uid);
                s.beginTransaction();
                s.save(r1);
                s.getTransaction().commit();
                FriendRequest_Impl frdimpl = new FriendRequest_Impl();
                frdimpl.Update_Status(Status, uid, to);
                s.close();
                sf.close();
                response.sendRedirect("Home.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        if (request.getParameter("RejectFriend") != null) {

            String to = request.getParameter("e_id").trim();

            String date = request.getParameter("date").trim();
            String Status = "R";
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                s.beginTransaction();
                List allUsers;
                Query queryResult = s.createQuery("from Frnd_requestDao where req_to='" + to + "' and req_from='" + uid + "'");
                allUsers = queryResult.list();
                for (int i = 0; i < allUsers.size(); i++) {
                    Frnd_requestDao rel = (Frnd_requestDao) allUsers.get(i);
                    rel.setReq_status(Status);
                    s.update(rel);
                    s.getTransaction().commit();
                    s.close();
                    sf.close();
                    response.sendRedirect("Home.jsp");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        if (request.getParameter("Connect") != null) {
            String to = request.getParameter("fre_req_id").trim();
            String date = request.getParameter("date").trim();
            String Status = "N";
            String uid = (String) session.getAttribute("User_Name");

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Frnd_requestDao r1 = new Frnd_requestDao();
                r1.setReq_date(date);
                r1.setReq_from(uid);
                r1.setReq_to(to);
                r1.setReq_status(Status);
                s.beginTransaction();
                s.save(r1);
                s.getTransaction().commit();
                s.close();
                sf.close();
                response.sendRedirect("Home.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        if (request.getParameter("Status_update") != null) {
            String post = request.getParameter("status_post").trim();
            String date = request.getParameter("date").trim();
            String uid = (String) session.getAttribute("User_Name");
            String status = uid + " updated his status as " + post;

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                StatusUpdateDao r1 = new StatusUpdateDao();
                r1.setStatus_details(post);
                r1.setStatus_date(date);
                r1.setUser_email(uid);

                NotificationDao n1 = new NotificationDao();
                n1.setNotification(status);
                n1.setDate_time(date);
                n1.setUser_mail(uid);

                s.beginTransaction();
                s.save(r1);
                s.save(n1);
                s.getTransaction().commit();
                s.close();
                sf.close();
                response.sendRedirect("Home.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        if (request.getParameter("Status_update_profile") != null) {
            String post = request.getParameter("status_post").trim();
            String date = request.getParameter("date").trim();
            String uid = (String) session.getAttribute("User_Name");
            String status = uid + " updated his status as " + post;
           

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                StatusUpdateDao r1 = new StatusUpdateDao();
                r1.setStatus_details(post);
                r1.setStatus_date(date);
                r1.setUser_email(uid);

                NotificationDao n2 = new NotificationDao();
                n2.setNotification(status);
                n2.setDate_time(date);
                n2.setUser_mail(uid);

                s.beginTransaction();
                s.save(r1);
                s.save(n2);
                s.getTransaction().commit();
                s.close();
                sf.close();
                
            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("Profile.jsp?iPagNo=1");
        }

        if (request.getParameter("Forgot_Pass") != null) {
            String pass = "";
            String validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            Random generator = new Random();
            for (int i = 0; i < 10; i++) {
                pass += validChars.charAt(generator.nextInt(validChars.length()));
            }
            String count = "";
            String uname = request.getParameter("name").trim();
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            s.beginTransaction();
            List allUsers;
            Query queryResult = s.createQuery("from RegistrationDao where emailId='" + uname + "'");
            allUsers = queryResult.list();
            String uid = "";
            for (int i = 0; i < allUsers.size(); i++) {
                RegistrationDao reg = (RegistrationDao) allUsers.get(i);
                uid = reg.getEmailId();
                if (uid.equals(uname)) {
                    count = "y";
                }


                if (count.equals("y")) {

                    reg.setPass1(pass);

                }
            }
            s.getTransaction().commit();
            s.close();
            sf.close();

        }


        if (request.getParameter("myfield") != null) {
            String comment = request.getParameter("comment").trim();

            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();

                Session s = sf.openSession();

                CommentDao ce = new CommentDao();
                ce.setCmnt(comment);

                s.save(ce);
                s.getTransaction().commit();
                s.close();
                sf.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
            r.forward(request, response);
        }


        if (request.getParameter("LikeButton") != null) {
            String cn = "";
            String uame = (String) session.getAttribute("User_Name");
            String status_id = request.getParameter("status_id11");
            int cnt = 1;
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                SQLQuery queryResult = s.createSQLQuery("SELECT COUNT(l.count) FROM tbl_like l WHERE `sataus_id`='" + status_id + "'");
                queryResult.getNamedParameters();
                List allUsers = queryResult.list();
                String uid = "";
                for (int i = 0; i < allUsers.size(); i++) {
                    cn = allUsers.get(i).toString();
                }

                s.beginTransaction();
                LikeButtonDao like = new LikeButtonDao();
                like.setLike_count(cnt);
                like.setStatus_id(status_id);
                like.setNames(uame);
                s.save(like);
                s.getTransaction().commit();
                s.close();
                sf.close();
                response.sendRedirect("Home.jsp");

            } catch (Exception e) {
                System.out.println(e);
            }
            

        }

        if (request.getParameter("UnlikeButton") != null) {
            String cn = "";
            String uame = (String) session.getAttribute("User_Name");
            String status_id = request.getParameter("status_id11");
            int cnt = 1;
            try {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                SQLQuery queryResult = s.createSQLQuery("SELECT COUNT(l.count) FROM tbl_unlike l WHERE `status_id`='" + status_id + "'");
                queryResult.getNamedParameters();
                List allUsers = queryResult.list();
                String uid = "";
                for (int i = 0; i < allUsers.size(); i++) {
                    cn = allUsers.get(i).toString();
                }

                s.beginTransaction();
                UnlikeButtonDao unlike = new UnlikeButtonDao();
                unlike.setCount(cnt);
                unlike.setNames(uame);
                unlike.setStatus_id(status_id);
                s.save(unlike);
                s.getTransaction().commit();
                s.close();
                sf.close();
                response.sendRedirect("Home.jsp");

            } catch (Exception e) {
                System.out.println(e);
            }

        }
        
        
         if (request.getParameter("Go_friend") != null) {
         
             String mail=request.getParameter("mail").trim();
             session.setAttribute("mail", mail);
            System.out.println(mail+" :mailll");
             //RequestDispatcher r= request.getRequestDispatcher("Friends_Profile?iPagNo=1.jsp");
             //r.forward(request, response);
           response.sendRedirect("Friends_Profile.jsp?iPagNo=1");

        }

    }

// all service method are here
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
