<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="com.rbnelite.udyogvishwa.model.ProfileImageDao"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rbnelite.udyogvishwa.model.LoginDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
         <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
         <script src="JavaScript/religion_validation.js" type="text/javascript"></script>
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
 
</script>
<title>Step3 Page</title>
</head>
    <body>
        <div id="main">
          <div id="hori">  
        <div id="new">
        <div id="search" class="button">
        <form action="#" method="post">
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
            <div id="prf_img"  >
            <img src="<%=result%>" height="120" width="120" style="border-radius: 5px; margin-top:60px;">
            
            </div>
            </div>
            <div id="headerid">
                       
            </div>
          </div>
            <form action="ActionController" method="post" name="religion" id="religion">
        <div id="container">
           
            <div id="middle_step1">
                <div id="step1">
                    <div id="img_step1">
                        <h1><b>Step 3</b></h1>
                    </div>
                    <div id="info_step1">
                        <table align="center">
                            <tr><td colspan="2"><br></tr>
                            <tr>
                                <td colspan="2"><font size="5">Fill Out Your Religion and Ethnicity Details</font></td>
                            </tr>
                           
                            <tr>
                                <td colspan="2">This Information will help us to Create Your Profile</td>
                            </tr>
                            <tr><td colspan="2"><hr/></td></tr>
                            <tr><td><br><br></td></tr>
                           
                <tr>
                    <td>Religion (<font color="red">*</font>)</td><td>
                        <select id="religion11" name="religion11">
                            <option selected value="">--Please Select--</option>
                            <option>Hindu</option>
                            <option>Muslim</option>
                            <option>Christen</option>
                            <option>Sikh</option>
                        </select>
                        
                    <div id="religion11Error" class="red" colspan="2"/></td>
                </tr>
                 <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Caste (<font color="red">*</font>)</td><td><input type="text" name="cast" id="cast" size="30" maxlength="20">
                    <div id="castError" class="red" colspan="2"/></td>
                </tr>
                              
                 <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Mother Tongue (<font color="red">*</font>)</td><td><input type="text" name="mother" id="mother"size="30" maxlength="20">
                    <div id="motherError" class="red" colspan="2"/></td>
                </tr>
                 <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Native Place (<font color="red">*</font>)</td><td><input type="text" name="natplace" id="natplace" size="30" maxlength="20">
                    <div id="natplaceError" class="red" colspan="2"/></td>
                </tr>
                 <tr><td colspan="2"><br></tr>
                  <tr>
                     <td></td>
                     <td align="right">
                    
                     <input type="submit" name="save_religion" id="submit" value="save&continue" >
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
