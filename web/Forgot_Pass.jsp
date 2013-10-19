<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Forgot password</title>
<script src="JavaScript/JScript.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_spa.css" type="text/css" />
<script>
    function submitForm()
    {
    document.anil.submit();
    }
</script>
</head>
<body  bgcolor="white ">
   
  
    <br></br> 
    <form action="ActionController"  method="post" name="anil" id="anil">    
  <table style="margin-top: 10px" align="center" width="" height="" border="0" > 
            <tr>
               
            </tr>
            <tr>
                <td width="150" align="center"> 
                    <font color="black" size="2.5px"> <b>  Email Id :  </b> </font>
             </td>
            
                <td width="300">       
			 
               
                  
 <input name="name" size="40" type="text" value="" />
                  </td>
            </tr>
             
  </table>
  <table style="margin-top: 10px" align="right" width="300" height="" border="0" > 
                <tr>
                    <td  >     
                      
                        <input  type="submit" name="Forgot_Pass" style="width: 100px" value="Submit" onclick="javascript:submitForm();self.close();return false;"/>
                        <input style="width: 100px" type="submit" value="Cancel" onclick="window.close()" />
		       
		     
                </td>
            </tr>
        </table>
 
 
	
              </form>
</body>
</html>

