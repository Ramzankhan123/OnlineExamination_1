<%-- 
    Document   : ShowallStudent
    Created on : 17 Apr, 2018, 10:11:27 PM
    Author     : ramzan khan
--%>

<%@page import="Bean.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DAO.StudentOperation"%>


<!DOCTYPE html>
<html>
    <head>


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
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Admission_date</th>
                        <th>course</th>
                        <th>Course Detail</th>
                        <th>fees</th>
                        <th>password</th>


                    </tr>
                </thead>
                <%
                    StudentOperation st = new StudentOperation();
                    List li = st.searchByName(targetString);
                    ListIterator lit = li.listIterator();
                    while (lit.hasNext()) {
                        Student student = (Student) lit.next();

                %>
                <tr>
                    <td> <%= student.getS_id()%> </td>
                    <td> <%= student.getName()%> </td>
                    <td> <%= student.getAddress()%> </td>
                    <td> <%= student.getContact()%> </td>
                    <td> <%= student.getEmail()%> </td>
                    <td> <%= student.getAdmission_date()%> </td>
                    <td> <%= student.getCourse()%> </td>
                    <td>
                        <%
                            Set s = student.getSubjectlist();
                            Iterator ite = s.iterator();
                            while (ite.hasNext()) {
                                Subject sub2 = (Subject) ite.next();
                                out.println(sub2.getSub_name());
                            }
                        %> 
                    </td>
                    <td> <%= student.getFees()%> </td>
                    <td> <%= student.getPassword()%> </td>
                    <td> <a class="update" href="StudentControll/UpdateStudent.jsp?id=<%= student.getS_id()%>" >Update</a></td>
                    <td> <a class="delete" href="StudentControll/DeleteStudent.jsp?id=<%= student.getS_id()%>" >Delete</a></td>
                </tr>
                <% }%>



            </table>
        </div>
        <%
            }
        %>

        <!------------------------searched data----------->

        <div class="container">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Admission_date</th>
                        <th>course</th>
                        <th>Course Detail</th>
                        <th>fees</th>
                        <th>password</th>


                    </tr>
                </thead>
                <%
                    StudentOperation st = new StudentOperation();
                    if (st.selectAllStudents() != null) {
                        List li = st.selectAllStudents();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Student student = (Student) lit.next();

                %>
                <tr>
                    <td> <%= student.getS_id()%> </td>
                    <td> <%= student.getName()%> </td>
                    <td> <%= student.getContact()%> </td>
                    <td> <%= student.getAddress()%> </td>

                    <td> <%= student.getEmail()%> </td>
                    <td> <%= student.getAdmission_date()%> </td>
                    <td> <%= student.getCourse()%> </td>
                    <td>
                        <%
                            Set s = student.getSubjectlist();
                            Iterator ite = s.iterator();
                            while (ite.hasNext()) {
                                Subject sub2 = (Subject) ite.next();
                                out.println(sub2.getSub_name());
                            }
                        %>
                    </td>
                    <td> <%= student.getFees()%> </td>
                    <td> <%= student.getPassword()%> </td>
                    <td> <a class="update" href="StudentControll/UpdateStudent.jsp?id=<%= student.getS_id()%>" >Update</a></td>
                    <td> <a class="delete" href="StudentControll/DeleteStudent.jsp?id=<%= student.getS_id()%>" >Delete</a></td>
                </tr>
                <% }
                    } else {
                        out.print("no data found");
                    }
                %>



            </table>
        </div>

    </body>
</html>
