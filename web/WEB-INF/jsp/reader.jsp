<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/11/26
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>读者管理</title>
</head>
<body background="png/管理读者ym.png">
<div style="position: absolute;left: 320px;top: 210px">
    <table class="table">
        <thead>
        <tr>
            <th><img src="png/编号.png" height="60" width="100"></img></th>
            <th><img src="png/学号.png" height="60" width="100"></img></th>
            <th><img src="png/姓名.png" height="60" width="100"></img></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="reader" items="${requestScope.readerList}">
            <tr>
                <td>${reader.rId}</td>
                <td>${reader.rNum}</td>
                <td>${reader.rName}</td>
                <td><a href="/deletereader?r_id=${reader.rId}"><img src="png/删除读者zt.png" style="height: 50px;width: 70px"></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="container-fluid">
        <ul class="pagination">
            <li><a href="#">&laquo;</a></li>
            <c:forEach var="i" begin="1" end="${requestScope.rpages}">
                <c:choose>
                    <c:when test="${requestScope.rpageon == i}">
                        <li class="active"> <a href="/readerpage?pageon=${i}">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li> <a href="/readerpage?pageon=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
</div>

</body>

</html>
