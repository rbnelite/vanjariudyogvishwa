<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
     <script src="JavaScript/JScript.js" type="text/javascript"></script>
      <title>I Need</title>
     <script>
         function EnrollNowClick()
        {
            window.parent.modalWin.CallCallingWindowFunction(0, 'Information Saved Scucessfully');
        }
        
        function isNumberKey(evt)
 {
    var charCode=(evt.which) ? evt.which :event.keyCode;
    if(charCode >31 && (charCode<48 || charCode >57))
        return false;
    return true;
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
       java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime());
    %>
     <input type="hidden" name="mdate" value="<%=date%>"/>
     <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;" name="I_nedd" id="I_nedd">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                I need :
            </td>
            <td>
                <input type="text" name="need_what" value="ex:laptops on rent, cook" maxlength="30" style="width: 300px; color:#6e6e6e;" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}" />
            </td>
        </tr>
        <tr>
            <td>
               Description:
            </td>
            <td>
                <textarea cols="35" rows="1" name="need_desc" maxlength="80" ></textarea>
            </td>
        </tr>
        
        <tr>
            <td>
               My Mobile Number:
            </td>
            <td>
                 <input type="text" name="mobile" maxlength="10" style="width: 300px" onkeypress="return isNumberKey(event)"/>
            </td>
        </tr>
       
          <tr>
              <td></td>
               <td align="center">
                <input type="Submit" name="Save_need" id="submit" value="Save Details" style="height: 30px; width: 100px;">
              
            </td>
  
           
        </tr>
    </table>
    </form>
  </body>
    
</html>
