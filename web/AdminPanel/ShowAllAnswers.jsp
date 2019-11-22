<%-- 
    Document   : SelectAllQuestion
    Created on : 23 Apr, 2018, 4:43:45 PM
    Author     : ramzan khan
--%>

<%@page import="Bean.Answer"%>
<%@page import="DAO.AnswerOperation"%>
<%@page import="Bean.Questions"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.QuestionOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


        <div class="container">

            <table class="table table-striped">
                <caption>All Question Records</caption>
                <thead>
                    <tr>
                        <th>Answer Id</th>
                        <th>Subject Name</th>
                        <th>Question Id</th>
                        <th>Question Marks</th>
                        <th>Question Type</th>
                        <th>Question Text</th>
                        <th>Actual Answer Text</th>
                        <th>Student Answer Text</th>
                        <th>Wrong or Right</th>
                        <th>Answer Date</th>
                    </tr>
                </thead>
                <%
                    AnswerOperation ao = new AnswerOperation();
                    if (ao.selectAllAnswer() != null) {
                        List li = ao.selectAllAnswer();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Answer answer = (Answer) lit.next();

                %>
                <tr>
                    <td> <%=answer.getId()%> </td>
                    <td> <%=answer.getSubjectid().getSub_name()%> </td>
                    <td> <%=answer.getQuestions().getQuestion_id()%> </td>
                    <td> <%=answer.getQuestions().getMarks()%> </td>
                    <td> <%=answer.getQuestions().getQuestion_type()%> </td>
                    <td> <%=answer.getQuestions().getQuestion_text()%> </td>
                    <td> <%=answer.getQuestions().getAnswer_text()%> </td>
                    <td> <%=answer.getAnswerText()%> </td>
                    <td> <%=answer.getWrongOrRight()%> </td>
                    <td> <%=answer.getAnswer_date()%> </td>

                    <td> <a class="update" href="QuestionControll/QuestionUpdateForm.jsp?id=<%=answer.getId()%>" >Update</a></td>
                    <td> <a class="delete" href="../DeleteSubject?id=<%=answer.getId()%>">Delete</a></td>
                </tr>
                <% }
                    }
                %>



            </table>
        </div>
    </body>
</html>
