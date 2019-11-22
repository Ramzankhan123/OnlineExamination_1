<%-- 
    Document   : Result
    Created on : 27 Apr, 2018, 10:06:06 AM
    Author     : ramzan khan
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.OptionOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.*"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="DAO.StudentDeclaration"%>
<%@page import="DAO.*"%>

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
        <div class="jumbotron container" style="margin-top: 0px!important;">

            <% if (session.getAttribute("id") != null) {

                    try {
                        long id = Integer.parseInt(session.getAttribute("id").toString());
                        int subid = Integer.parseInt(request.getParameter("sub"));

                        StudentDeclaration sd = new StudentOperation();
                        SubjectDeclaration subd = new SubjectOperation();
                        AnswerOperation ao = new AnswerOperation();
                        QuestionOperation qo = new QuestionOperation();

                        Student st = sd.selectStudent(id);
                        Subject sub = subd.selectSubject(subid);

                        List li = ao.searchByStudent$language(st, sub);

                        int totalquestions = qo.selectBySubject(sub).size();
                        int attemptQuestions = li.size();
                        int totalrightanswer = ao.WrongOrRight("Right", st, sub).size(), totalwronganswer = ao.WrongOrRight("Wrong", st, sub).size();
                        double totalmarkofsubject = qo.SumOfMarks(sub);
                        double totalmarkofstudent = 0.0;
                        ListIterator lit = li.listIterator();
                        int qno = 0;
                        //-----------------------------------to sum of all right answer marks 

                        double totalRightAnswerMarks = 0;
                        if (ao.WrongOrRight("Right", st, sub) != null) {
                            List right_ans_li = ao.WrongOrRight("Right", st, sub);
                            ListIterator right_ans_lit = right_ans_li.listIterator();
                            while (right_ans_lit.hasNext()) {
                                Answer ans = (Answer) right_ans_lit.next();
                                totalRightAnswerMarks += ans.getQuestions().getMarks();
                            }
                        }

            %>

            <div class="row profile-name page-header" style="margin-top: 0px!important;">

                <div class="col-sm-2" style="margin-top: 0px!important; text-align: center;">
                    <img src="../images/man-icon.png " height="100" width="100" alt=""/>
                    <br>
                    <%=st.getName()%>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Contact:<%=st.getContact()%>  </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">Address:<%=st.getAddress()%>  </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Email:<%=st.getEmail()%>  </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Course:<%=st.getCourse()%>  </div>
                            </div>
                        </div>
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-12">Total question:<%= totalquestions %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total attempted question:<%= attemptQuestions %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total right answer:<%= totalrightanswer %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total wrong answer:<%= totalwronganswer %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total marks for <%= sub.getSub_name() + ":" + qo.SumOfMarks(sub) %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">Total marks for right answer <%= totalRightAnswerMarks %>  </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12" style="color: #990000; font-weight: bold">You are :<%=((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) < 40 ? "Failed" : "Passed"%> <%= "<br> You Got" + ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%  requires 40% minimum" %> </div>                                                             
                                </div>
                            </div>
                    </div>      


                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar"
                                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>">
                                            <%=((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-2" >
                            <a href="GradeCard.jsp">Check Your Grade Card </a>
                            <hr style="border: thin dashed black;">
                            <a href="">Request for certificate </a>
                        </div>   
                    </div>


                    <% while (lit.hasNext()) {
                            qno++;
                            Answer ans = (Answer) lit.next();
                            if (ans.getWrongOrRight().equals("Right")) {
                                totalrightanswer++;
                            } else if (ans.getWrongOrRight().equals("Wrong")) {
                                totalwronganswer++;
                            }
                    %>

                    <div class="row" style="margin-bottom: 10px; box-shadow: 1px 1px 5px black;">
                        <div class="col-sm-2">
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    Question:<%=qno%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    Your Answer
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    Right answer
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8" >
                            <div class="row">
                                <div class="col-sm-12 well well-sm"><%= ans.getQuestions().getQuestion_text()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm"><%= ans.getAnswerText()%> <span style="float: right;"></span>  </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm"><%= ans.getQuestions().getAnswer_text()%></div>
                            </div>
                        </div> 
                        <div class="col-sm-2" >    
                            <div class="row">
                                <div class="col-sm-12 well well-sm">Type:<%= ans.getQuestions().getQuestion_type() %></div>
                            </div> 
                            <div class="row">
                                <div class="col-sm-12 well well-sm"><%=ans.getWrongOrRight() %></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">Not Satisfied</div>
                            </div>
                        </div>    

                    </div>
                    <%

                                }
                            } catch (Exception ex) {
                                out.print("error");
                            }
                        }


                    %>

                </div>
                </body>
                </html>
