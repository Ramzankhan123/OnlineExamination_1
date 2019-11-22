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
public class FinalUpdateForQuestions extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        byte marks;
        String question_type, Question_text, answer_text, option1, option2, option3, option4;
        int subject_id = Integer.parseInt(req.getParameter("subject_id"));

        marks = Byte.parseByte(req.getParameter("question_marks"));
        int id = Integer.parseInt(req.getParameter("id"));
        Question_text = req.getParameter("Question_text");
        answer_text = req.getParameter("answer_text");
        question_type = req.getParameter("question_type");
        
        Questions q = new Questions(marks, question_type, Question_text, answer_text);
        q.setQuestion_id(id);
        SubjectOperation so = new SubjectOperation();
        q.setSubject(so.selectSubject(subject_id));
        
        QuestionOperation qo = new QuestionOperation();
        
        int returnedValue= qo.update(id, q);
        if(returnedValue >0){
            
            if(question_type.equals("optional")){
                long option_id = Long.parseLong(req.getParameter("option_id"));
                option1 =req.getParameter("option1");
                option2 =req.getParameter("option2");
                option3 =req.getParameter("option3");
                option4 =req.getParameter("option4");
                Questions_option qo2 = new Questions_option(option1, option2, option3, option4);
                qo2.setQuestions_no(qo.selectQuestion(id));
                OptionOperation oo = new OptionOperation();
                long a = oo.upDate(option_id, qo2);
                resp.sendRedirect("AdminPanel/SelectAllQuestions.jsp");
            }
            else{
                resp.getWriter().print("there is something wrong");
            }
        }

    }

}
