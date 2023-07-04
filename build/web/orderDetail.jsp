<%-- 
    Document   : orderDetail
    Created on : Mar 7, 2023, 1:31:40 AM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">
    </head>
    <body>



        <c:choose>
            <c:when test="${sessionScope.admin != null }">
                <header>
                    <c:import url="header_admin.jsp"/>\
                </header>
                <a href="mainController?action=manageOrders">View Every Orders</a>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_user.jsp"/>
                </header>
                <a href="mainController?txtsearch=&searchby=byname&action=search">Back to shop</a>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${requestScope.detailList == null}">
                <h3>You don't have any order</h3>
            </c:when>
            <c:otherwise>
                <table border="1" style="text-align: center; width: 100%">
                    <thead style="background: #76b044; color: white">
                        <tr>
                            <td>Order ID</td>
                            <td>Plant ID</td>
                            <td>Plant Name</td>
                            <td>Image</td>
                            <td>Price</td>
                            <td>Quantity</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="detail" items="${requestScope.detailList}">
                            <tr>
                                <td>${detail.orderID}</td>
                                <td>${detail.plantID}</td>
                                <td>${detail.plantName}</td>
                                <td><img src="${detail.imgPath}" style="width: 20%"/></td>
                                <td>${detail.price}</td>
                                <td>${detail.quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <h3> Total money: ${requestScope.totalMoney}VND</h3>
                </table>
            </c:otherwise>
        </c:choose>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>


    </body>
</html>
