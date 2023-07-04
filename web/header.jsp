

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">

    </head>
     <script>
        document.addEventListener("DOMContentLoaded", function(event) { 
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos) window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function(e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
    </script>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.jsp"><img src="images/logo.jpg" id="logo"></a></li> 
                    <li><a href="mainController?txtsearch=&amp;searchby=byname&amp;action=search">Products</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                            <li><a href="registration.jsp">Sign up</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            </c:when>
                            <c:when test="${sessionScope.user != null}">
                            <li><a href="accountDetail.jsp">Account</a></li>
                            <li><a href="mainController?action=logout">Log Out</a></li>

                        </c:when>
                    </c:choose>
                    <li><a href="mainController?action=viewCart">Cart</a></li>
                    <li><form action="mainController" method="get">
                            <input type="text" name="txtsearch" value="${param.txtsearch}" placeholder="search plant">
                            <select name="searchby">
                                <!--                                <option disabled selected value>select option</option>-->
                                <option value="byname" ${param.searchby == 'byname'? 'selected':''}>By Name</option>
                                <option value="bycate" ${param.searchby == 'bycate'? 'selected':''}>By Category</option>
                            </select>
                            <input type="submit" name="action" value="search">
                        </form> 
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
