<%-- 
    Document   : UpdateSubject
    Created on : 7 Jun, 2018, 8:04:50 AM
    Author     : ramzan khan
--%>

<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <%!
        int id;
        SubjectOperation so = new SubjectOperation();
        Subject sub;
    %>
    <%
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
            sub = so.selectSubject(id);
            if (sub != null) {
    %>
    <body>
        <div class="container">

            <form action="../../FinalUpdateForSubject" method="post">
                <h2>Update Subject Form</h2>
                 <input type="hidden"  value="<%=sub.getSub_id() %>"   name="id">
                <div class="form-group">
                    <label>Subject Name:</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_name() %>" id="sub_name" placeholder="Enter Subject name" name="sub_name">
                </div>

                <div class="form-group">
                    <label for="add">Subject Max Marks:</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_max_marks() %>" id="sub_max_marks" placeholder="Enter Subject Max Marks" name="sub_max_marks">
                </div>
                <div class="form-group">
                    <label >Subject Passing Marks</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_passing_marks() %>" id="sub_passing_marks" placeholder="Enter Subject Passing Marks" name="sub_passing_marks">
                </div>
                <div class="form-group">
                    <label >Subject Fees:</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_fees() %>" id="sub_fees" placeholder="Enter Subject Fees" name="sub_fees">
                </div>
                <div class="form-group">
                    <label>Subject Total Questions:</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_total_questions() %>" id="sub_total_questions" placeholder="Enter Subject Total Questions" name="sub_total_questions">
                </div>

                <div class="form-group">
                    <label>Subject Duration:</label>
                    <input type="text" class="form-control" value="<%=sub.getSub_duration() %>" id="sub_duration" placeholder="Enter Subject Duration " name="sub_duration">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
                <h1 style="color: red;"><%= request.getParameter("result") != null ? request.getParameter("result") : ""%> </h1>
             <%
                            }
                        } else {
                            out.print("Select any record of the student because id is null");
                        }
                    %>
        </div>
    </body>
</html>
