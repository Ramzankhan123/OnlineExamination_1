<%-- 
    Document   : ShowAllSubject
    Created on : 22 Apr, 2018, 3:55:58 PM
    Author     : ramzan khan
--%>

<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="Bean.Student"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <style>
            .update,.delete{
                border-radius: 10px;
                padding: 5px;
            }
            .update{
                border: thin solid green;

            }
            .delete{
                border: thin solid red;

            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="color: whitesmoke;background-color: #0056b3">Online Examination System</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/OnlineExamination/admin_index.html">Home</a></li>
                    <li><a href="AddSubjectForm.jsp">Add Subject</a></li>
                    <li><a href="#">Page 2</a></li>
                </ul>
                <form class="navbar-form navbar-left" action="#">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button name="submit_search" type="submit" class="btn btn-default">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </form>
            </div>
        </nav>
        <!------------------------searched data----------->
        <%
            if (request.getParameter("submit_search") != null) {
                String targetString = request.getParameter("search");
        %>
        <div class="container">

            <table class="table table-striped">
                <caption>Search Data</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Subject Name</th>
                        <th>Subject Max Marks</th>
                        <th>Subject Passing Marks</th>
                        <th>Total Questions</th>
                        <th>Duration</th>
                        <th>Fees</th>



                    </tr>
                </thead>
                <%
                    SubjectOperation st = new SubjectOperation();
                    if (st.searchByName(targetString) != null) {

                        List li = st.searchByName(targetString);
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Subject subject = (Subject) lit.next();

                %>
                <tr>
                    <td> <%=subject.getSub_id()%> </td>
                    <td> <%= subject.getSub_name()%> </td>
                    <td> <%= subject.getSub_max_marks()%> </td>
                    <td> <%= subject.getSub_passing_marks()%> </td>
                    <td> <%= subject.getSub_total_questions()%> </td>
                    <td> <%= subject.getSub_duration()%> </td>
                    <td> <%= subject.getSub_fees()%> </td>

                    <td> <a class="update" href="../UpdateSubject?id=<%= subject.getSub_id()%>" >Update</a></td>
                    <td> <a class="delete" href="DeleteSubject?id=<%= subject.getSub_id()%>" >Delete</a></td>
                </tr>
                <% }%>



            </table>
        </div>
        <%
                }
             else {
                out.println("There is no records");
            }
        }
        %>

        <!------------------------searched data----------->
        <div class="container">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Subject Name</th>
                        <th>Subject Max Marks</th>
                        <th>Subject Passing Marks</th>
                        <th>Total Questions</th>
                        <th>Duration</th>
                        <th>Fees</th>


                    </tr>
                </thead>
                <%                    
                    
                    SubjectOperation st = new SubjectOperation();
                    if (st.selectAllSubjects() != null) {
                        List li = st.selectAllSubjects();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Subject subject = (Subject) lit.next();

                %>
                <tr>
                    <td> <%=subject.getSub_id()%> </td>
                    <td> <%= subject.getSub_name()%> </td>
                    <td> <%= subject.getSub_max_marks()%> </td>
                    <td> <%= subject.getSub_passing_marks()%> </td>
                    <td> <%= subject.getSub_total_questions()%> </td>
                    <td> <%= subject.getSub_duration()%> </td>
                    <td> <%= subject.getSub_fees()%> </td>

                    <td> <a class="update" href="SubjectControll/UpdateSubject.jsp?id=<%= subject.getSub_id()%>" >Update</a></td>
                    <td> <a class="delete" href="../DeleteSubject?id=<%= subject.getSub_id() %>">Delete</a></td>
                </tr>
                <% }
                    }
                %>



            </table>
        </div>
    </body>
</html>
