<%-- 
    Document   : BootstrapHeader
    Created on : 17 Nov, 2019, 2:24:05 PM
    Author     : ramzan khan
--%>

<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Online Examination System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.html">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="user_login_1.jsp" style="background-color: green">LOGIN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
              <li>
                           <% 
                             if(session.getAttribute("Login")==null){
                               %>
                               <a href="user_login_1.jsp?pagename=<%= request.getRequestURL() %>"> 
                                   <i class="fa fa-sign-in" aria-hidden="true"></i>Login
                               </a>
                                   <%} else
                                        {
                                        Student st = (Student) session.getAttribute("Login");
                                       %>
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" >
                                    <span class="glyphicon glyphicon-user"></span><%= st.getName() %> 
                                    <i class="caret"></i>
                                </a>   
                                    <ul id="userprofile" class="dropdown-menu">
                                        <li><a href="UserProfile.jsp">Your Profile</a></li>
                                        <li><a href="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;Logout</a></li>
                                    </ul>
                             <% } %>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Contect.jsp">CONTACT</a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>

      
                         
                     
            
    </body>
</html>

