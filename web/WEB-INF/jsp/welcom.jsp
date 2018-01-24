<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/11/22
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>小书屋</title>
</head>
<body background="png/用户主页面.png">
    <%--<h1>欢迎来到MM书屋</h1>--%>
    <%--<c:choose>--%>
        <%--<c:when test="${sessionScope.isAdmin == true}">--%>
            <%--欢迎管理员${sessionScope.username}--%>
        <%--</c:when>--%>
        <%--<c:otherwise>--%>
            <%--欢迎用户${sessionScope.username}--%>
        <%--</c:otherwise>--%>
    <%--</c:choose>--%>
    <c:choose>
        <c:when test="${sessionScope.isAdmin == true}">

                    <div style="position: absolute ; left: 380px;top: 290px;">
                        <ul class="nav navbar-nav">
                            <%--<li><a href="/nextpage?pageon=1">管理图书</a></li>--%>

                            <li> <div style="background: url('png/管理图书.png') ;width: 100px ; height: 70px ;background-size:100% 100%; " onclick="window.location='/nextpage?pageon=1'"></div></li>
                            <li> <div style="background: url('png/管理读者.png') ;width: 100px ; height: 70px ;background-size:100% 100%; " onclick="window.location='/readerpage?pageon=1'"></div></li>
                        </ul>
                    </div>


        </c:when>
        <c:otherwise>

                <div style="position: absolute ; left: 340px;top: 290px;">
                    <div class="collapse navbar-collapse" id="example-navbar-collapse">
                        <ul class="nav navbar-nav">
                            <%--<li><a href="/nextpage?pageon=1">查看图书</a></li>--%>
                            <%--<li><a href="/showlenbookandrebook?pageon=1">我借的书</a></li>--%>
                            <%--<li><a href="/showreaderinfo?readerID=${sessionScope.id}">我的信息</a></li>--%>
                                <%--<a href="/nextpage?pageon=1"  style="opacity: 0.0;width: 100%;height: 100%">查看图书</a>--%>
                                <li><div style="background: url('png/所有图书.png') ;width: 100px ; height: 70px ;background-size:100% 100%; " onclick="window.location='/nextpage?pageon=1'"></div></li>
                            <li><div style="background: url('png/我的借书.png') ;width: 100px ; height: 70px ;background-size:100% 100%; " onclick="window.location='/showlenbookandrebook?pageon=1'"></div></li>
                                <li> <div style="background: url('png/我的信息.png') ;width: 100px ; height: 70px ;background-size:100% 100%; " onclick="window.location='/showreaderinfo?readerID=${sessionScope.id}'"></div></li>

                        </ul>
                    </div>
                </div>
        </c:otherwise>
    </c:choose>


</body>
</html>
