<%-- 
    Document   : StudentRegistration
    Created on : 15 Apr, 2018, 10:18:42 PM
    Author     : ramzan khan
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">

            function FormValid_Client() {  //Function for Client Side form validation 

                var invalid = " "; // Invalid character is a space
                var minLength = 8; // Minimum length
                var pw1 = document.client_signup.password.value;
                var pw2 = document.client_signup.password2.value;
// check for a value in both fields.
                if (pw1 === '' || pw2 === '') {
                    alert('Please enter your password twice.');
                    document.client_signup.pass.focus();
                    return false;
                }
// check for minimum length
                if (pw1.length < minLength) {
                    alert('Your password must be at least ' + minLength + ' characters long. Try again.');
                    document.client_signup.pass.focus();
                    return false;
                }
// check for spaces
                if (pw1.indexOf(invalid) > -1) {
                    alert("Sorry, spaces are not allowed.");
                    document.client_signup.pass.focus();
                    return false;
                } else {
                    if (pw1 !== pw2) {
                        alert("You did not enter the same new password twice. Please re-enter your password.");

                        document.client_signup.re_pass.focus();
                        return false;
                    } else {
                        return true;
                    }
                }

                document.client_signup.submit();


            }

        </script>
    </head>
    <body>
        <%!
            long id;
            StudentOperation st = new StudentOperation();
            Student student;
            Subject sub;
        %>

        <div class="container">
              <div class="row">
                <div class="col-sm-6">

            <form action="RagisterController" method="post" id="client_signup" name="client_signup" OnSubmit="return FormValid_Client();">
                <h2>Student Registration Form</h2>
                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" class="form-control" pattern="[A-Za-z]{1,20}" title="Please Enter a Valid Name" maxlength="25" required="" id="name" placeholder="Enter name" name="name">
                </div>

                <div class="form-group">
                    <label for="add">Address:</label>
                    <input type="text" class="form-control" id="address" required="" placeholder="Enter your address" name="address">
                </div>
                <div class="form-group">
                    <label for="contact">Contact:</label>
                    <input type="text" class="form-control" maxlength="10" pattern="[0-9]{1,10}" title="Use Number Format" required="" id="contact" placeholder="Enter your contact number" name="contact">
                </div>
                <div class="form-group">
                    <label for="fees">Fees:</label>
                    <input type="text" class="form-control" id="fees" maxlength="5" required="" placeholder="Enter your Fees Amount" name="fees">
                </div>
                <div class="form-group">
                    <label for="admission_date">Admission date:</label>
                    <input type="datetime" class="form-control" id="admission_date" required="" placeholder="Enter your admission date" name="admission_date">
                </div>

                <div class="form-group">
                    <label for="course">Course:</label>
                    <input type="text" class="form-control" id="course" required="" placeholder="Enter your course " name="course">
                </div>



                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control" id="email" required="" placeholder="Enter name" name="email">
                </div>
                <div class="form-group">
                    <label >Password:</label>
                    <input type="password" class="form-control" required="" maxlength="8" id="password" placeholder="Enter Password" name="password">
                </div>
                <div class="form-group">
                    <label>Re-Enter the Password:</label>
                    <input type="password" class="form-control" required="" maxlength="8" id="password2" placeholder="Re-Enter Password" name="password2">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="remember"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
                </div>

  
        </div>
        </div>
    </body>
</html>
