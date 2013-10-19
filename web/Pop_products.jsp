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
     <%
            String user_mail=(String)session.getAttribute("User_Name");
     %>
     <form action="ActionController" method="post">
    <table cellpadding="2" cellspacing="10">
       <tr>
            <td>
             Product Name:
            </td>
            <td>
                <input type="text" name="prod_name" maxlength="30" style="width: 300px">
            </td>
        </tr>
        <tr>
            <td>
             Product Information:
            </td>
            <td>
                <textarea rows="4" cols="36" name="prod_info" maxlength="30"></textarea>
            </td>
        </tr>
        
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="add_product" value="Add Product" style="height: 30px; width: 100px;"/>
           </td>
        </tr>
    </table>
     </form>
  </body>
</html>
