<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.LoginSer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="COM.RBNELITE.BUSINESSPORTAL.SERVICE.HomeSer"%>
<%@page import="COM.RBNELITE.ENTITY.ProfileImageDao"%>
<%@page import="COM.RBNELITE.ENTITY.LoginDao"%>
<%@page import="COM.RBNELITE.ENTITY.PhotoUploadDao"%>
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
        <script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
   <link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/style.css" type="text/css" charset="utf-8" />
        <link rel="stylesheet" href="CSS/111.css" type="text/css" charset="utf-8" />
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <title>Photos Page</title>
     <script type="text/javascript" src="JavaScript/highslide-with-gallery.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
<script type="text/javascript">
hs.graphicsDir = 'graphics/';
hs.align = 'center';
hs.transitions = ['expand', 'crossfade'];
hs.outlineType = 'rounded-white';
hs.fadeInOut = true;
hs.numberPosition = 'caption';
hs.dimmingOpacity = 0.75;

// Add the controlbar
if (hs.addSlideshow) hs.addSlideshow({
	//slideshowGroup: 'group1',
	interval: 5000,
	repeat: false,
	useControls: true,
	fixedControls: 'fit',
	overlayOptions: {
	opacity: .75,
	position: 'bottom center',
	hideOnMouseOut: true
	}
});
</script>
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
        <form action="#" method="post">
        <input type="text" value="Search" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
      </form>
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
            String result1="";
            String photo1="";
            String p1="";
            String a1="/";
            String ab1="";
            SessionFactory sf5 =  new Configuration().configure().buildSessionFactory(); 
            Session s5=sf5.openSession();
            s5.beginTransaction();  
            List allUsers5;  
            Query queryResult5 = s5.createQuery("from ProfileImageDao where user_mail='"+user_mail+"'");  
            allUsers5 = queryResult5.list();
               
            for (int i = 0; i < allUsers5.size(); i++)
            {  
            ProfileImageDao prf_mmg = (ProfileImageDao)allUsers5.get(i);   
            photo1=prf_mmg.getPath();
            p1=photo1.substring(73);  
            result1= p1.replace("\\", a1) ;
            }
            s5.getTransaction().commit();
            s5.close();
            sf5.close();

            if(photo1.equals("") || photo1 == null)

            {
                 result1="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/BG 1.png"; 
                 p1=result1.substring(73);
                 result1= p1.replace("\\", a1);
            }
            session.setAttribute("result",result1); 
   
%>
           <div id="prf_img">
               
            <img src="<%=result1%>" height="120" width="120" style="border-radius: 5px; margin-top:60px;">
            
           </div>
       </div>
          <div id="headerid">
                        <b><table width="100%">
                        <tr>
                        <td>
                            <a href="#"style="text-decoration:none" onclick="ShowINeedPage();"><font color="white" size="3"> I Need </font></a>
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
                            <a href="Message.jsp"style="text-decoration:none"><font color="white" size="3"> Messages </font> </a>
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
                            <td><font size="5">Photos</font></td>
                          </tr>
                      </table>
                
                        <hr/>
                    </div>
                    <div id="friends_list">
   
                      

            <%
            String photo="";
            String p="";
            String a="/";
            String ab="";
            SessionFactory sf =  new Configuration().configure().buildSessionFactory(); 
            Session s=sf.openSession();
            s.beginTransaction();  
            List allUsers;  
            Query queryResult = s.createQuery("from PhotoUploadDao where user_mail='"+user_mail+"'");  
            allUsers = queryResult.list();
               
            for (int i = 0; i < allUsers.size(); i++)
            {  
            PhotoUploadDao ph = (PhotoUploadDao)allUsers.get(i);   
            photo=ph.getPath();
            p=photo.substring(73);  

            String result= p.replace("\\", a) ;
            
            %>
               <a href="<%=result%>" onclick="return hs.expand(this,{slideshowGroup: 2} )">
               <img src="<%=result%>" alt="Highslide JS" title="Click to enlarge" height="100" width="100"/>
               </a>
<%             
               }
               s.getTransaction().commit();
               s.close();
               sf.close();
   
%>
                    </div>
                </div>
            </div>
            <% java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime()); %>
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
            String result11="";
            String photo11="";
            String p11="";
            String a11="/";
           SessionFactory sf51 =  new Configuration().configure().buildSessionFactory(); 
            Session s51=sf51.openSession();
            s51.beginTransaction();  
            List allUsers51;  
            Query queryResult51 = s51.createQuery("from ProfileImageDao where user_mail='"+name+"'");  
            allUsers51 = queryResult51.list();
               
               for (int i1 = 0; i1 < allUsers51.size(); i1++)
             {  
              ProfileImageDao prf_mmg1 = (ProfileImageDao)allUsers51.get(i1);   
              photo11=prf_mmg1.getPath();
              p11=photo11.substring(73);  
              result11= p11.replace("\\", a11) ;
             }
               s51.getTransaction().commit();
               s51.close();
               sf51.close();
               
               if(photo11.equals("") || photo11 == null)
     
               {
                    result11="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/33.png"; 
                    p11=result11.substring(73);
                    result11= p11.replace("\\", a11);
               }
               session.setAttribute("result",result11); 
   
%>
        <td align="center"><img src="<%=result11%>" height="30" width="30">&nbsp;</td>
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
