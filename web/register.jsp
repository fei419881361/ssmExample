<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/12/5
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小书屋</title>
</head>
<body background="png/注册界面.png">
<form action="/register">
    <div style="position: absolute ; left: 270px;top: 110px;">
        <table>
            <tr>
                <td><img src="png/学号.png" height="60" width="100"/></td>
                <td><input type="text" name="rNum" id="rNum" onblur="loadXMLDoc()" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
                <td><span id="num"></span></td>
            </tr>
            <tr>
                <td><img src="png/姓名.png" height="60" width="100"/></td>
                <td><input type="text" name="rName" id="name" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
            </tr>
            <tr>
                <td><img src="png/密码.png" height="60" width="100"/></td>
                <td><input type="password" name="rPassword" id="password1" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
            </tr>
            <tr>
                <td><img src="png/确认密码.png" height="60" width="100"></img></td>>
                <td><input type="password"  id="password2" style="background: #FBE5B3 ; border: 1px solid darkolivegreen"></td>
            </tr>
            <tr>
                <%--<td><input type="button" value="submit" id="sub" onclick="toVaild()"></td>--%>
                    <td><div style="background: url('png/注册.png') ;width: 100px ; height: 70px ;background-size:100% 100%; "><input type="button" id="sub" onclick="toVaild()" style="opacity: 0.0;width: 100%;height: 100%" value=""></div></td>
            </tr>
        </table>
    </div>
</form>
</body>

<script type="text/javascript">
    function loadXMLDoc()
    {
        var xmlhttp;
        let num = document.getElementById('rNum').value;
        num = "num="+num;
        console.log(num);
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
                document.getElementById("num").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST","/register_validate",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send(num);
    }

    function submit(num,name,password) {
        var xmlhttp;
        let sendInfo = 'rNum='+num+'&rPassword='+password+'&rName='+name
        console.log(sendInfo);
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
            xmlhttp.withCredentials = true;
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            xmlhttp.withCredentials = true;
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                alert('success register')
                window.location.href = 'index.jsp'
            }
        }
        xmlhttp.open("POST","/register",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send(sendInfo);
    }
    function toVaild() {
        let pw1 = document.getElementById('password1').value;
        let pw2 = document.getElementById('password2').value;
        let num = document.getElementById("num").innerHTML;
        let rnum = document.getElementById('rNum').value;
        let rname = document.getElementById('name').value;

        console.log(pw1);
        console.log(pw2);
        console.log(num);

        if(pw1 == pw2 && pw1.trim() != '' && document.getElementById("num").innerHTML == "ok"&& document.getElementById("num").innerHTML != ''){
            if(rnum != '' && rname != ''){
                submit(rnum,rname,pw1);

            }
        }else{
            if(pw1 != pw2){
                alert('两次密码不同,提交失败。');
            }else {
                alert('学号存在了。');
            }
            return false;
        }
    }
</script>
</html>
