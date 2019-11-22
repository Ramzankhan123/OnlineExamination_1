<%-- 
    Document   : student_login
    Created on : 16 Nov, 2019, 1:22:14 PM
    Author     : ramzan khan
--%>


<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("umail");    
    String pwd = request.getParameter("pass");
    String result = request.getParameter("result");
    Class.forName("org.postgresql.Driver");  
    Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/onlineExam2","postgres","imramzan"); 
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from student where email='" + userid + "' and password='" + pwd + "'");
    while(rs.next()) {
        int id=rs.getInt("s_id");
        session.setAttribute("userid", id);
        response.sendRedirect("selectlanguage.jsp");
    } 
    
%>
