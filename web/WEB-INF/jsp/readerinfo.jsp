<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/12/10
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body background="png/我的信息ym.png">


<form action="/updatereader">
    <div style="position: absolute ; left: 320px;top: 220px;" >
        <table style="height: 20px">
            <tr style="display: none">
                <td> <input type="text" value="${requestScope.readerinfo.rId}" name="rId"></td>
            </tr>
            <tr>
                <td><img src="png/姓名.png" height="60" width="100"></img></td>
                <td><input type="text" name="rName" value="${requestScope.readerinfo.rName}" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
            </tr>
            <tr>
                <td><img src="png/密码.png" height="60" width="100" ></img></td>
                <td><input type="password" name="rPassword" value="${requestScope.readerinfo.rPassword}" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
            </tr>
            <tr>
                <td><div style="background: url('png/确定修改.png') ;width: 100px ; height: 70px  ;background-size:100% 100%; "><input type="submit" style="opacity: 0.0;width: 100%;height: 100%" value=""></div></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
