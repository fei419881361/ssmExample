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
    <title>查看书籍</title>
</head>
<body background="png/所有图书ym.png">

<div style="position: absolute;left: 230px;top: 100px">
    <table class="table" >
        <thead>
        <tr style="border: none ;">
            <th><img src="png/编号.png" height="60" width="100"></img></th>
            <th><img src="png/书名.png" height="60" width="100"></img></th>
            <th><img src="png/作者.png" height="60" width="100"></img></th>
            <th><img src="png/位置.png" height="60" width="100"></img></th>
            <th><img src="png/状态.png" height="60" width="100"></img></th>
            <c:if test="${sessionScope.isAdmin == true}">
                <th> <a href="/addbook.jsp"><img src="png/增加图书.png" style="height: 50px;width: 70px"></a></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${requestScope.booklist}">
            <tr>
                <td>${book.bId}</td>
                <td>${book.bName}</td>
                <td>${book.bAuthor}</td>
                <td>${book.bLocation}</td>
                <c:if test="${book.bStatus == 1}">
                    <td><img src="png/可借阅.png" style="height: 50px;width: 70px"></td>
                    <c:if test="${sessionScope.isAdmin != true}">
                        <td><a href="javascript:void(0);" onclick="lenbook(${book.bId},'${book.bName}')"><img src="png/借阅.png" style="height: 50px;width: 70px"></a></td>
                    </c:if>
                </c:if>
                <c:if test="${book.bStatus == 2}">
                    <td><img src="png/不可借阅.png" style="height: 50px;width: 70px"></td>
                    <c:if test="${sessionScope.isAdmin == true}">
                        <td><a href="/rebook?book_id=${book.bId}">确认归还</a></td>
                    </c:if>
                </c:if>
                <c:if test="${sessionScope.isAdmin == true}">
                    <td><a href="/bookinfo.jsp?bId=${book.bId}&bName=${book.bName}&bAuthor=${book.bAuthor}&bLocation=${book.bLocation}"><img src="png/修改图书zt.png" style="height: 50px;width: 70px"></a></td>
                    <td><a href="/deletebook?b_id=${book.bId}"><img src="png/删除图书.png" style="height: 50px;width: 70px"></a></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="container-fluid">
        <ul class="pagination">
            <li><a href="#">&laquo;</a></li>
            <c:forEach var="i" begin="1" end="${requestScope.pages}">
                <c:choose>
                    <c:when test="${requestScope.pageon == i}">
                        <li class="active"> <a href="/nextpage?pageon=${i}">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li> <a href="/nextpage?pageon=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
</div>

</body>
<script type="text/javascript">
    function lenbook(id,name) {
        if(confirm('您确定借阅《'+name+'》吗？')==true){
            var xmlhttp;
            let sendInfo = 'book_id='+id;
            console.log(sendInfo);
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    if(xmlhttp.responseText == 'success'){
                        alert('借阅成功');
                        window.location.replace(location.href);
                    }else {
                        alert("借阅失败");
                        window.location.replace(location.href);
                    }
                }
            }
            xmlhttp.open("POST","/lenbook",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send(sendInfo);
        }

    }
</script>
</html>
