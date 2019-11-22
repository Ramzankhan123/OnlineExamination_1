<%-- 
    Document   : AddSubjectForm
    Created on : 19 Apr, 2018, 1:00:12 PM
    Author     : ramzan khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="color: whitesmoke;background-color: #0056b3">Online Examination System</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/OnlineExamination/admin_index.html">Home</a></li>
                    <li><a href="ShowAllSubject.jsp">ShowAllSubject</a></li>
                    
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
        <div class="container">

            <form action="../AddSubjectController" method="Get">
                <h2>Add Subject Form</h2>
                <div class="form-group">
                    <label>Subject Name:</label>
                    <input type="text" class="form-control" id="sub_name" placeholder="Enter Subject name" name="sub_name">
                </div>

                <div class="form-group">
                    <label for="add">Subject Max Marks:</label>
                    <input type="text" class="form-control" id="sub_max_marks" placeholder="Enter Subject Max Marks" name="sub_max_marks">
                </div>
                <div class="form-group">
                    <label >Subject Passing Marks</label>
                    <input type="text" class="form-control" id="sub_passing_marks" placeholder="Enter Subject Passing Marks" name="sub_passing_marks">
                </div>
                <div class="form-group">
                    <label >Subject Fees:</label>
                    <input type="text" class="form-control" id="sub_fees" placeholder="Enter Subject Fees" name="sub_fees">
                </div>
                <div class="form-group">
                    <label>Subject Total Questions:</label>
                    <input type="text" class="form-control" id="sub_total_questions" placeholder="Enter Subject Total Questions" name="sub_total_questions">
                </div>

                <div class="form-group">
                    <label>Subject Duration:</label>
                    <input type="text" class="form-control" id="sub_duration" placeholder="Enter Subject Duration " name="sub_duration">
                </div>
                <button type="submit" class="btn btn-lg btn-success">Submit</button>
            </form>
        </div>
    </body>
</html>
