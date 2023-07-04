<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">

    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin != null}">
                <c:set var="noti" value="That's not a page for admin" scope="request"/>
                <jsp:forward page="adminPage.jsp"/>
            </c:when>
            <c:when test="${sessionScope.user == null}">
                <c:set var="warning" value="Need to login to continue" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_user.jsp"/>
                </header>
                <h1>Welcome back ${sessionScope.user.fullname}</h1>
                <div>
			
			<p>Thank you for choosing our shop for your terrarium needs. We specialize in creating unique and beautiful terrariums that will brighten up any space.</p>
			<a href="mainController?txtsearch=&amp;searchby=byname&amp;action=search">Shop Now</a>
		</div>
		<div>
			<h2>Our Latest Products</h2>
			<p>Check out our newest creations and find inspiration for your own terrarium designs. We offer a wide range of plants, containers, and accessories to help you create the perfect terrarium.</p>
			<a href="mainController?txtsearch=&amp;searchby=byname&amp;action=search">Shop Now</a>
		</div>
                <c:choose>
                    <c:when test="${requestScope.orderlist == null}">
                        <h3>${requestScope.noti}</h3>
                    </c:when>
                    <c:otherwise>
                        <table border="1" style="text-align: center; width: 100%">
                            <thead style="background: #76b044; color: white">
                                <tr>
                                    <td>Order ID</td>
                                    <td>Order Date</td>
                                    <td>Ship Date</td>
                                    <td>Order's status</td>
                                    <td colspan="2">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ord" items="${requestScope.orderlist}">
                                    <tr>
                                        <td>${ord.orderID}</td>
                                        <td>${ord.orderDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.shipDate == null}">N/A</c:when>
                                                <c:otherwise>${ord.shipDate}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.status eq 1}">Processing</c:when>
                                                <c:when test="${ord.status eq 2}">Completed</c:when>
                                                <c:otherwise>Canceled</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.status eq 1}">
                                                    <a href="mainController?action=cancel&orderid=${ord.orderID}">Cancel Order</a>
                                                </c:when>
                                                <c:when test="${ord.status eq 2}">
                                                    <a href="mainController?action=reorder&orderid=${ord.orderID}">ReOrder</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="mainController?action=reorder&orderid=${ord.orderID}">ReOrder</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="mainController?action=orderDetail&orderid=${ord.orderID}">Check Orders' Detail</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
                <footer>
                    <c:import url="footer.jsp"/>
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>
