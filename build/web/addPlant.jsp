
<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page import="dto.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Plant Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.jpg">

    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_admin.jsp"/>
                </header>
                <%
                    ArrayList<Category> catelist = CategoryDAO.getCategories();
                    ArrayList<String> imgList = PlantDAO.getImgPath();
                    request.setAttribute("imgList", imgList);
                    request.setAttribute("categoryList", catelist);
                %>
                <a href="mainController?action=managePlants">Back to Manage Plant Page</a>
                <form method="post" action="uploadImageServlet" enctype="multipart/form-data">
                    <input type="file" name="file" />
                    <input type="submit" value="Upload" />
                </form>
                <form action="mainController" method="post">
                    <table>
                        <tr><th>Plant Name</th><td><input type="text" name="txtname" required="" placeholder="Input the name"/></td></tr>
                        <tr><th>Price</th><td><input type="number" name="txtprice" required="" placeholder="Input price"/></td></tr>
                        <tr>
                            <th>Image</th>
                            <<td>
                                <select name="imgpath">
                                    <option>-select image-</option>
                                    <c:forEach var="image" items="${requestScope.imgList}">
                                        <option value="${image}">${image}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr><th>Description</th><td><input type="text" name="txtdes" required="" placeholder="Input description"/></td></tr>
                        <tr>
                            <th>Category</th>
                            <td>
                                <select name="cateid">
                                    <option>-select category-</option>
                                    <c:forEach var="cate" items="${requestScope.categoryList}">
                                        <option value="${cate.cateID}">${cate.cateName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="addNewPlant"/>
                </form>
                <h3 style="color: red">${requestScope.error}</h3>
                <footer>
                    <c:import url="footer.jsp"/>
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>
