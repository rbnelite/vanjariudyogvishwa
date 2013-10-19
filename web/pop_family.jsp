<%@page import="COM.RBNELITE.ENTITY.FamilyDao"%>
<%@page import="java.util.List"%>

<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <script src="JavaScript/JScript.js" type="text/javascript"></script>

    <title>Untitled Page</title>
    <script>
         function EnrollNowClick()
        {
            window.parent.modalWin.CallCallingWindowFunction(0, 'Information Saved Scucessfully');
        }
    </script>
    <style>
        body
        {
            font-family: Verdana;
            font-size: 12px;
        }
    </style>
</head>
<body>
     <%
            String user_mail=(String)session.getAttribute("User_Name");
            
                  String fam_value="";
                  String fam_type="";
                  String fam_status="";
                  String fam_income="";
                  List allUsers;
                SessionFactory sf5 = new Configuration().configure().buildSessionFactory(); 
                Session s5=sf5.openSession();
               s5.beginTransaction();  
             
               Query queryResult6 = s5.createQuery("from FamilyDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult6.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               FamilyDao fam = (FamilyDao) allUsers.get(i);        
              fam_value=fam.getFam_values();
              fam_type=fam.getFam_type();
              fam_status=fam.getFam_status();
              fam_income=fam.getFam_income();
              }
               s5.getTransaction().commit();
               s5.close();
               sf5.close();
                 %>
    <form action ="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Family Values :
            </td>
            <td>
                <input type="text" name="fmly_values" maxlength="2" style="width: 300px" value="<%=fam_value%>">
            </td>
        </tr>
         <tr>
            <td>
                Family Type :
            </td>
            <td>
                <input type="text" name="fmly_type" maxlength="20" style="width: 300px" value="<%=fam_type%>">
            </td>
        </tr>
        <tr>
            <td>
               Family Status :
            </td>
            <td>
                <input type="text" name="fmly_status" maxlength="20" style="width: 300px" value="<%=fam_status%>">
            </td>
        </tr>
       
        <tr>
            <td>
                Family Income :
            </td>
            <td>
                <input type="text" name="fmly_incom" maxlength="8" style="width: 300px" value="<%=fam_income%>">
            </td>
        </tr>
       
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_family" value="Update Details" style="height: 30px; width: 100px;"/>
               
            </td>
        </tr>
    </table>
        </form>
  </body>
</html>
