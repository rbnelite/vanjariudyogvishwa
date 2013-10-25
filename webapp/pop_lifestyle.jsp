<%@page import="com.rbnelite.udyogvishwa.dao.LifestyleDao"%>
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
      <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
     <%
            String user_mail=(String)session.getAttribute("User_Name");
            %>
    <%
    String diet="";
    String smoke="";
    String drink="";
    String complexion="";
    String body_type="";
    String bld_grp="";
    String weight="";
    String spoken_lang="";
    List allUsers;
     SessionFactory sf2 =  new Configuration().configure().buildSessionFactory(); 
               Session s2=sf2.openSession();
               s2.beginTransaction();  
             
               Query queryResult3 = s2.createQuery("from LifestyleDao where user_mail='"+user_mail+"'");  
               allUsers = queryResult3.list();
             
               for (int i = 0; i < allUsers.size(); i++)
               {  
               LifestyleDao Lif = (LifestyleDao) allUsers.get(i);        
              diet=Lif.getDiet();
              smoke=Lif.getSmoke();
              drink=Lif.getDrink();
              complexion=Lif.getComplexion();
              body_type=Lif.getBody_type();
              bld_grp=Lif.getBld_grp();
              weight=Lif.getWeight();
              //spoken_lang=Lif.getSpoken_lang();
              }
               s2.getTransaction().commit();
               s2.close();
               sf2.close();
    %>
  
    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
                Diet :
            </td>
            <td>
                <input type="text" name="diet" maxlength="10" style="width: 300px" value="<%=diet%>">
            </td>
        </tr>
        <tr>
            <td>
               Smoke :
            </td>
            <td>
                <input type="text" name="smoke" maxlength="3" style="width: 300px" value="<%=smoke%>">
            </td>
        </tr>
        <tr>
            <td>
                Drink :
            </td>
            <td>
                <input type="text" name="drink" maxlength="3" style="width: 300px" value="<%=drink%>">
            </td>
        </tr>
        <tr>
            <td>
                Complexion :
            </td>
            <td>
                <input type="text" name="complx" maxlength="10" style="width: 300px" value="<%=complexion%>">
            </td>
        </tr>
        <tr>
            <td>
                body type :
           </td>
            <td>
                <input type="text" name="body_type" maxlength="10" style="width: 300px" value="<%=body_type%>">
            </td>
        </tr>
         <tr>
            <td>
                Blood Group :
            </td>
            <td>
                <input type="text" name="bld_grp" maxlength="4" style="width: 300px" value="<%=bld_grp%>">
            </td>
        </tr>
         <tr>
            <td>
                Weight :
            </td>
            <td>
                <input type="text" name="weight" maxlength="3" style="width: 300px" value="<%=weight%>">
            </td>
        </tr>
         <tr>
            <td>
              Spoken u speak :
            </td>
            <td>
                <input type="text" name="lang" maxlength="20" style="width: 300px" value="<%=spoken_lang%>">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="update_lifestyle" value="Update Details" style="height: 30px; width: 100px;"/>
               
            </td>
        </tr>
    </table>
        </form>
  </body>
</html>
