<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://
www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>AJAX content</title>
</head>
<body>
 <div id="div3">
        <form method="post" action="ProfileImageServlet" ENCTYPE="multipart/form-data">
   <%
    String userName=(String)session.getAttribute("User_Name");
    session.setAttribute("User_mail",userName); 
    %>
        <table align="center"><tr><td>
<h3>Please Select Image</h3></td></tr>
<tr>
    <td>
        <input type="file" name="prf_img"/>
    </td>
</tr>
<tr>
    <td>
        <input type="submit" value="Change Phpto"/>
    </td>
</tr>
            
</table>
         
      </form>
</div>
