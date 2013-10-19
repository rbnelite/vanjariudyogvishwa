<%@page import="COM.RBNELITE.ENTITY.EducationDao"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
            
                String Pg_Clg="";
                String Pg_degree="";
                String clg="";
                String degree="";
                String school="";
                String grad_special="";
               String pg_special="";
               SessionFactory sf =  new Configuration().configure().buildSessionFactory(); 
               Session s=sf.openSession();
               s.beginTransaction();  
               List allUsers;  
               Query queryResult = s.createQuery("from EducationDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult.list();
               
               for (int i = 0; i < allUsers.size(); i++)
               {  
               EducationDao edu = (EducationDao) allUsers.get(i);        
               Pg_Clg=edu.getPg_clg(); 
               Pg_degree=edu.getPg_degree();
               clg=edu.getClg();
               degree=edu.getGraduation();
               school=edu.getSchool();
               grad_special=edu.getOthr_graduation();
               pg_special=edu.getOthr_pg_degree();
                       
               }
               s.getTransaction().commit();
               s.close();
               sf.close();
%>
    <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                School :
            </td>
            <td>
                <input type="text" name="school" maxlength="30" value="<%=school%>" style="width: 300px">
            </td>
        </tr>
        <tr>
            <td>
               College :
            </td>
            <td>
                <input type="text" name="clg" maxlength="30" style="width: 300px"value="<%=clg%>">
            </td>
        </tr>
        <tr>
            <td>
                Graduation :
            </td>
            <td>
                <input type="text" name="graduation" maxlength="30" style="width: 300px"value="<%=degree%>">
            </td>
        </tr>
        <tr>
            <td>
                Specialization :
            </td>
            <td>
                <input type="text" name="othr_degree" maxlength="20" style="width: 300px"value="<%=grad_special%>"/>
            </td>
        </tr>
        <tr>
            <td>
               PG Collage :
           </td>
            <td>
                <input type="text" name="pg_clg" maxlength="30" style="width: 300px"value="<%=Pg_Clg%>">
            </td>
        </tr>
         <tr>
            <td>
               Post Graduation :
            </td>
            <td>
                <input type="text" name="post_graduation" maxlength="30" style="width: 300px"value="<%=Pg_degree%>">
            </td>
        </tr>
        <tr>
            <td>
               Specialization :
            </td>
            <td>
                <input type="text" name="othr_pg_degree" maxlength="20" style="width: 300px"value="<%=pg_special%>">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="right">
                <input type="submit" name="update_education" value="Update Details" style="background-color: #6e6e6e; width:90px; height:32px;"/>
                
            </td>
        </tr>
    </table>
        </form>
        </body>
  </body>
</html>
