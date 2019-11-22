/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Student;
import Bean.Subject;
import DAO.StudentOperation;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ramzan khan
 */
public class AddSubjectControll extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubjectOperation so = new SubjectOperation();
        StudentOperation sto = new StudentOperation();
        Student st = null;
        Subject sub;
        long l = Long.parseLong(req.getParameter("id"));
        if(req.getParameter("addsub") != null){
            Enumeration paramnames= req.getParameterNames();
            
            while(paramnames.hasMoreElements()){
                String spname = paramnames.nextElement().toString();
                if(!spname.equals("addsub")){
                    if(!spname.equals("id")){
                        resp.getWriter().print(spname + ":" + req.getParameter(spname));
                        int sub_id = Integer.parseInt(req.getParameter(spname));
                        st = sto.selectStudent(l);
                        sub = so.selectSubject(sub_id);
                        st.getSubjectlist().add(sub);
                    }
                }
            }
            
            long returnid=sto.upDate(l, st);
            if(returnid>0){
                resp.sendRedirect("AdminPanel/StudentControll/UpdateStudent.jsp?id="+l);
            }
                
            
        }
        
    }

   

}
