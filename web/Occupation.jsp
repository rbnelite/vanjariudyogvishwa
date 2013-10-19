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
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/occupation_validation.js" type="text/javascript"></script>
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
        <title>Step1 Page</title>
</head>
  <body>
      <div id="main">
  <div id="hori">  
      <div id="new">
      <div id="search" class="button">
  <form action="#" method="post">
        <input type="text" value="Search" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}"><input type="submit" " class="button">
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
            <form action="ActionController" method="post" name="occupationform" id="occupationform">
<div id="container">
<div id="middle_step1">
<div id="step1">
<div id="img_step1">
<h1><b>Step 1</b></h1>
</div>
<div id="info_step1">
<table align="center">
<tr><td colspan="2"><br></tr>
<tr>
<td colspan="2"><font size="5">Fill Out Your Occupation or Business Details</font></td>
</tr>
<tr>
<td colspan="2">This Information will help us to Create Your Profile</td>
</tr>
<tr><td colspan="2"><hr/></td></tr>
<tr><td><br><br></td></tr>
<tr>
    <td>Currently Working (<font color="red">*</font>)</td><td><input type="text" name="org_name" id="org_name"size="30" maxlength="30">
                <div id="org_nameError" class="red" colspan="2"/></td>
            </tr>
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Occupation (<font color="red">*</font>)</td><td>
                    <select id="occupation" name="occupation" style="width: 200px;">
                        <option selected value="">--please select--</option>
                                                      <option>Admin Professional</option> 
                                                      <option>Actor</option>
                                                      <option>Advertising Professional</option>
                                                      <option>Agricultural Professional</option>
                                                      <option>Air Hostes</option>
                                                      <option>Architect</option>
                                                      <option>Airforce</option>
                                                      <option>Army</option>
                                                      <option>Agent/Broker</option>
                                                      <option>Animator</option>
                                                      <option>Banking Professional</option>
                                                      <option>Businessman</option>
                                                      <option>Charted Accountant</option>
                                                      <option>Company Secretory</option>
                                                      <option>Civil Engineer</option>
                                                      <option>Catering Professional</option>
                                                      <option>Commercial Artist</option>
                                                      <option>Customer Support/BPO/KPO</option>
                                                      <option>Doctor</option>
                                                      <option>Defence Services</option>
                                                      <option>Dentist</option>
                                                      <option>Entertainment Professional</option>
                                                      <option>Event Manager</option>
                                                      <option>Electronics/Telecom Engineer</option>
                                                      <option>Finance Professional</option>
                                                      <option>Fashion Designer</option>
                                                      <option>Farming</option>
                                                      <option>Human Resource Professional</option>
                                                      <option>Horticulturist</option>
                                                      <option>Hardware Network Professional</option>
                                                      <option>Investment Professional</option>
                                                      <option>Interior Designer</option>
                                                      <option>IAS/IES/IRS/IFS</option>
                                                      <option>Indian Police Service(IPS)</option>
                                                      <option>Jewellary Designer</option>
                                                      <option>Journalist</option>
                                                      <option>Lawyer</option>
                                                      <option>Lecturer</option>
                                                      <option>Landscape Architect</option>
                                                      <option>Media Professional</option>
                                                      <option>Marketing Professional</option>
                                                      <option>Mechanical/Production Engineer</option>
                                                      <option>Sr.Manager/Manager</option>
                                                      <option>Navy</option>
                                                      <option>Nurse</option>
                                                      <option>Other Airline Professional</option>
                                                      <option>Pilot</option>
                                                      <option>Professor</option>
                                                      <option>Poet</option>
                                                      <option>Politician</option>
                                                      <option>Research Asst.</option>
                                                      <option>Software Developer/Programmer</option>
                                                      <option>Software Consultant</option>
                                                      <option>Singer</option>
                                                      <option>Surgeon</option>
                                                      <option>Science Professional</option>
                                                      <option>Social Worker</option>
                                                      <option>Sportsman</option>
                                                      <option>Student</option>
                                                      <option>Teacher</option>
                                                      <option>Training Professional</option>
                                                      <option>Writer</option>
                                                      <option>Web Designer</option>
                                                      <option>Not Working</option>
                                                      <option>Other</option>
                                             </select>
                    <div id="occupationError" class="red" colspan="2"/>
                </td>
            </tr>
                       <tr><td colspan="2"><br></tr>
            <tr>
                <td>Product/Manufacturing Details (<font color="red">*</font>)</td><td><textarea name="product_details" style="resize: none;" id="product_details"rows="2" cols="23" maxlength="150" style="resize: none;" ></textarea>
                <div id="product_detailsError" class="red" colspan="2"/></td>
            </tr>
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Total Number of Employees (<font color="red">*</font>)</td><td><input type="text" name="total_emp" id="total_emp" size="30" maxlength="6">
                <div id="total_empError" class="red" colspan="2"/></td>
            </tr>
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Employment Type (<font color="red">*</font>)</td>
                <td><select name="emp_type" id="emp_type" style="width: 200px;">
                        <option selected value="">--Please Select--</option>
                        <option>Permanent</option>
                        <option>Contract</option>
                        <option>Trainee</option>
                        <option>Temporary</option>
                    </select>
                <div id="emp_typeError" class="red" colspan="2"/>
                </td>
            </tr>
            <tr><td colspan="2"><br></tr>
            <tr>
                <td> Annual Income (<font color="red">*</font>)</td><td><input type="text" name="annual_income" id="annual_income" size="30" maxlength="8">
                <div id="annual_incomeError" class="red" colspan="2"/></td>
            </tr>
            <tr><td colspan="2"><br></tr>
             <tr>
                <td></td>
                        <td align="right">

                            <input type="submit" name="save_occupation" id="submit" value="save & continue">
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
