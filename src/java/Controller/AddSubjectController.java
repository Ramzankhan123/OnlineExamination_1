/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Subject;
import DAO.SubjectDeclaration;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ramzan khan
 */
@WebServlet(name = "AddSubjectController", urlPatterns = {"/AddSubjectController"})
public class AddSubjectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sub_name;
        int sub_max_marks, sub_total_questions, sub_duration, sub_passing_marks, sub_fees;
        sub_name = req.getParameter("sub_name");
        sub_max_marks = Integer.parseInt(req.getParameter("sub_max_marks"));
        sub_total_questions = Integer.parseInt(req.getParameter("sub_total_questions"));
        sub_duration = Integer.parseInt(req.getParameter("sub_duration"));
        sub_passing_marks = Integer.parseInt(req.getParameter("sub_passing_marks"));
        sub_fees = Integer.parseInt(req.getParameter("sub_fees"));
        
        Subject sub= new Subject( sub_name,sub_max_marks, sub_total_questions, sub_duration,sub_passing_marks,sub_fees );
        SubjectDeclaration sd = new SubjectOperation();
        sd.insertSubject(sub);
        
    }

}
