<%@page import="COM.RBNELITE.ENTITY.HobbiesDao"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  
    <script src="JavaScript/JScript.js" type="text/javascript"></script>
   <script>
         function EnrollNowClick()
        {
            window.parent.modalWin.CallCallingWindowFunction(0, 'Information Saved Scucessfully');
        }
    </script>
    <title>Untitled Page</title>
    <style>
        body
        {
            font-family: Verdana;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <%
            String user_mail=(String)session.getAttribute("User_Name");
           
   
               
    String hobbies="";
    String music="";
    String books="";
    String dress="";
    String tv="";
    String pref_movies="";
    String fav_movies="";
    String sports="";
    String cusine="";
    String food="";
    String vacation="";
     SessionFactory sf1 =  new Configuration().configure().buildSessionFactory(); 
               Session s1=sf1.openSession();
               s1.beginTransaction();  
             List allUsers; 
               Query queryResult2 = s1.createQuery("from HobbiesDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult2.list();
             
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
               cusine=edu.getCusine();
               food=edu.getFood();
               vacation=edu.getVacation();
               }
               s1.getTransaction().commit();
               s1.close();
               sf1.close();
%>
    <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Hobbies:
            </td>
            <td>
                <input type="text" name="hobies" style="width: 300px" maxlength="40" value="<%=hobbies%>">
                
            </td>
        </tr>
        <tr>
            <td>
             Favourite Music:
            </td>
            <td>
                <input type="text" name="fav_music" style="width: 300px" maxlength="40"value="<%=music%>">
             
            </td>
        </tr>
        <tr>
            <td>
                Favourite Books:
            </td>
            <td>
                <input type="text" name="fav_book" style="width: 300px"  maxlength="40"value="<%=books%>">
                     
            </td>
        </tr>
        <tr>
            <td>
                Dress Style:
            </td>
            <td>
                <input type="text" name="dress_style" style="width: 300px"  maxlength="40"value="<%=dress%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                Favourite TV Shows :
            </td>
            <td>
                <input type="text" name="fav_tv" style="width: 300px"  maxlength="40"value="<%=tv%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                Preferred Movies:
            </td>
            <td>
                <input type="text" name="pref_movie" style="width: 300px"  maxlength="40"value="<%=pref_movies%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                Favourite Movies:
            </td>
            <td>
                <input type="text" name="fav_movie" style="width: 300px"  maxlength="40"value="<%=fav_movies%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                 Sports/Fitness:
            </td>
            <td>
                <input type="text" name="sports" style="width: 300px"  maxlength="40"value="<%=sports%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                 Favourite Cuisine:
            </td>
            <td>
                <input type="text" name="fav_cusion" style="width: 300px"  maxlength="40"value="<%=cusine%>">
                    
            </td>
        </tr>
        <tr>
            <td>
                Food I Cook:
            </td>
            <td>
                <input type="text" name="food" style="width: 300px"  maxlength="40"value="<%=food%>">
                     
            </td>
        </tr>
        <tr>
            <td>
                Favourite Vacation Destination:
            </td>
            <td>
                <input type="text" name="fav_destination" style="width: 300px" maxlength="40" value="<%=vacation%>">
                     
            </td>
        </tr>
        
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_hobies" value="Update" style="height: 30px; width: 100px;"/>
           </td>
        </tr>
    </table>
   </form>
  </body>
</html>
