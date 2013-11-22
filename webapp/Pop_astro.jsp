<%@page import="com.rbnelite.udyogvishwa.model.Astro"%>
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
            %>
    <%
                  String country="";
                  String city="";
                  String zodiac="";
    
               SessionFactory sf3 =  new Configuration().configure().buildSessionFactory(); 
               Session s3=sf3.openSession();
               s3.beginTransaction();  
               List allUsers;
               Query queryResult4 = s3.createQuery("from AstroDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult4.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               Astro astro = (Astro) allUsers.get(i);        
              country=astro.getCountry();
              city=astro.getCity();
              zodiac=astro.getZodiac();
              }
               s3.getTransaction().commit();
               s3.close();
               sf3.close();
    %>
    <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Country:
            </td>
            <td>
                <input type="text" name="a_country" style="width: 300px" maxlength="30" value="<%=country%>">
                    
            </td>
        </tr>
        <tr>
            <td>
             City:
            </td>
            <td>
                <input type="text" name="a_city" style="width: 300px" maxlength="30" value="<%=city%>">
                     
            </td>
        </tr>
        <tr>
            <td>
                Zodiac:
            </td>
            <td>
                <input type="text" name="a_zodiac" style="width: 300px" maxlength="20" value="<%=zodiac%>">
                     
            </td>
        </tr>
       
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_astro" value="Update" style="height: 30px; width: 100px;"/>
           </td>
        </tr>
    </table>
     </form>
  </body>
</html>
