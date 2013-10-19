<%@page import="COM.RBNELITE.ENTITY.OtherDao"%>
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
    <style>
        body
        {
            font-family: Verdana;
            font-size: 12px;
        }
    </style>
</head>
<body>
     <form action="ActionController" method="post">
     <%
            String user_mail=(String)session.getAttribute("User_Name");
    %>
    
    <%
                String social_stat="";
                String poly_stat="";
                String social_act="";
                String poly_act="";
                String cultural_act="";
                String games="";
                List allUsers;
                SessionFactory sf7 = new Configuration().configure().buildSessionFactory(); 
               Session s7=sf7.openSession();
               s7.beginTransaction();  
             
               Query queryResult8 = s7.createQuery("from OtherDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult8.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               OtherDao con = (OtherDao) allUsers.get(i);        
              social_stat=con.getSocial_stat();
              poly_stat=con.getPoly_stat();
              social_act=con.getSocial_act();
              poly_act=con.getPoly_act();
              cultural_act=con.getCultural_act();
              games =con.getGames();      
              }
               s7.getTransaction().commit();
               s7.close();
               sf7.close();
 %>
    
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Social Status:
            </td>
            <td>
                <input type="text" name="soc_status" maxlength="30" style="width: 300px" value="<%=social_stat%>">
            </td>
        </tr>
        <tr>
            <td>
             Polytical Status:
            </td>
            <td>
                <input type="text" name="poly_status" maxlength="30" style="width: 300px" value="<%=poly_stat%>">
            </td>
        </tr>
        <tr>
            <td>
                Social Activity:
            </td>
            <td>
                <input type="text" name="soc_activity" maxlength="30" style="width: 300px" value="<%=social_act%>">
            </td>
        </tr>
        <tr>
            <td>
                Polytical Activity:
            </td>
            <td>
                <input type="text" name="poly_activity" maxlength="30" style="width: 300px" value="<%=poly_act%>">
            </td>
        </tr>
        <tr>
            <td>
                Cultural Activity:
            </td>
            <td>
                <input type="text" name="cul_activity" maxlength="30" style="width: 300px" value="<%=cultural_act%>">
            </td>
        </tr>
        <tr>
            <td>
                Games:
            </td>
            <td>
                <input type="text" name="games" maxlength="30" style="width: 300px" value="<%=games%>">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_other" value="Update" style="height: 30px; width: 100px;"/>
           </td>
        </tr>
    </table>
     </form>
  </body>
</html>
