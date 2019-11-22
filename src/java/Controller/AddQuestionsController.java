/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Questions;
import Bean.Questions_option;
import DAO.OptionOperation;
import DAO.QuestionOperation;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ramzan khan
 */
public class AddQuestionsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        byte marks;
        String question_type, question_text, answer_text, option1, option2, option3, option4;

        int subject_id = Integer.parseInt(req.getParameter("subject_id"));
        
   
        marks = Byte.parseByte(req.getParameter("question_marks"));
        question_type = req.getParameter("question_type");
        question_text = req.getParameter("question_text");
        answer_text = req.getParameter("answer_text");

        Questions questions = new Questions(marks, question_type, question_text, answer_text);
        SubjectOperation so = new SubjectOperation();
        QuestionOperation qo = new QuestionOperation();
        questions.setSubject(so.selectSubject(subject_id)); //relationships
        
        int id = qo.insert(questions);    
       
        if (id > 0) {
            if (question_type.equals("Optional")) {
                option1 = req.getParameter("qoption1");
                option2 = req.getParameter("qoption2");
                option3 = req.getParameter("qoption3");
                option4 = req.getParameter("qoption4");

                Questions_option qo2 = new Questions_option(option1, option2, option3, option4);
                qo2.setQuestions_no(qo.selectQuestion(id));
                OptionOperation oo = new OptionOperation();
                long a = oo.insert(qo2);   //Errror
               // resp.sendRedirect("AdminPanel/AddQuestions.jsp?result=added success fully add more questions");

            } else {
                  System.out.print("not addedd successfully");
                resp.sendRedirect("AdminPanel/AddQuestions.jsp?result=added success fully add more questions");
            }
        }else{
            resp.sendRedirect("AdminPanel/AddQuestions.jsp?result=Sorry Questions Not add Try again!!!");
        }
        resp.sendRedirect("AdminPanel/AddQuestions.jsp?result=added success fully add more questions");

    }

}
