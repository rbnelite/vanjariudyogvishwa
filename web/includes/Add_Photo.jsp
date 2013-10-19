<%-- 
    Document   : Add_Photo
    Created on : Sep 17, 2013, 2:19:55 PM
    Author     : RBNelite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form method="post" action="UploadServlet" ENCTYPE="multipart/form-data">
    <%
    String userName=(String)session.getAttribute("User_Name");
    session.setAttribute("User_mail",userName); 
    %>
       
   Upload Photo:
   <input type="hidden" name="aaa" id="aaa"value="<%=userName%>">
   <input type="file" name="photo_up" id="fileChooser" />
  
<input type="submit" value="Upload" />
</form>
    </body>
</html>
