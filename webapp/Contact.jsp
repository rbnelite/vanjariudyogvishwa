<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="com.rbnelite.udyogvishwa.dao.ProfileImageDao"%>
<%@page import="com.rbnelite.udyogvishwa.dao.LoginDao"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
   <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
   <script type="text/javascript" src="JavaScript/Conatct_validation.js" ></script>
   <link rel="stylesheet" href="CSS/FormValidation.css"/>
<script>
var modalWin = new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("images/loading.gif");
 modalWin.SetCloseButtonImagePath("images/remove.gif");
 //Uncomment below line to make look buttons as link
 //modalWin.SetButtonStyle("background:none;border:none;textDecoration:underline;cursor:pointer");

function ShowINeedPage(){
 var callbackFunctionArray = new Array(null, null);
 modalWin.ShowURL('pop_i_need.jsp',270,530,'Enter your need',null,callbackFunctionArray);
 }
 
 function isNumberKey(evt)
 {
    var charCode=(evt.which) ? evt.which :event.keyCode;
    if(charCode >31 && (charCode<48 || charCode >57))
        return false;
    return true;
 }
 
</script>
       <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("form").validationEngine();
        });
       </script>
        <title>Step2 Page</title>
       </head>
   <body>
        <div id="main">
   <div id="hori">  
        <div id="new">
            
        <div id="search" class="button">
        <form action="#" method="post" name="">
        <input type="text" value="Search" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}"><input type="submit" value="" class="button">
        </form>
           
            <%String user_mail=(String)session.getAttribute("User_Name"); %>
             
              <%  
               String lnames[]=new String[2]; 
               int n;
               LoginSer login=new LoginSer();
               List l10=login.getName(user_mail);
               Iterator it10=l10.iterator();
               while(it10.hasNext())
               {
                   for(n=0;n<lnames.length;n++)
                   lnames[n]=it10.next().toString();
               }
                             %>
            <table width="35%" align="right">
              <tr>
               <td>
                <font color="white" size="3"><b><%=lnames[0]%>&nbsp;<%=lnames[1]%></b></font></a>
               </td>
              </tr>
            </table>  
            </div>
           </div>
            <div id="header">
       <% 
           ProfileImage primg=new ProfileImage();
           String result=primg.getProfileImage(user_mail);        
           session.setAttribute("result",result);
       %>
            <div id="prf_img">
            
            <img src="<%=result%>" height="120" width="120" style="border-radius: 5px; margin-top:60px;">
            
            </div>
            </div>
            <div id="headerid">            
            </div>
          </div>
            <form action="ActionController" method="post" name="contact" id="contact">
                
        <div id="container">
           <div id="middle_step1">
                <div id="step1">
                    <div id="img_step1">
                     <font size="5"><b>Step 2</b></font>
                    </div>
                    <div id="info_step1">
                        <table align="center">
                            <tr><td colspan="2"><br></tr>
                            <tr>
                                <td colspan="2"><font size="5">Fill Out Your Contact Details</font></td>
                            </tr>
                           
                            <tr>
                                <td colspan="2">This Information will help us to Create Your Profile</td>
                            </tr>
                            <tr><td colspan="2"><hr/></td></tr>
                            <tr><td><br><br></td></tr>
                           
                <tr>
                    <td>Permanent Home Town (<font color="red">*</font>)</td><td><textarea name="home_ad" id="home_ad" rows="2" cols="25" maxlength="50" style="resize: none;"></textarea>
                    <div id="home_adError" class="red" colspan="2"/>
                    
                    </td>
                </tr>
                 <tr><td colspan="2"><br></tr>
                 <tr>
                     <td>Office Location (<font color="red">*</font>)</td><td><textarea name="off_ad" id="off_ad" rows="2" cols="25" maxlength="50" style="resize: none;"></textarea>
                     <div id="off_adError" class="red" colspan="2"/></td>
                 </tr>
                 <tr><td colspan="2"><br></tr>
                 
                 <tr>
                     <td>Telephone/mobile</td><td><input type="text" name="tel_no" id="tel_no" size="30" maxlength="12" onkeypress="return isNumberKey(event)">
                    <div id="tel_noError" class="red" colspan="2"/></td>
                </tr>
                <tr>
             <td></td>
             <td align="right">
                
                <input type="submit" id="submit" name="save_contact" value="save & continue" >
             </td>
             </tr>
            </table>
           </div>
            </div>
            </div>
           </div>
            </form>
        
        </div>
    </body>
</html>
