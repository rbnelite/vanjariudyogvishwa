<%-- 
    Document   : index
    Created on : Jul 26, 2013, 12:37:46 PM
    Author     : RBNElite
--%>
<%@page import="com.rbnelite.udyogvishwa.model.RegistrationDao"%>
<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="com.rbnelite.udyogvishwa.model.LoginDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.ProfileImageDao"%>
<%@page import="com.rbnelite.udyogvishwa.service.HomeSer"%>
<%@page import="com.rbnelite.udyogvishwa.model.Friendship"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>
        <script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
   <link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
        <link rel="stylesheet" type="text/css" href="CSS/style1.css" />
	<script type="text/javascript" src="CSS/jquery-1.4.2.min.js"></script>
        <script src="CSS/jquery.autocomplete.js"></script>	
       <script>
	jQuery(function()
        {
		$("#email_id").autocomplete("FriendList.jsp");
	});
        
        jQuery(function()
        {
		$("#Who_Frd").autocomplete("FriendList1.jsp");
	});
       </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/style.css" type="text/css" charset="utf-8" />
        <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
           <script type="text/javascript">

hs.graphicsDir = 'graphics/';
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'draggable-header';

</script>
        <title>Friends Page</title>
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
    </head>
    <body>
      
        <div id="main">
         <div id="hori"> 
        <div id="new">            
<div id="search" class="button">
       
    <input type="text" value="Search" name="email_id" id="email_id"class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
      
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
            <div id="prf_img"  >
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
            <a href="Friend_request.jsp" style="text-decoration: none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><font color="white"size="3"> Request's</font>&nbsp;<font color="black" style="background-color: bisque"><%=frnd_count%></font></a>
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
            <div id="friend_middle">
                <div id="friend">
                    <div id="friendsbar">
                        <table>
                            <tr>
                                <td><font size="5">Friends</font></td>
                               
                            </tr>
                           
                        </table>
                       
             <div id="search1" class="button1">
        <form action="#" method="post">
            <input type="text" value="Search Your Friend" name="Who_Frd" id="Who_Frd" class="txtfield1" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
        </form>
             </div>
                        <hr/>
                    </div>
                    <div id="friends_list">
                  <table>
                   <tr>
  <%
                 
      int count1=0;        
     List allUsers1;  
     String frnd="";
     String ffname="";
     String flname="";
     SessionFactory sf13 = new Configuration().configure().buildSessionFactory(); 
               Session s13=sf13.openSession();
               s13.beginTransaction();  
             
               Query queryResult13 = s13.createQuery("from FriendshipDao where whom_frd='"+user_mail+"'");  
               allUsers1 = queryResult13.list();
             
               for (int i = 0; i < allUsers1.size(); i++)
               {  
               Friendship frnd_pht = (Friendship) allUsers1.get(i);        
               frnd=frnd_pht.getWho_frd();
               Query queryResult131 = s13.createQuery("from RegistrationDao where email_id='"+frnd+"'");  
               allUsers1 = queryResult131.list();
             
                for (int j = 0; j < allUsers1.size(); j++)
               {  
               RegistrationDao reg = (RegistrationDao) allUsers1.get(i);        
              ffname= reg.getfName();
              flname= reg.getlName();
    %>
                 <td>
                       <div id="friends_show">
                           <form action="ActionController" method="post">
                           <div class="friends_image"><img src="images/dummy_male_ic.png" height="80" width="80"></div>
                           <div class="friends_name"><input type="Submit" name="Go_friend" value="<%=ffname%>&nbsp;<%=flname%>" style="background:none;border:none;textDecoration:underline;cursor:pointer"><input type="hidden" name="mail" value="<%=frnd%>"></div>
                           </form>
                       </div>
                 </td>
    <%
               }
    count1=count1+1;
    if(count1 == 2)
    {
    %>
        <td>
             <br>
        </td>
       </tr> 
  
    <%   
    count1=0;    
     }
       }
         s13.getTransaction().commit();
               s13.close();
               sf13.close();
   %>
                
           
           
                          
                               
                               
                            </tr>
                        
                        
                        </table>
                    </div>
                </div>
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
            <% java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime());%>
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
                          <td ><img src="images/RBN_logo.png" height="250" width="200"></td>
                      </tr>
                  </table>
                  </div>
              </div>
            </div>
      
                </div> 
       
       
    </body>
</html>
