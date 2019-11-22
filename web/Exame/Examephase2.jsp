<%-- 
    Document   : Examephase2
    Created on : 27 Apr, 2018, 10:05:39 AM
    Author     : ramzan khan
--%>



<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.OptionOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                font-family: monospace;
            }
            h2 ,h3{
                margin: 1px;
                font-weight: bold;
                color: black;
            }
        </style>
    </head>
    <body>
        <Div class="container">
            <%
                StudentOperation so = new StudentOperation();
                Student student;
                long id = Long.parseLong(session.getAttribute("id").toString());
                student = so.selectStudent(id);
                int qno = 0;
                boolean lastq = false;
                //System.out.print("rrrrrrrrrrr");
                if (request.getParameter("submit") != null) {
                    int subid = Integer.parseInt(request.getParameter("subject"));
                    QuestionOperation qo = new QuestionOperation();
                    Subject sub = new SubjectOperation().selectSubject(subid);

            %>
            <h1>Subject Id:<%= sub.getSub_id() + "Subject Name:" + sub.getSub_name()%></h1>
            
            <% if (qo.selectNotIn(sub, student) != null) {

                    List li = qo.selectNotIn(sub, student);
                    int size = li.size();
                    ListIterator lit = li.listIterator();
                    while (lit.hasNext()) {
                        qno++;
                        Questions questions = (Questions) lit.next();
                        String qtype = questions.getQuestion_type();
                        if (qno == size) {
                            lastq = true;
                        }
                        if (qtype.equals("Written")) {
            %>   
            <div class="well well-sm"  >
                <form action="../Question_Chack_Store">
                    <h2> Question Type<%=qtype%></h2>
                    <h3>(<%=qtype%>) : <%= questions.getQuestion_text()%><span class="badge badge-sucess" >For <%=questions.getMarks()%></span></h3>
                    <textarea name="answer" class="form-control"></textarea>
                    <ul class="pager">
                        <input type="hidden" value="<%=questions.getQuestion_id()%>" name="qid">
                        <input type="hidden" value="<%=sub.getSub_id()%>" name="subid">
                        <input type="hidden" value="<%= lastq%>" name="lastq">
                        <button type="submit" class="next">Next</button>
                    </ul>

                </form>
            </div>               
            <%
            } else if (qtype.equals("Optional")) {
                Questions_option qoption;
                OptionOperation oo = new OptionOperation();
                List li2 = oo.searchByQuestions(questions);
                ListIterator lit2 = li2.listIterator();
                while (lit2.hasNext()) {
                    qoption = (Questions_option) lit2.next();
            %>

            <div class="well well-sm">
                <form action="../Question_Chack_Store">
                    <h2>Question Type:<%=qtype%></h2>
                    <h3>(<%=qno%>):<%= questions.getQuestion_text()%><span class="badge badge-sucess" >For <%=questions.getMarks()%></span></h3>
                    <ul class="list-group">
                        <li class="list-group"><input type="radio" value="<%=qoption.getOption1()%>" name="answer"> <%=qoption.getOption1()%></li>
                        <li class="list-group"><input type="radio" value="<%=qoption.getOption2()%>" name="answer"> <%=qoption.getOption2()%></li>
                        <li class="list-group"><input type="radio" value="<%=qoption.getOption3()%>" name="answer"> <%=qoption.getOption3()%></li>
                        <li class="list-group"><input type="radio" value="<%=qoption.getOption4()%>" name="answer"> <%=qoption.getOption4()%></li>
                    </ul>
                    <ul class="pager">
                        <input type="hidden" value="<%=questions.getQuestion_id()%>" name="qid">
                        <input type="hidden" value="<%=sub.getSub_id()%>" name="subid">
                        <input type="hidden" value="<%=lastq%>" name="lastq">
                        <button type="submit" class="next">Next</button>
                    </ul>    
                </form>
            </div>
            <%
                        }
                    } else {
                        out.print("Follow the exame phase");
                    }
                }
            } else {
                out.print("looks like you have already given the exame or No  questions are their for subject " + sub.getSub_name());

            %>
            <br>Check your previous results for <%=sub.getSub_name()%> <a href="Result.jsp?sub=<%=sub.getSub_id()%>">Get Result</a>

            <%
                    }
                }
            %>
            
        </div>
    </body>
</html>
