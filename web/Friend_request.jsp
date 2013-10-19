
<%@page import="COM.RBNELITE.ENTITY.RegistrationDao"%>
<%@page import="COM.RBNELITE.ENTITY.Frnd_requestDao"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://
www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="JavaScript/JScript.js" type="text/javascript"></script>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>People view</title>
</head>
<body>
 <div id="div3">
        
   <%
    String userName=(String)session.getAttribute("User_Name");
    session.setAttribute("User_mail",userName); 
  %>
  <table width="400"  style="background-color: bisque" >
  <% 
            String result="";
            String photo="";
            String p="";
            String a="/";
            String ab="";
            String user_from="";
            String email_Id="";
            String fullName="";
            SessionFactory sf5 =  new Configuration().configure().buildSessionFactory(); 
            Session s5=sf5.openSession();
            s5.beginTransaction();  
            List allUsers5;  
            List allUsers6;List allUsers7;
            
              Query q3=s5.createQuery("FROM Frnd_requestDao F  WHERE  F.req_status='N' AND F.req_to='"+userName+"'");
              allUsers7 = q3.list(); 
              for (int k = 0; k < allUsers7.size(); k++)
              {  
              Frnd_requestDao tr_f = (Frnd_requestDao)allUsers7.get(k);  
              String e_id=tr_f.getReq_from();
                Query q2=s5.createQuery("FROM RegistrationDao R  WHERE R.emailId='"+e_id+"'");
                allUsers6 = q2.list();
               for (int i = 0; i < allUsers6.size(); i++)
               {  
              RegistrationDao tr = (RegistrationDao)allUsers6.get(i);   
              fullName=tr.getfName()+" "+tr.getmName()+" "+tr.getlName();
              email_Id=tr.getEmailId();
              SQLQuery q1=s5.createSQLQuery("SELECT path FROM tbl_Frd_Request R,tbl_profileimages I   WHERE R.From_Id=I.user_mail AND R.From_Id='"+email_Id+"'");
              q1.getNamedParameters();
              allUsers5 = q1.list();
              for (int j = 0; j < allUsers5.size(); j++)
              {  
              photo=allUsers5.get(j).toString();     
              }
              }
         %>
         <%
      if(photo.equals("") || photo == null)
     
               {
                    result="C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/BG 1.png"; 
                    p=result.substring(73);
                    result= p.replace("\\", a);
               }
                else
                                       {
           p=photo.substring(73);  
              result= p.replace("\\", a) ;
                                  }  
               %> 
             <tr>
          <td>
   <img src="<%=result%>" height="80" width="80" style="border-radius: 5px;">
   </img>
          </td>
    <td>
        <form action="ActionController" method="post">
        <table> 
            
            <tr>
                <td><%=fullName%>
            <input type="hidden" name="e_id" readonly="true" value="<%=e_id%>"/>
             </td>
            </tr>
             <tr>
          <td>
         <input type="submit" name="Accept" value="Accept"/>
         &nbsp;&nbsp;
        <input type="submit" name="RejectFriend" value="Reject"/>
          </td>
  
   </tr>
               
        </table>
              </form>
          </td>
   </tr>
<%  
         
         photo="";
         
              }%>
            
 </table>
         
   
</div>
