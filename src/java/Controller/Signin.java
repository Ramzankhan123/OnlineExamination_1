/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Student;
import DAO.StudentDeclaration;
import DAO.StudentOperation;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author ramzan khan
 */
public class Signin extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException  {
        String username ,password;
        username = req.getParameter("umail");
        password = req.getParameter("pass");
        Student st = new Student();
        st.setEmail(username);
        st.setPassword(password);
        StudentDeclaration sd = new StudentOperation();
        Student st2= sd.signIn(st);
        if(st2!=null)
        {
            req.getSession().setAttribute("Login", st2);
            resp.sendRedirect("HomePage.jsp");
            //System.out.println(""+username+password);
        }
        else
        {
            resp.sendRedirect("user_login_1.jsp?result=UserName & Password Not Match");
        }
        
 
    }
    
}
