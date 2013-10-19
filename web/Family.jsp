<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="java.util.Iterator"%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.LoginSer"%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.ProfileImage"%>
<%@page import="COM.RBNELITE.ENTITY.ProfileImageDao"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="COM.RBNELITE.ENTITY.LoginDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
        <script src="JavaScript/family_validation.js" type="text/javascript"></script>
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
        <title>Step4 Page</title>
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
            <form action="ActionController" method="post" name="family" id="family">
        <div id="container">
           
            <div id="middle_step1">
                <div id="step1">
                    <div id="img_step1">
                        <h1><b>Step 4</b></h1>
                    </div>
                    <div id="info_step1">
                        <table align="center">
                            <tr><td colspan="2"><br></tr>
                            <tr>
                                <td colspan="2"><font size="5">Fill Out Your Family Details</font></td>
                            </tr>
                           
                            <tr>
                                <td colspan="2">This Information will help us to Create Your Profile</td>
                            </tr>
                            <tr><td colspan="2"><hr/></td></tr>
                            <tr><td><br><br></td></tr>
                           
                 <tr>
                    <td>No. Of Family Members(<font color="red">*</font>)</td><td><input type="text" name="fmly_value" id="fmly_value" size="30" maxlength="3" onkeypress="return isNumberKey(event)">
                    <div id="fmly_valueError" class="red" colspan="2"/></td>
                </tr> 
                <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Family Type(<font color="red">*</font>)</td>
                    <td><select id="fmly_type" name="fmly_type" style="width: 200px;">
                            <option selected value="">--Please Select--</option>
                            <option>Nuclear</option> 
                            <option>Join</option>
                            
                                                      
                       </select>
                    <div id="fmly_typeError" class="red" colspan="2"/></td>
                </tr> 
                <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Family Status(<font color="red">*</font>)</td>
                    <td><select name="fmly_status" id="fmly_status" style="width: 200px;" > 
                            <option selected value="">--Please Select--</option>
                                                      <option>Poor</option> 
                                                      <option>Middle Class</option>
                                                      <option>Upper Middle Class</option>
                                                      <option>Lower Middle Class</option>
                                                      <option>Lower Class</option>
                                                      
                       </select>
                    <div id="fmly_statusError" class="red" colspan="2"/></td>
                </tr> 
                <tr><td colspan="2"><br></tr>
                <tr>
                    <td>Family Income(<font color="red">*</font>)</td><td><select id="fmly_income" name="fmly_income" style="width: 200px;">
                            <option selected value="">--Please Select--</option>
                                                      <option>Less than 100000</option> 
                                                      <option>100000-200000</option>
                                                      <option>200000-300000</option>
                                                      <option>300000-400000</option>
                                                      <option>400000-500000</option>
                                                      <option>500000-600000</option>
                                                      <option>600000-700000</option>
                                                      <option>700000-800000</option>
                                                      <option>800000-900000</option>
                                                      <option>900000-1000000</option>
                                                      <option>Greater than 1000000</option>
                                                      
                       </select>
                    <div id="fmly_incomeError" class="red" colspan="2"/></td>
                </tr>
                 
                        <tr>
                            <td></td>
                            <td align="right">
                                
                                <input type="submit" name="save_family" id="submit" value="save&continue" >
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
