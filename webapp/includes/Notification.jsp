<%-- 
    Document   : Notification
    Created on : Oct 4, 2013, 3:02:33 PM
    Author     : RBNElite
--%>

<%@page import="com.rbnelite.udyogvishwa.dao.NotificationDao"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
    </head>
    <body>
        <%
    String userName=(String)session.getAttribute("User_Name");
    session.setAttribute("User_mail",userName); 
  %>
        <table style="background-color: bisque"> 
           <%
           String notification="";
           String notiDate="";
           String user_mail="";
           SessionFactory sf5 =  new Configuration().configure().buildSessionFactory(); 
            Session s5=sf5.openSession();
            s5.beginTransaction();
            List allUsers5;  
            Query queryResult5 = s5.createQuery("from NotificationDao where user_mail='"+userName+"'");  
            allUsers5 = queryResult5.list();
            for(int i=0;i<allUsers5.size();i++)
            {
                NotificationDao noti=(NotificationDao)allUsers5.get(i);
                notification=noti.getNotification();
                user_mail=noti.getUser_mail();
                notiDate=noti.getDate_time();
                %>
                <tr>
                <td>
                    <b><%=notification%></b> &nbsp;<font color="gray">at</font>
            &nbsp;
                <%=notiDate%>
            </td>
            </tr>
             <tr><td>&nbsp;</td></tr>
           <%
            }
           %>
            
        </table>
        
    </body>
</html>
