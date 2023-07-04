<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">

    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <c:import url="header_admin.jsp"/>
                <h3 style="color: red">${requestScope.noti}</h3>
                <ul>
                    <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>
                    <li><a href="mainController?action=manageOrders">Manage Orders</a></li>
                    <li><a href="mainController?action=managePlants">Manage Plants</a></li>
                    <li><a href="mainController?action=manageCategories">Manage Categories</a></li>
                    <li><a href="mainController?action=logout">Log Out</a></li>
                </ul>
                <footer>
                    <c:import url="footer.jsp"/>
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>
