<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>

<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.LoginSer"%>
<%@page import="java.util.Iterator"%>
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
        <script src="JavaScript/astro_validation.js" type="text/javascript"></script>
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
        <title>Step4 Page</title>
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
            <br>
            </div>
            </div>
            <div id="headerid">            
            </div>
          </div>
            <form action="ActionController" method="post" name="astro" id="astro">
<div id="container">
<div id="middle_step1">
<div id="step1">
<div id="img_step1">
<h1><b>Step 5</b></h1>
</div>
<div id="info_step1">
<table align="center">
<tr><td colspan="2"><br></tr>
<tr>
<td colspan="2"><font size="5">Fill Out Your Astro Details</font></td>
</tr>
<tr>
<td colspan="2">This Information will help us to Create Your Profile</td>
</tr>
<tr><td colspan="2"><hr/></td></tr>
<tr><td><br><br></td></tr>
<tr>
    <td>Country (<font color="red">*</font>)</td><td><select id="country" name="country" style="width: 200px;">
<option  selected value="">--Please select...</option>
<option >Afghanistan</option>
<option>Albania</option>
<option >Algeria</option>
<option >Andorra</option>
<option >Angola</option>
<option >Antigua and Barbuda</option>
<option >Argentina</option>
<option>Armenia</option>
<option >Australia</option>
<option >Austria</option>
<option >Azerbaijan</option>
<option >Bahamas</option>
<option >Bahrain</option>
<option >Bangladesh</option>
<option >Barbados</option>
<option >Belarus</option>
<option >Belgium</option>
<option >Belize</option>
<option >Benin</option>
<option >Bhutan</option>
<option >Bolivia</option>
<option >Bosnia and Herzegovina</option>
<option >Botswana</option>
<option >Brazil</option>
<option >Bulgaria</option>
<option >Burundi</option>
<option>Cambodia</option>
<option >CaBulgaria</option>
<option >Burundimeroon</option>
<option >Canada</option>
<option >Chile</option>
<option >China</option>
<option >Colombia</option>
<option >Comoros</option>
<option >Costa Rica</option>
<option >Croatia</option>
<option >Cuba</option>
<option >Cyprus</option>
<option >Czech Republic</option>
<option >Denmark</option>
<option >Djibouti</option>
<option >Dominica</option>
<option >East Timor</option>
<option >Ecuador</option>
<option >Egypt</option>
<option >El Salvador</option>
<option >Equatorial Guinea</option>
<option >Eritrea</option>
<option >Estonia</option>
<option >Ethiopia</option>
<option >Fiji</option>
<option >Finland</option>
<option >France</option>
<option >Gabon</option>
<option >Gambia</option>
<option >Georgia</option>
<option >Germany</option>
 <option >Ghana</option>
 <option >Greece</option>
 <option >Grenada</option>
 <option >Guatemala</option>
 <option >Guinea</option>
<option >Guinea Bissau</option>
<option >Guyana</option>
<option >Haiti</option>
<option >Honduras</option>
<option >Hungary</option>
<option >Iceland</option>
<option >India</option>
<option >Indonesia</option>
<option >Iran</option>
<option >Iraq</option>
<option >Ireland</option>
<option >Israel</option>
<option >Italy</option>
<option >Jamaica</option>
<option >Japan</option>
<option >Jordan</option>
<option >Kazakhstan</option>
<option >Kenya</option>
<option >Kiribati</option>
<option >Korea, North</option>
<option >Korea, South</option>
<option >Kuwait</option>
<option >Kyrgyzstan</option>
<option >Laos</option>
<option >Latvia</option>
<option >Lebanon</option>
<option >Lesotho</option>
<option >Liberia</option>
<option >Libya</option>
<option >Liechtenstein</option>
<option >Lithuania</option>
<option >Luxembourg</option>
<option >Macedonia</option>
<option >Madagascar</option>
<option >Malawi</option>
<option >Malaysia</option>
<option >Maldives</option>
<option >Mali</option>
<option >Malta</option>
<option >Marshall Islands</option>
<option >Mexico</option>
<option >Moldova</option>
<option >Monaco</option>
<option >Mongolia</option>
<option >Morocco</option>
<option >Montenegro</option>
<option >Mozambique</option>
<option >Myanmar</option>
<option >Namibia</option>
<option >Nauru</option>
<option >Nepal</option>
<option >Netherlands</option>
<option >New Zealand</option>
<option >Nicaragua</option>
<option >Niger</option>
<option >Norway</option>
<option >Oman</option>
<option >Pakistan</option>
<option >Palau</option>
<option >Panama</option>
<option >Papua New Guinea</option>
<option >Paraguay</option>
<option >Peru</option>
<option >Philippines</option>
<option >Poland</option>
<option >Portugal</option>
<option >Puerto Rico</option>
<option >Qatar</option>
<option >Romania</option>
<option >Russia</option>
<option >Rwanda</option>
<option >Samoa</option>
<option >San Marino</option>
<option >Saudi Arabia</option>
<option >Senegal</option>
<option >Serbia</option>
<option >Seychelles</option>
<option >Sierra Leone</option>
<option >Singapore</option>
<option >Slovakia</option>
<option >Slovenia</option>
<option >Solomon Islands</option>
<option >Somalia</option>
<option >South Africa</option>
<option >Spain</option>
<option >Sri Lanka</option>
<option >Sudan</option>
<option >Suriname</option>
<option >Swaziland</option>
<option >Sweden</option>
<option >Switzerland</option>
<option >Syria</option>
<option >Taiwan</option>
<option >Tajikistan</option>
<option >Tanzania</option>
<option >Thailand</option>
<option >Togo</option>
<option >Tonga</option>
<option >Trinidad and Tobago</option>
<option >Tunisia</option>
<option >Turkey</option>
<option >Turkmenistan</option>
<option >Tuvalu</option>
<option >Uganda</option>
<option >Ukraine</option>
<option >United Arab Emirates</option>
<option >United Kingdom</option>
<option >United State</option>
<option >Uruguay</option>
<option >Uzbekistan</option>
<option >Vanuatu</option>
<option >Vatican City</option>
<option >Venezuela</option>
<option >Vietnam</option>
<option >Yemen</option>
<option >Zambia</option>
<option >Zimbabwe</option>
        </select>
         <div id="countryError" class="red" colspan="2"/>
</td>
                </tr>
                <tr><td></td></tr>
               <tr>
                <td>City (<font color="red">*</font>)</td>
                <td><input type="text" name="city" id="city"size="30" maxlength="15">
                 <div id="cityError" class="red" colspan="2"/>
                </td>
              </tr>
              <tr><td></td></tr>
              <tr>
                <td>Zodiac (<font color="red">*</font>)</td>
                <td><select name="zodiac" id="zodiac" style="width: 200px;">
                        <option selected value="">--Please Select Zodiac</option>
                        <option >Aries</option>
                        <option>Taurus</option>
                        <option>Gemini</option>
                        <option>Cancer</option>
                        <option>Leo</option>
                        <option>Virgo</option>
                        <option>Libra</option>
                        <option>Scorpio</option>
                        <option>Sagittarius</option>
                        <option>Capricorn</option>
                        <option>Aquarius</option>
                        <option>Pisces</option>
                    </select>
                 <div id="zodiacError" class="red" colspan="2"/>
                </td>
              </tr>
               <tr>
                <tr>
                 <td></td>
                  <td align="right">
                  
                   <input type="submit" name="save_astro" id="submit" value="save & continue">
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
