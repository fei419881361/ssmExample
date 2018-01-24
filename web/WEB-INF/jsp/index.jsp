<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/11/20
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <style type="text/css">

  </style>
  <script type="text/javascript">
      function Jump() {
          window.location.href= "register.jsp"
      }
  </script>
</head>
<body background="png/index.png" >
<form action="/login">
  <div style="position: absolute ; left: 320px;top: 220px;" >
    <table style="height: 20px">
      <tr>
        <td><img src="png/学号.png" height="60" width="100"></img></td>
        <td><input type="text" name="username" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
      </tr>
      <tr>
        <td><img src="png/密码.png" height="60" width="100" ></img></td>
        <td><input type="text" name="password" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
      </tr>
      <tr>
        <td><div style="background: url('png/登录.png') ;width: 100px ; height: 70px ;background-size:100% 100%; "><input type="submit" style="opacity: 0.0;width: 100%;height: 100%" value=""></div></td>
        <td><img src="png/注册.png"  height="70" width="100" onclick="Jump()"></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
