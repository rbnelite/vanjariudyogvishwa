<%-- 
    Document   : Add_Photo
    Created on : Sep 17, 2013, 2:19:55 PM
    Author     : RBNelite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Product Image</title>
    </head>
    <body>
        <%
        int p_idd=(Integer)session.getAttribute("p_idd"); 
        
        int p_idd1=p_idd+1;
        
        session.setAttribute("p_idd1", p_idd1);
       %>
        <form method="post" action="UploadProductImage" ENCTYPE="multipart/form-data">
           <input type="file" name="photo_up" id="fileChooser" />

            <input type="submit" value="Upload Image"/>
        </form>
    </body>
</html>
