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

<title>欢迎来到小书屋</title>
</head>
<body background="png/我的借书ym.png">

    <%--<div class="container-fluid">--%>

        <%--<div class="collapse navbar-collapse" id="example-navbar-collapse">--%>
            <%--<ul class="nav navbar-nav">--%>

                <%--<c:if test="${sessionScope.isAdmin == true}">--%>
                    <%--<li>--%>
                        <%--<div class="dropdown">--%>
                            <%--<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">--%>
                                <%--管理员选项--%>
                                <%--<span class="caret"></span>--%>
                            <%--</button>--%>
                            <%--<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
                                <%--<li><a href="#">管理读者</a></li>--%>
                                <%--<li><a href="#">管理图书</a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                <%--</c:if>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>

<div style="position: absolute ; left: 230px;top: 120px;"  >
    <img src="png/未归还.png" style="height: 70px">
    <table class="table">
        <thead>
        <tr>
            <th><img src="png/编号.png" height="60" width="100"></img></th>
            <th><img src="png/书名.png" height="60" width="100"></img></th>
            <th><img src="png/作者.png" height="60" width="100"></img></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${requestScope.lenbooks}" varStatus="st">
            <tr>
                <td>${st.index}</td>
                <td>${book.bName}</td>
                <td>${book.bAuthor}</td>
                    <%--<td><<a href="javascript:void(0);" onclick="rebook(${book.bId},'${book.bName}')">归还</a></td>>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <img src="png/曾经.png" style="height: 70px">
    <table class="table">
        <thead>
        <tr>
            <th><img src="png/编号.png" height="60" width="100"></img></th>
            <th><img src="png/书名.png" height="60" width="100"></img></th>
            <th><img src="png/作者.png" height="60" width="100"></img></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${requestScope.rebooks}" varStatus="st">
            <tr>
                <td>${st.index}</td>
                <td>${book.bName}</td>
                <td>${book.bAuthor}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
        function rebook(id,name) {
            if(confirm('您确定归还《'+name+'》吗？')==true){
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
                            alert('归还成功');
                            window.location.replace(location.href);
                        }else {
                            alert("归还失败");
                            window.location.replace(location.href);
                        }
                    }
                }
                xmlhttp.open("POST","/rebook",true);
                xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlhttp.send(sendInfo);
            }
    }
</script>
</html>
