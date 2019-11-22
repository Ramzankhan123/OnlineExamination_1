<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="Bean.*"%>
<%-- 
    Document   : selectlanguage
    Created on : 26 Apr, 2019, 9:14:41 AM
    Author     : ramzan khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Examination Process >- Phase 1:</h1>
        <div class="container">
             
             <form action="Examephase2.jsp">
               
                 <div class="form-group">
                    <label for="sell" >Select your Subject: </label>
                    <select class="form-control" name="subject">


                        <%
                            int stid = Integer.parseInt(session.getAttribute("id").toString());
                            StudentOperation sto = new StudentOperation();
                            if (sto.selectStudent(stid) != null) {
                                Student st = sto.selectStudent(stid);
                                Set subjectlist = st.getSubjectlist();
                                Iterator ite = subjectlist.iterator();
                                while (ite.hasNext()) {
                                    Subject sub = (Subject) ite.next();


                        %>
                        <option value="<%=sub.getSub_id()%>"><%=sub.getSub_name()%> </option>
                        <% }
                            }
                        %>
                    </select>
                    <div class="jumbotron">
                        <h2>Read before next Phase </h2>
                        <ul>
                            <li>Dear Students Please Attempt all questions </li>
                            <li>Question can you have in two category(Theory and optional) </li>
                            <li>After completion of this exam you will be awarded by certificate.</li>
                            <input type="checkbox" required=""> I m Agree
                        </ul>   

                    </div>
                    <input class="btn btn-success" type="submit" name="submit">
                </div>
            
            </form>

        </div>
    </body>
</html>
