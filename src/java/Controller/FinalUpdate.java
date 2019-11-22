/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Student;
import DAO.StudentOperation;
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
public class FinalUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            long ID = Long.parseLong(req.getParameter("id"));

            PrintWriter out = resp.getWriter();

            String name, address, email, contact, admission_date, course, password;
            double fees;

            name = req.getParameter("name");
            address = req.getParameter("address");
            contact = req.getParameter("contact");
            fees = Double.parseDouble(req.getParameter("fees"));
            admission_date = req.getParameter("admission_date");
            course = req.getParameter("course");
            email = req.getParameter("email");
            password = req.getParameter("password");

            Student st = new Student(name, address, email, contact, fees, admission_date, course, password);
           // st.setS_id(id);
            StudentOperation so = new StudentOperation();
            st.setSubjectlist(so.selectStudent(ID).getSubjectlist());

            long l = so.upDate(ID, st);
            if (l > 0) {
                out.println("------------------------------------" + req.getParameter("id"));
            } else {
                out.println("error");
            }
        } else {
            resp.getWriter().print("there is something wrong");
        }
    }

}
