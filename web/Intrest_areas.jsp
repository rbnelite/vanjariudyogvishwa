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
        <title>Create group Page</title>
    </head>
    <body>
        
           
            
        <div id="main">
          <div id="hori">  
        <div id="new">
            
        <div id="search" class="button">
       
        
        <input type="text" value="Search" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}"><input type="submit" value="" class="button">
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
     
        <div id="container">
           
            <div id="middle_step1">
                <div id="step1">
                    <div id="img_step1">
                        <h1><b>Create Group's</b></h1>
                    </div>
                    <div id="info_step1">
                        <form action="ActionController" method="post">
           <table border="0" align="center">
           
                           <tr><td colspan="3">
           <font color=" Sky blue"><h4>Please Select Your Interest Areas. Which help us to create your groups</h4></font>
                            </td></tr>
           <tr>
               <td> <input type="checkbox" name="sports" value="Sports">Sports</td>
           
            <td><input type="checkbox" name="drawing" value="Drawing">Drawing </td>
            <td> <input type="checkbox" name="photography" value="Photography">Photography </td>
            <td><input type="checkbox" name="travelling" value="Travelling">Traveling </td>
           </tr>
           <tr><td>&nbsp;</td></tr>
           <tr>
             <td><input type="checkbox" name="music" value="Music">Music</td>
             <td><input type="checkbox" name="reading" value="Reading">Reading </td>
             <td><input type="checkbox" name="surfing" value="Surfing">Surfing/Browsing </td>
             <td><input type="checkbox" name="bike_riding" value="Bike_riding">Bike Riding</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
             <td><input type="checkbox" name="car_riding" value="Car_riding">Car Riding</td>
             <td> <input type="checkbox" name="tracking" value="Tracking">Tracking</td>
             <td> <input type="checkbox" name="movies" value="Movies">Movies </td>
            <td> <input type="checkbox" name="social" value="Social">Social Work</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <td> <input type="checkbox" name="polytics" value="Polytics">Politics </td>
            <td> <input type="checkbox" name="friends" value="Friends">Friends/Parties/dating</td>
             <td><input type="checkbox" name="shopping" value="Shopping">Shopping </td>
            <td><input type="checkbox" name="business" value="Business">Business</td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
                <td><input type="checkbox" name="drama" value="Drama">Drama</td> 
             <td><input type="checkbox" name="circus" value="Circus">Circus</td>
            <td><input type="checkbox" name="dance" value="Dance">Dance Shows </td>
             <td><input type="checkbox" name="culteral" value="Culteral">Cultural activities</td>
            </tr>
             <tr><td>&nbsp;</td></tr>
              <tr>
            <td><input type="checkbox" name="speech" value="Speech">Speech </td>
            <td><input type="checkbox" name="gym" value="Gym">Gym</td>
            <td> <input type="checkbox" name="teaching" value="Teaching">Teaching</td>
            <td> <input type="checkbox" name="spirituality" value="Spirituality">Spirituality </td>
            </tr>
             <tr><td>&nbsp;</td></tr>
             <tr>
             <td></td>
              <td align="right">
                <input type="submit" name="save_intrests" value="save & continue">
              </td>
             </tr> 
             
            </table>
            </form>
                    </div>
                </div>
            </div>
          </div>
        
        </div>
        
    </body>
</html>
