 <%-- 
    Document   : SelectAllOption
    Created on : 23 Apr, 2018, 4:44:34 PM
    Author     : ramzan khan
--%>

<%@page import="DAO.OptionOperation"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Questions_option"%>
<%@page import="java.util.*"%>
<%@page import="Bean.Questions"%>
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
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
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
        <!------------------------searched data-------->
        <%
            String subName = null;
            if (request.getParameter("id") != null) {
                String targetString = request.getParameter("id");
                QuestionOperation operation = new QuestionOperation();
                Questions q = operation.selectQuestion(Integer.parseInt(request.getParameter("id")));

        %>
        <div class="container">

            <table class="table table-striped">
                <Option>Question Detail</option>

                <tr>
                    <th>Language Name</th>
                    <th>Question Id</th>
                    <th>Question type</th>
                    <th>Question Text</th>
                    <th>Answer Text</th>
                </tr>
                <tr>
                 
                    <td> <%=q.getSubject().getSub_name() %> </td>

                    <td> <%=q.getQuestion_id()%> </td>
                    <td> <%=q.getQuestion_type()%> </td>
                    <td> <%=q.getQuestion_text()%> </td>
                    <td> <%=q.getAnswer_text()%> </td>
                </tr>







            </table>
        </div>

        <% }%>
        <!------------------------searched data----------->

        <%
            if (request.getParameter("submit_search") != null) {
                String targetString = request.getParameter("search");
        %>
        <div class="container">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Option ID</th>
                        <th>Question Id</th>
                        <th>Option 1</th>
                        <th>Option 2</th>
                        <th>Option 3</th>
                        <th>Option 4</th>
                    </tr>
                </thead>
                <%
                    OptionOperation st = new OptionOperation();
                    if (st.selectAllOptions() != null) {
                        List li = st.selectAllOptions();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Questions_option questions_option = (Questions_option) lit.next();

                %>
                <tr>
                    <td> <%=questions_option.getOption_id()%> </td>
                    <td> <a href="SelectAllOption.jsp?id= <%=questions_option.getQuestions_no().getQuestion_id()%>"><%=questions_option.getQuestions_no().getQuestion_id()%> </td>
                    <td> <%=questions_option.getOption1()%> </td>
                    <td> <%=questions_option.getOption2()%> </td>
                    <td> <%=questions_option.getOption3()%> </td>
                    <td> <%=questions_option.getOption4()%> </td>


                    <td> <a class="update" href="StudentControll/QuestionsUpdateForm.jsp?id=<%=questions_option.getOption_id()%>" >Update</a></td>
                    <td> <a class="delete" href="../DeleteOption?id=<%=questions_option.getOption_id()%>">Delete</a></td>
                </tr>
                <% }
                        }
                    }
                %>



            </table>
        </div>
    </body>
</html>
