<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/12/12
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>book</title>
</head>
<body background="png/增加图书ym.png">
<c:if test="${sessionScope.isAdmin == true}">
    <form action="/addbook">
        <div style="position: absolute ; left: 320px;top: 220px;" >
            <table style="height: 20px">

                <tr style="display: none">
                    <td><input type="text" name="bId" value="${param.bId}" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                    <td><input type="text" name="bStatus" value="1" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                </tr>
                <tr>
                    <td><img src="png/书名.png" height="60" width="100"></img></td>
                    <td><input type="text" name="bName" value="" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                </tr>
                <tr>
                    <td><img src="png/作者.png" height="60" width="100" ></img></td>
                    <td><input type="text" name="bAuthor" value="" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                </tr>
                <tr>
                    <td><img src="png/位置.png" height="60" width="100" ></img></td>
                    <td><input type="text" name="bLocation" value="" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                </tr>
                <tr>
                    <td><div style="background: url('png/增加图书.png') ;width: 100px ; height: 70px  ;background-size:100% 100%; "><input type="submit" style="opacity: 0.0;width: 100%;height: 100%" value=""></div></td>
                </tr>
            </table>
        </div>
    </form>
</c:if>

</body>
</html>
