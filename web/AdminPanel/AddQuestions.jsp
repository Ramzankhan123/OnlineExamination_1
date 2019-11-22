<%-- 
    Document   : AddQuestions
    Created on : 23 Apr, 2018, 4:39:34 PM
    Author     : ramzan khan
--%>

<%@page import="Bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
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
           <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="color: whitesmoke;background-color: #0056b3">Online Examination System</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/OnlineExamination/admin_index.html">Home</a></li>
                    <li><a href="SelectAllQuestion.jsp">ShowAllQuestions</a></li>
                    <li><a href="SelectAllOption.jsp">ShowAllOption</a></li>
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
            <h2>Add Questions Form</h2>
            <form action="../AddQuestionsController" method="get">

                <div class="form-group">
                    <label for="quesstion_marks">Select Any Subject to add questions: </label>
                    <select name="subject_id">
                        <%
                            SubjectOperation subo = new SubjectOperation();
                            if (subo.selectAllSubjects() != null) {
                                List li = subo.selectAllSubjects();
                                ListIterator lit = li.listIterator();
                                while (lit.hasNext()) {
                                    Subject sub = (Subject) lit.next();
                        %>
                        <option value="<%=sub.getSub_id()%>" > <%=sub.getSub_name()%> </option>
                        <%
                            }

                        %>

                    </select>
                </div>

                <div class="form-group">
                    <label for="question_marks">Question Marks:</label>
                    <input type="text" class="form-control" id="question_marks" placeholder="Enter Questions marks " name="question_marks">
                </div>
                <div class="form-group" id="q_option">
                    <label for="question_type">Question Type:</label>
                    <select class="form-control" name="question_type" id="question_type">
                        <option value="Optional">Optional</option>
                        <option value="Written" selected>Written</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="question_text">Question Text:</label>
                    <input type="text" class="form-control" id="question_text" placeholder="Question Text" name="question_text">
                </div>

                <div class="form-group" id="qoption" style="display: none;">
                    <label for="options">Add Option For This Question</label>
                    &nbsp;<input type="text" class="form-control" placeholder="Option 1" id="options1" name="qoption1">
                    &nbsp;<input type="text" class="form-control" placeholder="Option 2" id="options2" name="qoption2">
                    &nbsp;<input type="text" class="form-control" placeholder="Option 3" id="options3" name="qoption3">
                    &nbsp;<input type="text" class="form-control" placeholder="Option 4" id="options4" name="qoption4">

                </div>

                <div class="form-group">
                    <label for="answer_text">Answer Text:</label>
                    <input type="text" class="form-control" id="answer_text" placeholder="Answer Text" name="answer_text">
                </div>



                <button type="submit" class="btn btn-lg btn-success">Submit</button>
            </form>
            <%   } else {
                    out.print("No Subject Available");
                }
            %>
            <h1 style="color: red;"><%= request.getParameter("result") != null ? request.getParameter("result") : ""%> </h1>
        </div>
        <script>
            $(document).ready(function () {
                $('#q_option').change(function () {
                    var optionSelected = $(this).find("option:selected");
                    var textSelected = optionSelected.text();
                    if (textSelected == "Optional") {
                        $('#qoption').slideDown(1000);
                    } else if (textSelected == "Written") {
                        $('#qoption').slideUp();
                    }
                });
            });


        </script>
    </body>
</html>
