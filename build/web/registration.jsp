<%-- 
    Document   : registration
    Created on : Aug 1, 2022, 5:21:12 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">
        <style>
            .parent {
                margin: auto;
                width: 50%; /* This sets the width of the container to 50% of its parent element */
            }
            span {
                display: block;
                font-size: 12px;
                color: gray;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <div class="parent">
            <form action="mainController" method="post">
                <table>
                    <tr><td>Email</td>
                        <td><input type="text" name="txtemail" required=""  pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" value="${param.txtemail}"></td></tr>
                    <tr><td>Full Name</td>
                        <td><input type="text" name="txtfullname" required="" value="${param.txtfullname}"></td></tr>
                    <tr><td>Password</td>
                        <td><input type="password" name="txtpassword" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" value="${param.txtpassword}"></td>
                    <span>Note: Your password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.</span>
                    </tr>            
                    <tr><td>Phone</td>
                        <td><input type="text" name="txtphone" required="" value="${param.txtphone}"></td></tr>
                </table>
                <input type="submit" value="register" name="action">
            </form>
        </div>
        <h3 style="color: red">${requestScope.error}</h3>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
