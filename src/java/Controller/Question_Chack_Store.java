/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.*;
import DAO.AnswerOperation;
import DAO.QuestionOperation;
import DAO.StudentExameInfoImpl;
import DAO.StudentOperation;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ramzan khan
 */
@WebServlet(name = "Question_Chack_Store", urlPatterns = {"/Question_Chack_Store"})
public class Question_Chack_Store extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        long id = Long.parseLong(session.getAttribute("id").toString());
        int questionid = Integer.parseInt(req.getParameter("qid"));
        int subjectid = Integer.parseInt(req.getParameter("subid"));
        String anstext = req.getParameter("answer");
        String WrongOrRight = "Wrong";
        Boolean lastanswer = Boolean.parseBoolean(req.getParameter("lastq"));

        StudentOperation so = new StudentOperation();
        QuestionOperation qo = new QuestionOperation();
        SubjectOperation subjectoperation = new SubjectOperation();
        AnswerOperation ao = new AnswerOperation();

        Questions questions;
        Answer answer;
        Student student;
        Subject subject;

        String adate = new Date().toString();

        student = so.selectStudent(id);
        questions = qo.selectQuestion(questionid);
        subject = subjectoperation.selectSubject(subjectid);
        //compair answer here-----------------------------------------------    
        if (anstext.equals(questions.getAnswer_text())) {
            WrongOrRight = "Right";
        }
        answer = new Answer(subject, student, questions, adate, anstext, WrongOrRight);
        long l = ao.insert(answer);
        if (l > 0 && !lastanswer) {
          //  resp.getWriter().print("inserted");

           resp.sendRedirect("Exame/Examephase2.jsp?subject="+subjectid+"&submit=Chack+status" );
        } else {
            StudentExameInfoImpl exameImpl = new StudentExameInfoImpl();
            List li = ao.searchByStudent$language(student, subject);
            ListIterator lit = li.listIterator();
            //-----------------------------------------to sum of all right answers marks----------

            double totalRightAnswerMarks = 0;
            if (ao.WrongOrRight("Right", student, subject) != null) {
                List right_ans_li = ao.WrongOrRight("Right", student, subject);
                ListIterator right_ans_lit = right_ans_li.listIterator();
                while (right_ans_lit.hasNext()) {
                    Answer ans = (Answer) right_ans_lit.next();
                    totalRightAnswerMarks += ans.getQuestions().getMarks();
                }
            }

            StudentExamInfo examInfo = new StudentExamInfo();
            examInfo.setSt(student);
            examInfo.setSub(subject);
            examInfo.setDate(new Date());
            examInfo.setExamstatus(((totalRightAnswerMarks * 100) / qo.SumOfMarks(subject)) < 40 ? "Fail" : "Passed");
            long status = exameImpl.insert(examInfo);
            if (status > 0) {
                resp.sendRedirect("Exame/Result.jsp?sub=" +subject.getSub_id());
            }

        }

    }

}
