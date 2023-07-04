
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">
    </head>
    <body>
        <header>
            <ul>
                <li><a href="adminPage.jsp">Welcome back ${sessionScope.admin.fullname}</a></li>
                <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>
                <li><a href="mainController?action=manageOrders">Manage Orders</a></li>
                <li><a href="mainController?action=managePlants">Manage Plants</a></li>
                <li><a href="mainController?action=manageCategories">Manage Categories</a></li>
                <a href="mainController?action=logout">Log Out</a></li>
            </ul>
        </header>
    </body>
</html>
