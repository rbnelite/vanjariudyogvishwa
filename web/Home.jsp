<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.LoginSer"%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.ProfileImage"%>
<%@page import="java.util.Iterator"%>
<%@page import="COM.RBNELITE.ENTITY.CommentDao"%>
<%@page import="COM.RBNELITE.ENTITY.RegistrationDao"%>
<%@page import="COM.RBNELITE.ENTITY.StatusUpdateDao"%>
<%@page import="COM.RBNELITE.ENTITY.I_needDao"%>
<%@page import="COM.RBNELITE.ENTITY.CreateEventDao"%>
<%@page import="COM.RBNELITE.ENTITY.Frnd_requestDao"%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.HomeSer"%>
<%@page import="COM.RBNELITE.ENTITY.ProfileImageDao"%>
<%@page import="COM.RBNELITE.ENTITY.LoginDao"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page  import="COM.RBNELITE.BUSINESSPORTAL.CONTROLLER.ActionController" %>
<%@page import="sun.security.util.Password"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
   <title>Home Page</title>
   <script src="JavaScript/JScript.js" type="text/javascript"></script>
   <script src="JavaScript/jquery-1.2.6.min.js" type="text/javascript"></script>
   <link rel="stylesheet" type="text/css" href="CSS/style1.css" />
	<script type="text/javascript" src="CSS/jquery-1.4.2.min.js"></script>
        <script src="CSS/jquery.autocomplete.js"></script>	
  <script>
	jQuery(function(){
		$("#email_id").autocomplete("FriendList.jsp");
	});
  </script>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="CSS/style.css" type="text/css" charset="utf-8" />
   <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
   <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
   <script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
   <script src="JavaScript/JScript.js" type="text/javascript"></script>
   <link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
<script type="text/javascript">

hs.graphicsDir = 'graphics/';
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'draggable-header';
</script>

<script>
var modalWin = new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("images/loading.gif");
 modalWin.SetCloseButtonImagePath("images/remove.gif");
 //Uncomment below line to make look buttons as link
 //modalWin.SetButtonStyle("background:none;border:none;textDecoration:underline;cursor:pointer");

function ShowNewPage(){
 var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
 //var callbackFunctionArray = new Array(null, null);
 modalWin.ShowURL('pop_i_need.jsp',270,530,'Enter your need',null,callbackFunctionArray);
 }
 
 function GetUserId(g)
 {
     alert(g.value);
     var t= document.getElementById("fre_req_id").value;
     alert(t);
     return false;
 }
 
 function submitenter(myfield,e)
{
var keycode;
if (window.event) keycode = window.event.keyCode;
else if (e) keycode = e.which;
else return true;
if (keycode == 13)
   {
   myfield.submit();
   return false;
   }
else
   return true;
}



        
            function display()
            {
                var d=document.getElementById("anil");
                d.style.visibility='visible';
                d.setAttribute("name", value)
            }
          
          
function validate()
{
    var post=document.forms["HomeForm"]["status_post"].value;
    if(post==null || post=="")
        {
            alert("please Write Something !!!");
            return false;
        }
    
    
}
function EnrollNow(msg){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

function EnrollLater(){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

</script>
   </head>
   <body onload="return display();">
        <div id="main">
        <div id="hori"> 
        <div id="new">            
        <div id="search" class="button">
        
            <input type="text" value="Search" id="email_id" name="email_id"    class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
        
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
                <a href="Profile.jsp?iPagNo=1" style="text-decoration: none"><font color="white" size="3"><b><%=lnames[0]%>&nbsp;<%=lnames[1]%></b></font></a>
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
            <br><a href="includes/ajax.jsp" style="text-decoration: none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )">
	&nbsp;&nbsp;Change Picture</a>.
            </div>
            </div>
            <div id="headerid">
                        <b><table width="100%">
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
            <a href="Friend_request.jsp" style="text-decoration: none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><font color="white"size="3"> Request's</font>&nbsp;<font color="black" style="background-color: bisque"><%=frnd_count%></font></a>
                    </td>
                         
                        <td>
                        <a href="Message.jsp"style="text-decoration:none"><font color="white"size="3"> Messages </font></a>
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
            <div id="left_home" >
            <div id="upevents">
            <table width="100%" >
                 <tr>
                 <td align="center">
                 <b> Upcoming Events</b>
                 </td>
                 </tr>
      <%  
           
           List l3=home.getEvent(user_mail);
           Iterator it3=l3.iterator();
            while(it3.hasNext())
            {
             String ename=it3.next().toString();
           
       %>
            <tr>
            <td align="center"><hr/>
            <marquee><font size="4"><%=ename%></font></marquee>
            </td>
            </tr>
            <%
            }
           if(l3.isEmpty())
            {
            %>
            <tr>
            <td>
              no records to display
            </td>
            </tr>
   <%   
           }
   %>
            
                  
                 
             </table>
             </div>
             <div id="symbols">
         <table width="50%" >
            
 <tr><td><img src="images/message-1.png"  title="Message" height="32"width="32"></td><td><a href="Message.jsp" style="text-decoration: none;  ">Message</a></td></tr>
        
<tr><td><img src="images/event.png"  title="Events" height="32"width="32"></td> <td><a href="Events.jsp" style="text-decoration: none;">Events</a></td> </tr>
            
<tr><td><img src="images/photo.png"  title="Photos" height="32"width="32"></td> <td><a href="Photos1.jsp" style="text-decoration: none;">Photos</a></td> </tr>
            
<tr><td><img src="images/product1.png"  title="My Products" height="32"width="32"></td><td><a href="Products.jsp" style="text-decoration: none;">My Products</a></td> </tr>

<tr><td><img src="images/friends1.png"  title="Friend's" height="32"width="32"></td> <td><a href="Friends.jsp" style="text-decoration: none;">Friend's</a></td> </tr>
             
         </table>
              </div>
    <div id="need">
        <table width="100%">
            <tr>
                <td align="center"> <b>I Need </b></td>
            </tr>
          <tr>
           <td>
           <hr/>
           </td>
           </tr>
        <%  
        int j=0;
        String solution="";
        String need_name="";
        String mob="";
        SessionFactory sf4 = new Configuration().configure().buildSessionFactory(); 
        Session s4=sf4.openSession();
        s4.beginTransaction();
        Query queryResult4 = s4.createQuery("from I_needDao where user_mail='"+user_mail+"' "); 
           List allUsers; 
        allUsers = queryResult4.list();
        
        for (j = 0; j < allUsers.size(); j++)
        {
        I_needDao need =(I_needDao) allUsers.get(j); 
        int Need_id=need.getId();
        need_name=need.getNeed();
        mob=need.getMno();
        session.setAttribute("Need_id",Need_id);
       %>
     <tr>
     <td align="left">
     <input type="hidden" name="need_id" value="<%=Need_id%>">
     &nbsp;&nbsp
     <font size="4">
     <div id="solutionarea"><b><%=lnames[0]%>&nbsp;<%=lnames[1]%></b> &nbsp; Need &nbsp;<%=need_name%></b><br>Ph:<%=mob%>&nbsp;
     <br>
     <input type="text" name="solutionarea" value="write a solution....." size="40" style="color: #a0a0a0" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
     <br><br>
     </div>
     </td>    
     </tr>
      
   <%                            
   
       }
        if(j==0)
      {
   %>
   <tr><td><div style="margin-left: 80px;margin-top: 20px">No  records to display</div></td></tr>
   <%
           }
        s4.getTransaction().commit();
        s4.close();
        sf4.close();
    %>    
   </table>
   </div>
   </div>
   <div id="middle" style="border: 1px solid lightgray; ">
   <table style="margin-left: 100px" >
   <tr>
   <td>Status Update</td><td>/</td><td>Video</td><td>/</td><td>Photo</td>
   </tr>
   </table>
       <form action="ActionController" method="post" name="HomeForm" onsubmit="return validate();">
    <%
       String userName=(String)session.getAttribute("User_Name");
       java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime());
    %>
       <input type="hidden"name="date" value="<%=date%>">
       <table align="center" style="border: 1px solid lightgray; border-radius: 5px;">
       <tr>
           <td colspan="5"><textarea rows="2" cols="80" name="status_post" id="status_post" style="resize: none;"></textarea></td>
       </tr>
       <tr>
       <td><a href="#" style="text-decoration: none">Text</a></td> 
       <td><a href="includes/Add_Photo.jsp" style="text-decoration: none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )">Photo</a></td> 
       <td><a href="#" style="text-decoration: none">Link</a></td> 
       <td><a href="#" style="text-decoration: none"> Video</a></td> 
       <td align="right">
       <input type="submit" name="Status_update" value="POST" style="background-color: #fab039; width:100px; height:40px;"> </td>
       </tr>
       </table>
       </form>
        <% 
        String profile_img=(String)session.getAttribute("result");        
        int i=0;
        int m=0;
        String ffname="";
        String flname="";
        String c_name="";
        String details="";
        String comment_whom="";
        String comment="";
        Long id;
        SessionFactory sf2 = new Configuration().configure().buildSessionFactory(); 
        Session s2=sf2.openSession();
        s2.beginTransaction();
        //SQLQuery queryResult2 = s2.createSQLQuery("SELECT post,user_email,status_id FROM tbl_status WHERE user_email='"+userName+"' OR user_email IN (SELECT Whom_Frd AS ab FROM tbl_friends_data WHERE Who_Frd='"+userName+"' UNION SELECT Who_Frd AS ab FROM tbl_friends_data WHERE Whom_Frd='"+userName+"') order by status_date desc");
        //queryResult2.getNamedParameters();
        //allUsers = queryResult2.list();
         //for (int v = 0; v < allUsers.size(); v++)
       // {  
         // lcnt=allUsers2.get(v).toString();
           
              
        Query queryResult2 = s2.createQuery("from StatusUpdateDao where user_email='"+userName+"' order by status_date desc"); 
           
        allUsers = queryResult2.list();
        
        for (i = 0; i < allUsers.size(); i++)
        {
        StatusUpdateDao status =(StatusUpdateDao) allUsers.get(i); 
        id=status.getId();
        details=status.getStatus_details();
        c_name=status.getUser_email();
        Long status_id=status.getId();
        
        Query q=s2.createQuery("from RegistrationDao where emailId='"+c_name+"'");
        List  allUsers11 = q.list();
        for(int a1=0;a1<allUsers11.size();a1++)
               {
            RegistrationDao rd=(RegistrationDao) allUsers11.get(a1);
            ffname=rd.getfName();
            flname=rd.getlName();
   %>
    <div id="state_div" class="state_img">
    <img src="<%=profile_img%>" height="50" width="50">
    <div class="Stste_name"><b><%=ffname%>&nbsp;<%=flname%></b></div> 
    <div class="state_info"><%=details%></div>
    <%
     }
   Query queryResult3 = s2.createQuery("from CommentDao where Status_id='"+status_id+"'");        
   List  allUsers1 = queryResult3.list();
   for ( m = 0; m < allUsers1.size(); m++)
     {
       CommentDao status1 =(CommentDao) allUsers1.get(m); 
       comment_whom=status1.getCmt_whom();
       comment=status1.getCmnt();
    %>
        <div id="show_comment">
        <img src="<%=profile_img%>" height="30" width="30" style="margin-top: 10px; margin-left: 10px;">
  <div class="comment_info">
       <%=comment_whom%>
       <br>
      <%=comment%>
  </div>
  <div class="state_like">
                   </div>
                    </div>
  <%
        }
  %>
           <div id="comment">
           <form action="Demo" method="post" onKeyPress="return submitenter(this,event)" name="zzz">
           <input type="hidden" name="whom" value="<%=userName%>">
           <input type="hidden" name="status_id" value="<%=id%>">
          
          <img src="<%=profile_img%>" height="30" width="30" style="margin-top: 10px; margin-left: 10px;">
          <input type="text" name="comment"value="write a comment....." size="70" style="color: #a0a0a0" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
           </form>                
           </div>
            <div class="state_like">
                <form action="ActionController" method="post">
                     <input type="hidden" name="status_id11" value="<%=id%>">
                       <table width="70%" >
                             <tr>
         <td>
         <%
               String lcnt="";
               SessionFactory sf17 =  new Configuration().configure().buildSessionFactory(); 
               Session s17=sf17.openSession();
               s17.beginTransaction();  
               List allUsers17;
               SQLQuery queryResult17 = s17.createSQLQuery("SELECT COUNT(l.count) FROM tbl_like l WHERE `sataus_id`='"+id+"'");  
               queryResult17.getNamedParameters();
               allUsers17 = queryResult17.list();
               for (int v = 0; v < allUsers17.size(); v++)
               {  
                lcnt=allUsers17.get(v).toString();
              
              
         %>
             <input type="submit" name="LikeButton" value="Like" style="background:none;border:none;textDecoration:underline;cursor:pointer"><%=lcnt%>
         <%
               }
                s17.getTransaction().commit();
                s17.close();
                sf17.close();
                 
             %>
         </td>
         <td>
             <%
               String uncnt="";
               SessionFactory sf18 =  new Configuration().configure().buildSessionFactory(); 
               Session s18=sf18.openSession();
               s18.beginTransaction();  
               List allUsers18;
               SQLQuery queryResult18 = s18.createSQLQuery("SELECT COUNT(l.count) FROM tbl_unlike l WHERE `status_id`='"+id+"'");  
               queryResult18.getNamedParameters();
               allUsers18 = queryResult18.list();
               for (int v = 0; v < allUsers17.size(); v++)
               {  
                uncnt=allUsers18.get(v).toString();
              
              
         %>
             <input type="Submit" name="UnlikeButton" value="Unlike" style="background:none;border:none;textDecoration:underline;cursor:pointer"><%=uncnt%>
          <%
               }
                s18.getTransaction().commit();
                s18.close();
                sf18.close();
                 
             %>
         </td>
         <td><input type="button" name="ShareCnt" value="Share" style="background:none;border:none;textDecoration:underline;cursor:pointer"></td>
         <td><input type="button" name="CommentsCnt" value="Comments" style="background:none;border:none;textDecoration:underline;cursor:pointer"></td>
                             </tr>
                       </table>
                    
                </form>
            </div>
            </div>
      <%
         }
       if(i==0)
        {
     %>
        <div style="margin-left: 250px;margin-top: 50px;">No records to display.....</div>
    <%  
        }       
        s2.getTransaction().commit();
        s2.close();
        sf2.close();
    %>
            
            </div>
            
            <div id="right">
            <div id="people">
               
          <table align="center">
             <tr>
         <td colspan="3" align="center">
          <b>People You May Know</b>
             </td>
             </tr>
             <tr><td>&nbsp;&nbsp;</td></tr>
       <%  
           List l4=home.getPeople(user_mail);
           Iterator it4=l4.iterator();
            while(it4.hasNext())
            {
            
             String knownPeople=it4.next().toString(); 
             int vik=knownPeople.indexOf(":");
             int vik1=knownPeople.indexOf("::");
             String name=knownPeople.substring(vik+1, vik1); 
             String fullname=knownPeople.substring(0, vik);
       
        %>
        <form action="ActionController" method="post" name="Request">  
        <tr>
        <input type="hidden"name="date" value="<%=date%>">
        <%
            String result1="";
            String photo1="";
            String p1="";
            String a1="/";
            String ab1="";
            SessionFactory sf51 =  new Configuration().configure().buildSessionFactory(); 
            Session s51=sf51.openSession();
            s51.beginTransaction();  
            List allUsers51;  
            Query queryResult51 = s51.createQuery("from ProfileImageDao where user_mail='"+name+"'");  
            allUsers51 = queryResult51.list();
               
               for (int i1 = 0; i1 < allUsers51.size(); i1++)
             {  
               ProfileImageDao prf_mmg1 = (ProfileImageDao)allUsers51.get(i1);   
              photo1=prf_mmg1.getPath();
              p1=photo1.substring(73);  
              result1= p1.replace("\\", a1) ;
             }
               s51.getTransaction().commit();
               s51.close();
               sf51.close();
               
               if(photo1.equals("") || photo1 == null)
     
               {
                    result1="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/33.png"; 
                    p1=result1.substring(73);
                    result1= p1.replace("\\", a1);
               }
               session.setAttribute("result",result1); 
   
%>
        <td align="center"><img src="<%=result1%>" height="30" width="30">&nbsp;</td>
        <input type="hidden" value="<%=name%>" name="fre_req_id" id="fre_req_id" >
      
        <input type="hidden" value="N" name="status">
        <td><%=fullname%></td>
        <td align="center"><input type="submit" name="Connect" value="Connect"></td>  
     
       </tr>
           </form>
    <%
          }
      
    %>
      </table>
   </div>
              <div id="add">
                  <table align="center">
                      <tr>
        <td><img src="images/RBN_logo.png" height="250" width="200"></td>
                      </tr>
                  </table>
              </div>
                
            </div>
            </div>
      
                </div> 
       
          
    </body>
</html>
