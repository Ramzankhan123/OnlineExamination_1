/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Student;
import DAO.StudentDeclaration;
import DAO.StudentOperation;
import HelpingClass.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ramzan khan
 */
@WebServlet(name = "RagisterController", urlPatterns = {"/RagisterController"})
public class RagisterController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException  {
        PrintWriter out = resp.getWriter();
        String name, address, contact, admission_date, course, email, password;
        double fees;

        name = req.getParameter("name");
        address = req.getParameter("address");
        contact = req.getParameter("contact");
        admission_date = req.getParameter("admission_date");
        fees = Double.parseDouble(req.getParameter("fees"));

        course = req.getParameter("course");
        email = req.getParameter("email");
        password = req.getParameter("password");
     //   password = BCrypt.hashpw(password, BCrypt.gensalt(12));     for encrypt the password 
        Student st = new Student(name, address, email, contact, fees, admission_date, course, password);
        StudentDeclaration sd = new StudentOperation();
        // st.setSubjectlist(sd.selectStudent(ID).getSubjectlist());
        long id = sd.insertStudent(st);
        if (id > 0) {
           // out.println("data insert Successfully");
           resp.sendRedirect("/OnlineExamination/user_login_1.jsp");
        } else {
            out.println("StudentRegistration.jsp");
        }
    }

}
