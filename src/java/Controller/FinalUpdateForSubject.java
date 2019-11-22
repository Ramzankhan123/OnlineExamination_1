/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Subject;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ramzan khan
 */
public class FinalUpdateForSubject extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            String sub_name;
            int sub_max_marks, sub_total_questions, sub_duration, sub_passing_marks, sub_fees;

            int sub_id = Integer.parseInt(req.getParameter("id"));
            sub_name = req.getParameter("sub_name");
            sub_max_marks = Integer.parseInt(req.getParameter("sub_max_marks"));
            sub_passing_marks = Integer.parseInt(req.getParameter("sub_passing_marks"));
            sub_total_questions = Integer.parseInt(req.getParameter("sub_total_questions"));
            sub_fees = Integer.parseInt(req.getParameter("sub_fees"));
            sub_duration = Integer.parseInt(req.getParameter("sub_duration"));
            
            Subject sub = new Subject(sub_name, sub_max_marks, sub_total_questions, sub_duration, sub_passing_marks, sub_fees);
            sub.getSub_id();
            SubjectOperation so = new  SubjectOperation();
            //sub.setSub_name(so.selectSubject(sub_id));
            long l = so.update(sub_id, sub);
            if (l > 0) {
                resp.sendRedirect("AdminPanel/SubjectControll/UpdateSubject.jsp?result=update success fully");
            } else {
                resp.sendRedirect("AdminPanel/SubjectControll/UpdateSubject.jsp?result=Error");
            }
            
            

        } else {
            resp.getWriter().print("there is something wrong");
        }

    }
}
