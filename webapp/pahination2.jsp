<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page"
 xmlns:c="urn:jsptld:http://java.sun.com/jsp/jstl/core">
 <jsp:directive.page contentType="text/html; charset=UTF-8" />
 
 <link rel="stylesheet" type="text/css" href="css/screen.css" />
 <jsp:scriptlet>
     int pageNumber=1;
     if(request.getParameter("page") != null) {
       session.setAttribute("page", request.getParameter("page"));
       pageNumber = Integer.parseInt(request.getParameter("page"));
     } else {
       session.setAttribute("page", "1");
     }
     String nextPage = (pageNumber +1) + "";
     session.setAttribute("EmpList","5");
     System.out.println(((java.util.List)session.getAttribute("EmpList")).size());
     String myUrl = "pagingEmp.jsp?page=" + nextPage;
     System.out.println(myUrl);
 
     pageContext.setAttribute("myUrl", myUrl);
 </jsp:scriptlet>
 <h2 align="center">Emp Table with Display tag</h2>
 <jsp:useBean id="EmpList" scope="session" type="java.util.List"></jsp:useBean>
 <table>
   <tr>
     <th>Employee Id</th>
     <th>Name</th>
     <th>Job</th>
     <th>Salary</th>
   </tr>
   <c:forEach items="${EmpList}" var="emp" begin="0" end="10">
     <tr>
       <td><c:out value="${emp.empId}"></c:out></td>
       <td><c:out value="${emp.empName}"></c:out></td>
       <td><c:out value="${emp.empJob}"></c:out></td>
       <td><c:out value="${emp.empSal}"></c:out></td>
     </tr>
   </c:forEach>
 
   <tr>
     <td colspan="2"></td>
     <td colspan="2"><a href="${pageScope.myUrl}">nextPage</a></td>
   </tr>
 </table>
</jsp:root>