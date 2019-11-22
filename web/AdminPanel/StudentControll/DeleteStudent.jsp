<%-- 
    Document   : DeleteStudent
    Created on : 18 Apr, 2018, 5:18:37 PM
    Author     : ramzan khan
--%>

<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          long id= Long.parseLong(request.getParameter("id"));
          StudentOperation so= new StudentOperation();
          boolean b=so.delete(id);
          if(b){
               response.sendRedirect("../ShowAllSubject.jsp");
          }else{
               out.print("Something Wrong!!! contect to admin");
          }
          
            
            %>
    </body>
</html>
