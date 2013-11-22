<%@page import="com.rbnelite.udyogvishwa.model.ReligionDao"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>

    <title>Untitled Page</title>
    <script>
         function EnrollNowClick()
        {
            window.parent.modalWin.CallCallingWindowFunction(0, 'Information Saved Scucessfully');
        }
    </script>
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
                String religion="";
                String cast="";
                String subcast="";
                String mthr_tng="";
                String native_place="";
                String gotre="";
                List allUsers;
                SessionFactory sf6 = new Configuration().configure().buildSessionFactory(); 
                Session s6=sf6.openSession();
               s6.beginTransaction();  
             
               Query queryResult7 = s6.createQuery("from ReligionDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult7.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               ReligionDao rel = (ReligionDao) allUsers.get(i);        
              religion=rel.getReligion();
              cast=rel.getCast();
              //subcast=rel.getSubcast();
              mthr_tng=rel.getMthr_tng();
              native_place=rel.getNative_place();
              //gotre=rel.getGotre();
              }
               s6.getTransaction().commit();
               s6.close();
               sf6.close();
                 %>
    <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Religion :
            </td>
            <td>
                <input type="text" name="religion" maxlength="20" style="width: 300px" value="<%=religion%>">
            </td>
        </tr>
        <tr>
            <td>
               Cast:
            </td>
            <td>
                <input type="text" name="cast" maxlength="20" style="width: 300px" value="<%=cast%>">
            </td>
        </tr>
        
        <tr>
            <td>
                Mother Tongue:
            </td>
            <td>
                <input type="text" name="mthr_tng" maxlength="20" style="width: 300px" value="<%=mthr_tng%>">
            </td>
        </tr>
        <tr>
            <td>
                Native Place:
            </td>
            <td>
                <input type="text" name="native_place" maxlength="20" style="width: 300px" value="<%=native_place%>">
            </td>
        </tr>
        
         <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_religion" value="Update Details" style="height: 30px; width: 100px;"/>
                
            </td>
        </tr>
    </table>
        </form>
  </body>
</html>
