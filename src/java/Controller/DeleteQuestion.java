/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuestionOperation;
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
public class DeleteQuestion extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException  {
       
       int a=Integer.parseInt(req.getParameter("id"));
       QuestionOperation so = new QuestionOperation();
       boolean b= so.delete(a);
       if(b){
           resp.sendRedirect("AdminPanel/ShowAllSubject.jsp");
       }
       else{
           resp.getWriter().print("Something Wrong!!! Data not deleted");
       }
    }

}
