<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="com.rbnelite.udyogvishwa.dao.ProfileImageDao"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rbnelite.udyogvishwa.dao.LoginDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/hobbies_validation.js" type="text/javascript"></script>
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
        <title>Step8 Page</title>
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
            <form action="ActionController" method="post" name="hobbiesform" id="hobbiesform">
        <div id="container">
           
            <div id="middle_step1">
                <div id="step1">
                    <div id="img_step1">
                        <h1><b>Step 8</b></h1>
                    </div>
                    <div id="info_step1">
                        <table align="center">
                            <tr><td colspan="2"><br></tr>
                            <tr>
                                <td colspan="2"><font size="5">Fill Out Your Hobbies and Interests Details</font></td>
                            </tr>
                           
                            <tr>
                                <td colspan="2">This Information will help us to Create Your Profile</td>
                            </tr>
                            <tr><td colspan="2"><hr/></td></tr>
                            <tr><td><br><br></td></tr>
                           
                  <tr>
                <td> Hobbies</td><td><textarea name="hobbies" id="hobbies" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="hobbiesError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Favourite Music </td><td><textarea name="fav_music" id="fav_music" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="fav_musicError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td> Favourite Books</td><td><textarea name="fav_books" id="fav_books"rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="fav_booksError" class="red" colspan="2"/></td>
            </tr> <tr><td colspan="2"><br></tr>
            <tr>
                <td> Dress Style</td><td><select name="dress_style" id="dress_style">
                        <option selected value="">--Please Select --</option>
                        <option>Indian</option>
                        <option>Western</option>
                        <option>Sports</option>
                        <option>Formal</option>
                        <option>Casual</option>
                    </select>
                <div id="dress_styleError" class="red" colspan="2"/></td>
            </tr> <tr><td colspan="2"><br></tr>
            <tr>
                <td>Favourite TV Shows </td><td><textarea name="fav_tvShows" id="fav_tvShows" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="fav_tvShowsError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td> Preferred Movies</td><td><textarea name="pref_movies" id="pref_movies" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="pref_moviesError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Favourite Movies </td><td><textarea name="fav_movies" id="fav_movies" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="fav_moviesError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td> Sports/Fitness</td><td><textarea name="sports" id="sports" rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="sportsError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
             
            <tr><td colspan="2"><br></tr>
            <tr>
                <td> Food I Cook</td><td><textarea name="food" id="food"rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="foodError" class="red" colspan="2"/></td></td>
            </tr> 
            <tr><td colspan="2"><br></tr>
            <tr>
                <td>Favourite Vacation Destination </td><td><textarea name="vac_dest" id="vac_dest"rows="1" cols="25" maxlength="50" style="resize: none;"></textarea>
                <div id="vac_destError" class="red" colspan="2"/></td>
            </tr> 
            <tr><td colspan="2"><br></tr>

             <tr>
                            <td></td>
                            <td align="right">
                             
                                <input type="submit" name="save_hobbies" id="submit" value="save&continue" >
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
