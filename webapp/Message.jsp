<%@page import="com.rbnelite.udyogvishwa.service.LoginSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.MessageSer"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rbnelite.udyogvishwa.dao.LoginDao"%>
<%@page import="com.rbnelite.udyogvishwa.dao.ProfileImageDao"%>
<%@page import="com.rbnelite.udyogvishwa.service.HomeSer"%>
<%@page import="com.rbnelite.udyogvishwa.dao.RegistrationDao"%>
<%@page import="com.rbnelite.udyogvishwa.dao.MessageDao"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
        
        jQuery(function(){
		$("#Who_Frd").autocomplete("MessageList.jsp");
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
<script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
<title>Messages Page</title>
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
 
 function GetData(myfield,e)
 {
 var t= document.getElementById("em_id").value;
alert(t);
     return false;
 }
</script>
    </head>
    <body>
        <div id="main">
         <div id="hori"> 
        <div id="new">            
<div id="search" class="button">
        <form action="#" method="post">
            <input type="text" value="Search" name="email_id" id="email_id"class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">
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
                 <form action="MessageController" method="post" name="Message">
    <%
       java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime());
    %>
                     <input type="hidden" name="mdate" value="<%=date%>">
                     <input type="hidden" name="sflag" value="1">
                     <input type="hidden" name="rflag" value="1">
                     
                <div id="inbox_main">
               <%
               String uname=(String)session.getAttribute("User_Name");
               %>
               <table width="100%">
               <tr>
              <td align="center"><img src="images/measssage.png" width="30" height="20"></td><td><font size="5">Inbox</font></td> 
               </tr>
               <tr>
               <td colspan="2"><hr/></td> 
              </tr>
               <%
               String inbox1="";
               MessageSer mesg=new MessageSer();
               List lis=mesg.getMessageInbox(uname);
               Iterator i3=lis.iterator();
               while(i3.hasNext())
                {
                   inbox1=i3.next().toString();
              
               %>
               
            <tr>
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
            Query queryResult51 = s51.createQuery("from ProfileImageDao where user_mail='"+inbox1+"'");  
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
                    result1="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/BG 1.png"; 
                    p1=result1.substring(73);
                    result1= p1.replace("\\", a1);
               }
               session.setAttribute("result",result1); 
   
%>

<% 
                String mfname="";
                String mlname="";
            SessionFactory sf511 =  new Configuration().configure().buildSessionFactory(); 
            Session s511=sf511.openSession();
            s511.beginTransaction();  
            List allUsers511;  
            Query queryResult511 = s511.createQuery("from RegistrationDao where emailId='"+inbox1+"'");  
            allUsers511 = queryResult511.list();
               
               for (int i11 = 0; i11 < allUsers511.size(); i11++)
               {  
               RegistrationDao regdao = (RegistrationDao)allUsers511.get(i11);  
               mfname=regdao.getfName();
               mlname=regdao.getlName();                            
             
            %>
            <input type="hidden" name="em_id" id="em_id"/>
            <td><img src="<%=result1%>" height="50" width="50"></td><td><%=mfname%>&nbsp;<%=mlname%></td> 
            </tr> 
           <%
             }
               s511.getTransaction().commit();
               s511.close();
               sf511.close();
            %>
            
            <%
             }
            %>
            </table>
             </div>
             <div id="middle2_msg" >
             <div id="messageto">
              <table>
                <tr>
                    <td>To:</td><td><textarea name="to_msg" rows="1" cols="67" name="Who_Frd" id="Who_Frd" style="resize: none;"></textarea> </td>
                </tr>
                </table>
                 </div>
                <div id="mesdiplay">
                  <div id="msg_you" style="margin-top: 10px;">  
                <table>   
                    
                          
             <%
             String fname="";
               String other="";
               String me="";
               String actual_msg="";
               SessionFactory sf =  new Configuration().configure().buildSessionFactory(); 
               Session s=sf.openSession();
               s.beginTransaction();  
               Query queryResult = s.createQuery("from MessageDao where sender='"+uname+"'or Tomsg='"+uname+"' ");  
               List allUsers = queryResult.list();
               for (int i = 0; i < allUsers.size(); i++)
               {  
               MessageDao mes = (MessageDao) allUsers.get(i);        
               other=mes.getSender();
               me=mes.getTomsg();
               actual_msg=mes.getMessage();
              Query queryResult3 = s.createQuery("from RegistrationDao where emailId='"+other+"'");  
               List allUsers3 = queryResult3.list();
               for (int k = 0; k < allUsers3.size(); k++)
              {  
               RegistrationDao reg = (RegistrationDao) allUsers3.get(k);  
               fname=reg.getfName();                    
              }
                    %>
                
              <tr style="border: 1px solid gray">
                <td >  <font color="sky blue" size="4"><%=fname%> </font> </td>
                <td><img src="images/Untitled.png" height="20" width="20"></td>
                <td>  <%=actual_msg%>    </td> 
                 </tr>  
                 <tr><td colspan="3"><hr></td></tr>
                     
              <%
               }
               s.getTransaction().commit();
               s.close();
               sf.close();
              %>
              
              
              </table>
                 </div>   
                </div>
                <br/>
                <div id="message" Style="margin-left: 20px">
                <table>
                <tr>
                    <td colspan="5"><textarea rows="2" cols="67"  name="message" style="resize: none;">
                        </textarea> </br></td>
                   </tr>
                 <tr>
               <td align="center">Text</td> 
               <td align="center">Photo</td> 
               <td align="center">Link</td> 
               <td align="center"> Video </td> 
               <td align="center"> <input type="submit" name="send_msg" value="Send"> </td>
               </tr>
               </table>
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
                 </form>
            </div>
      
                </div> 
       
            
    </body>
</html>
