<%-- 
    Document   : Admin login
    Author     : ramzan khan
--%>

<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String result = request.getParameter("result");
    Class.forName("org.postgresql.Driver");  
    Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/onlineExam2","postgres","imramzan"); 
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        response.sendRedirect("admin_index.html");
    } else {
        session.setAttribute("invalid login!!!",result);
        response.sendRedirect("user_login.jsp");
    }
%>

