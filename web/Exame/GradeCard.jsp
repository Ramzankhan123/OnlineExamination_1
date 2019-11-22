<%-- 
    Document   : GradeCard
    Created on : 5 Jul, 2018, 12:17:32 PM
    Author     : ramzan khan
--%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.*"%>
<%@page import="Bean.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                font-family: monospace;
            }
            h2,h3{
                margin: 1px;
                font-weight: bold;
                color: black;
            }
        </style>    
    </head>
    <body>
        <%  if (session.getAttribute("id") != null && session.getAttribute("type").toString() == "student") {
                StudentOperation studentOperation = new StudentOperation();
                SubjectOperation subjectOperation = new SubjectOperation();
                Student student = studentOperation.selectStudent(Integer.parseInt(session.getAttribute("id").toString()));
                StudentExamInfoDeclaration studentExamInfoDeclaration = new StudentExameInfoImpl();
                List li =studentExamInfoDeclaration.selectAllStudentExamInformation();
                ListIterator lit= li.listIterator();
                AnswerOperation answerOperation = new AnswerOperation();
                QuestionOperation questionOperation = new QuestionOperation();

            
        %>
        
        <div class="container">
              <div class="row profile-name page-header" style="margin-top: 0px!important;">

                <div class="col-sm-2" style="margin-top: 0px!important; text-align: center;">
                    <img src="../images/man-icon.png " height="100" width="100" alt=""/>
                    <br>
                    <%=student.getName()%>
                </div>
                 <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Contact:<%=student.getContact()%>  </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-12">Address:<%=student.getAddress()%>  </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Email:<%=student.getEmail()%>  </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Course:<%=student.getCourse()%>  </div>
                            </div>
                        </div>
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-12">Total Subjects:<%= student.getSubjectlist().size() %> </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total Exam:<%= "" %> </div>
                                </div>
                            </div>
                    </div>
                 </div>
              </div>
        </div>
                            <%
                            }
                            %>
    </body>
</html>
