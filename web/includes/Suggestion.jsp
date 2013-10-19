<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Suggestion</title>
</head>
<body>
 <div id="div3">
   <%
    String userName=(String)session.getAttribute("User_Name");
    int need_id=(Integer)session.getAttribute("Need_id");
   %>
   <form action="SolutionController" method="post">
     <input type="hidden" name="mail_id" value="<%=userName%>">
     <input type="hidden" name="need_id" value="<%=need_id%>">
     
   <table align="center" width="200">
    <tr><td>
        Give Suggestion
        </td></tr>
<tr>
    <td>
        <textarea cols="40" rows="2" name="solutionarea" id="solutionarea"></textarea>
    </td>
</tr>
   <tr>
    <td>
        <input type="submit" name="solution" value="post Solution" >
    </td>
</tr>
</table>
   <%
   System.out.println(userName+" :userName");
   System.out.println(need_id+" :need_id");
   %>
       </form>
</div>
</body>
</html>