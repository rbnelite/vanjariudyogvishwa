<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="com.rbnelite.udyogvishwa.service.HomeSer"%>
<%@page import="com.rbnelite.udyogvishwa.model.ProfileImageDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.LoginDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.service.EventSer"%>
<%@page import="com.rbnelite.udyogvishwa.model.CreateEvent"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="JavaScript/JScript.js" type="text/javascript"></script>
    <script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
   <link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
    <link rel="stylesheet" type="text/css" href="CSS/style1.css" />
	<script type="text/javascript" src="CSS/jquery-1.4.2.min.js"></script>
        <script src="CSS/jquery.autocomplete.js"></script>	
       <script>
	jQuery(function(){
		$("#email_id").autocomplete("FriendList.jsp");
	});
       </script>
<script type="text/javascript">
hs.graphicsDir = 'graphics/';
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'draggable-header';
</script>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="CSS/style.css" type="text/css" charset="utf-8" />
  <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" media="screen, print, handheld" type="text/css" href="CSS/calender.css" />
  <script type="text/javascript" src="JavaScript/calender.js"></script>
  <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
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
        <title>Events</title>
    </head>
    <body>
        <div id="main">
                 <div id="hori"> 
        <div id="new">            
            <div id="search"class="button" >
        
                <input type="text" value="Search" name="email_id" id="email_id" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
      
           </div>
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
                <a href="Profile.jsp?iPagNo=2" style="text-decoration: none"><font color="white" size="3"><b><%=lnames[0]%>&nbsp;<%=lnames[1]%></b></font></a>
               </td>
             
             </tr>
            </table> 
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
                       <b> <table width="100%">
                        <tr>
                         <td>
                        <a href="#" style="text-decoration:none" onclick="ShowNewPage();"><font color="white"size="3"> I Need </font></a>
                        </td>
                         
                        <td>
                        <a href="Profile.jsp?iPagNo=1"style="text-decoration:none"><font color="white"size="3"> Profile </font> </a>
                        </td>
                         
            <td>
                <a href="Home.jsp" style="text-decoration: none"><font color="white"size="3"><b>Home</b></font></a>
            </td>
<%
     HomeSer home=new HomeSer();
     int cnt=home.getNotifications(user_mail);
            
%>
    <td>
        <a href="includes/Notification.jsp"style="text-decoration:none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><font color="white"size="3">Notification</font>&nbsp;<font color="black" style="background-color: bisque"><%=cnt%></font> </a>
    </td>
              
                    <td>
<%
            
  int frnd_count=home.getFriendRequestcnt(user_mail);
                   
%>
            <a href="Friend_request.jsp" style="text-decoration: none" onclick="hs.htmlExpand(this, { objectType: 'ajax'} )"><font color="white"size="3"> Request's</font>&nbsp;<font color="black" style="background-color: bisque"><%=frnd_count%></font></a>
                    </td>
                         
                        <td>
                        <a href="Message.jsp"style="text-decoration:none"><font color="white"size="3"> Messages </font> </a>
                        </td>
                        <td>
                         <font color="white"size="3"><b>Setting</b></font>
                        </td>
                        <td>
              <a href="index.jsp"><font color="white" size="3" style="text-decoration: none;">Log-out</font></a>
                        </td>
                     </tr>
                           </table></b>
            </div>
        
     </div>
        <div id="container">

  <div id="event">
      <h1><b>Events</b><table style="float: right; margin-top: -5px;"><tr><td><input type="button" onclick="ShowNewPage()" value="Create Event" style="background-color: #fab039; width:100px; height:40px;"></td></tr></table></h1>
<script>
var modalWin =new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("images/loading.gif");
 modalWin.SetCloseButtonImagePath("images/remove.gif");
 //Uncomment below line to make look buttons as link
 //modalWin.SetButtonStyle("background:none;border:none;textDecoration:underline;cursor:pointer");

function ShowNewPage(){
 var callbackFunctionArray = new Array(update_education, EnrollLater);
 modalWin.ShowURL('pop_CreateEvent.jsp',300,470,'Create Event',null,callbackFunctionArray);
 }
 
 function  ShowMessage(){
 modalWin.ShowMessage('This Modal Popup Window using Javascript',200,400,'User Information');
 }
 
 function update_education(msg){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

function EnrollLater(msg){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

</script>
 <hr/>
 <%
 
 String sunday="";
 Calendar calender=Calendar.getInstance();
 int day=calender.get(Calendar.DAY_OF_WEEK);
 
 if(day==1)
 {
  sunday="Sunday"; 
 }
 else if(day==2)
 {
  sunday="Monday"; 
 }
 else if(day==3)
 {
  sunday="Tuesday"; 
 }
  else if(day==4)
 {
  sunday="Wenesday"; 
 }
  else if(day==5)
 {
  sunday="ThursDay"; 
 }
  else if(day==6)
 {
  sunday="Friday"; 
 }
  else 
 {
  sunday="Saturday"; 
 }

 %>


 <% 
        String e_name="";
        String e_date="";
        String e_details="";
        SessionFactory sf11 =  new Configuration().configure().buildSessionFactory(); 
        Session s11=sf11.openSession();
        s11.beginTransaction();  
        List allUsers11;
        Query queryResult11 = s11.createQuery("from CreateEventDao order by date_time");  
        allUsers11 = queryResult11.list();
        for (int i = 0; i < allUsers11.size(); i++)
        {  
        CreateEvent event = (CreateEvent) allUsers11.get(i);        
        e_name=event.getName();
        e_date=event.getDate_time();
        e_details=event.getDetails();
       
        %>
<div id="Upcoming_event">
    <div id="backgroundclr">
    <font size="5"><%=e_date%></font>
    </div>    
    <font size="4"><%=e_name%></font>
    <br><%=e_details%>
</div>
  <%
  }
   s11.getTransaction().commit();
   s11.close();
   sf11.close();
  %>
  </div>
   
    <div id="right" style="background-color: menu;">
              
        <script type="text/javascript">
   calendar();
        </script>
</div>
            </div>
      
          </div>
    </body>
</html>
