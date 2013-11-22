<%@page import="com.rbnelite.udyogvishwa.model.Contact"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
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
                  String home="";
                  String office="";
                  String residential="";
                  String Telephone="";
                  List allUsers;
     SessionFactory sf4 = new Configuration().configure().buildSessionFactory(); 
               Session s4=sf4.openSession();
               s4.beginTransaction();  
             
               Query queryResult5 = s4.createQuery("from ContactDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult5.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               Contact con = (Contact) allUsers.get(i);        
              home=con.getHome_addr();
              office=con.getOff_addr();
              //residential=con.getRes_addr();
              Telephone=con.getTelephone();
              }
               s4.getTransaction().commit();
               s4.close();
               sf4.close();
              %>
     <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Home Address:
            </td>
            <td>
                <input type="text" name="home_addr" maxlength="50" style="width: 300px" value="<%=home%>">
            </td>
        </tr>
        <tr>
            <td>
             Official Address:
            </td>
            <td>
                <input type="text" name="off_addr" maxlength="50" style="width: 300px" value="<%=office%>">
            </td>
        </tr>
        
        <tr>
            <td>
                Telephone:
            </td>
            <td>
                <input type="text" name="telephone" maxlength="14" style="width: 300px" value="<%=Telephone%>">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_contact" value="Update" style="height: 30px; width: 100px;"/>
           </td>
        </tr>
    </table>
     </form>
  </body>
</html>
