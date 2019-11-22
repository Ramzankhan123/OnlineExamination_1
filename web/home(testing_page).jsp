<%-- 
    Document   : home
    Created on : 2 May, 2018, 12:06:13 PM
    Author     : ramzan khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>online examination system</title>
        <script type="text/javascript" src="engine/js/visualslideshow.js"></script>
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>

        <style type="text/css" media="screen">
            #horizontalmenu ul 
            {
                padding:1; margin:3; list-style:none;
            }
            #horizontalmenu li
            {
                float:left;
                position:relative;
                padding-right:50;
                display:block;
                border:0px solid #CC55FF; 
                border-style:inset;
            }
            #horizontalmenu li ul
            {
                display:none;
                position:absolute;
            }
            #horizontalmenu li:hover ul{
                display:block;
                background:#C4C4C4;
                height:auto; width:8em; 
            }
            #horizontalmenu li ul li
            {
                clear:both;
                border-style:none;}
            </style>	
        </head>
        <table width="100%" align="center">
            <tbody>
                <tr>
                    <th height="80" colspan="3" style="background-color: #000080"><div style="text-align:left;color:#FFFFFF"><b><font size="+4"><a href="default.php" style="text-decoration:none; color:#FFFFFF"><marquee>Online Examination System</marquee></a></font></b><marquee direction="left" height="100%"></marquee></div></th>
            </tr>
            <tr>
                <td height="60" colspan="3" style="background-color:#999999">
                    <div id="horizontalmenu">
                        
                        <ul>
                            <li><a href="home.jsp"this.style.color='#FFFFFF'" onMouseOut="this.style.color = '#353535'" style="color:#FFFFFF ; text-decoration:none;" ><b>HOME</b></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                            <li><a href="StudentRegistration.jsp" onMouseOver="this.style.color = '#FFFFFF'" onMouseOut="this.style.color = '#353535'" style="color:#FFFFFF ; text-decoration:none;"><b>REGISTRATION</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                            <li><a href="Contect.jsp" onMouseOver="this.style.color = '#FFFFFF'" onMouseOut="this.style.color = '#353535'" style="color:#FFFFFF ; text-decoration:none;"><b>CONTACT</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>	
                            <li><a href="r.php" onMouseOver="this.style.color = '#FFFFFF'" onMouseOut="this.style.color = '#353535'" style="color:#FFFFFF ; text-decoration:none;"><b>ABOUT</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                
                        </ul>
                    </div>


                </td>
            </tr>

             <tr>
      <td width="150" height="300" style="background-color: grey"   style="vertical-align:text-top">

            <img src="images/login.png" width="300" height="200">
         
      </td>
      <td width="450" style="background-color:#00CC99">
     
      
            </td>
                 
    </tr>
      <tr>
    <td height="40" colspan="3" style="background-color:#000080"><center><b>&copy; Copyright @under SRS<br> </center>
        </td>
        </tr>

        </tbody>
        </table>
        </html>
