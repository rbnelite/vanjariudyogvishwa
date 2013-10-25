<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.rbnelite.udyogvishwa.dao.RegistrationDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://
www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>People view</title>
</head>
<body>
 <div id="div3">
        <form method="post" action="#">
             <table width="400" height="150" style="background-color: bisque" border="1">
           
      <tr><td>
   <%
    String userName=(String)session.getAttribute("User_Name");
    //session.setAttribute("User_mail",userName); 
    %>  
     <h1> <%=userName%> </h1> 
  
     </td></tr> 
 </table>
         
      </form>
</div>
