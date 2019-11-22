<%-- 
   Document   : UpdateStudent
   Created on : 18 Apr, 2018, 5:17:33 PM
   Author     : ramzan khan
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Student"%>
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
    </head>
    <body>
        <%!
            long id;
            StudentOperation st = new StudentOperation();
            Student student;
            Subject sub;
        %>
        <%
            if (request.getParameter("id") != null) {
                id = Long.parseLong(request.getParameter("id"));

                student = st.selectStudent(id);
                if (student != null) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h2>Student Update Form</h2>
                    <form action="../../FinalUpdate" method="post">
                        <div>
                        <input type="hidden"  value="<%=student.getS_id()%>"   name="id">
                        </div>
                        <div class="form-group">
                            <label>NAME:</label>
                            <input type="text" class="form-control" value="<%=student.getName() %>" id="name" placeholder="Enter name" name="name">

                        </div>

                        <div class="form-group">
                            <label for="add">ADD:</label>
                            <input type="text" class="form-control" value="<%=student.getAddress()%>" id="address" placeholder="Enter your address" name="address">
                        </div>
                        <div class="form-group">
                            <label for="contact">CONTACT:</label>
                            <input type="text" class="form-control" value="<%=student.getContact()%>" id="contact" placeholder="Enter your contact number" name="contact">
                        </div>
                        <div class="form-group">
                            <label for="fees">FEES:</label>
                            <input type="text" class="form-control" value="<%=student.getFees()%>" id="fees" placeholder="Enter your Fees Amount" name="fees">
                        </div>
                        <div class="form-group">
                            <label for="admission_date">ADMISSION DATE:</label>
                            <input type="text" class="form-control" value="<%=student.getAdmission_date()%>" id="admission_date"  placeholder="Enter your admission date" name="admission_date">
                        </div>

                        <div class="form-group">
                            <label for="course">course:</label>
                            <input type="text" class="form-control" value="<%=student.getCourse()%>" id="course" placeholder="Enter your course " name="course">
                        </div>



                        <div class="form-group">
                            <label>Email:</label>
                            <input type="text" class="form-control" value="<%=student.getEmail()%>" id="email" placeholder="Enter name" name="email">
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" value="<%=student.getPassword()%>" id="password" placeholder="Enter password" name="password">
                        </div>



                        <div class="checkbox">
                            <label><input type="checkbox" name="remember"> Remember me</label>
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>

                    <%
                            }
                        } else {
                            out.print("Select any record of the student because id is null");
                        }
                    %>
                </div>

                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <h3 for="fees">Taken by Student</h3>   
                                <ul>
                                    <form action="../../RemoveSubjectFromStudent" method="get">
                                        <%
                                            StudentOperation st2 = new StudentOperation();
                                            Student student2 = st2.selectStudent(id);
                                            Set s = student2.getSubjectlist();
                                            Iterator ite = s.iterator();
                                            int i = 0;
                                            while (ite.hasNext()) {
                                                i++;
                                                Subject sub2 = (Subject) ite.next();
                                        %>
                                        <li class="list-group-item">
                                            <input type="checkbox" name="<%=sub2.getSub_name()%>" value="<%=sub2.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=sub2.getSub_name()%>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <input type="hidden" name="id" value="<%=id%>">
                                        <button type="submit" name="removesub" class="btn btn-block btn-success" value="Add2">Remove Subject From Student</button>

                                    </form>
                                </ul>
                            </div>   
                        </div>
                        <div class="col-sm-6">
                            <span><h3>All Available Subjects:</h3></span> 
                            <ul class="list-group">
                                <form action="../../AddSubjectControll">
                                    <%
                                        SubjectOperation subop = new SubjectOperation();
                                        List li = subop.selectAllSubjects();
                                        ListIterator lit = li.listIterator();
                                        while (lit.hasNext()) {
                                            sub = (Subject) lit.next();
                                    %>
                                    <li class="list-group-item">
                                        <input type="checkbox" name="<%=sub.getSub_name()%>" value="<%=sub.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=sub.getSub_name()%>
                                    </li>
                                    <%
                                        }
                                    %>
                                    <input type="hidden" name="id" value="<%=id%>">
                                    <button type="submit" name="addsub" class="btn btn-block btn-success" value="Add">Add Subject to Student</button>
                                </form>

                            </ul>
                        </div>                      
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
