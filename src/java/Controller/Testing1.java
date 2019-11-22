/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;


/**
 *
 * @author ramzan khan
 */
public class Testing1 extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        SessionFactory sf = HelpingClass.Sessionfact.getSessionfact();
         PrintWriter pr = resp.getWriter();
         pr.println("look like done ");
}
}
