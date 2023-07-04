
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Shop</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                max-width: 1200px;
                margin: auto;
                
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }



            tbody tr:hover {
                background-color: #d9ead3;
            }
        </style>
    </head>
    <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos)
                window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function (e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
    </script>
    <body>
        <header>
            <c:import url="header.jsp"/>
        </header>
        <c:choose>
            <c:when test="${requestScope.searchlist != null || requestScope.seachlist.size() > 0}">
                <table border="1">
                    <thead style="color: white; background: #76b044;">
                        <tr>                            
                            <td></td>
                            <td>Price</td>
                            <td>Name</td>
                            <td>Status</td>
                            <td>Category</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${requestScope.searchlist}">
                            <tr>
                                <td style="width: 70%">
                                    <a href="mainController?action=getPlant&pid=${list.id}">
                                        <img  style="display:block"src='${list.imgpath}' class="product"/>
                                    </a>
                                </td>
                                <td>${list.price}</td>
                                <td>${list.name}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${list.status eq 1}">Available</c:when>
                                        <c:otherwise>Unavailable</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${list.catename}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${list.status eq 1}">
                                            <a href="mainController?action=addtocart&pid=${list.id}">Add to Cart</a>
                                        </c:when>
                                        <c:otherwise><p style="color: red; font-size: 1.5em">Out of stock</p></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <img src="images/background.jpg" style="width: 100%; margin: 1% 0;">
            </c:otherwise>
        </c:choose>
        <footer class="site-footer">
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
