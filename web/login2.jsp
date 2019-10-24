<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="gb18030" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb18030"/>
    <title>项目管理系统 by www.eyingda.com</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        -->
    </style>
    <link href="<%=basePath %>css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath %>jquery.js"></script>

    <script>
        /**
         * 获取ajax对象
         */
        function getXmlHttp() {
            var xmlHttp;
            try {
                xmlHttp = new XMLHttpRequest();
            } catch (e) {
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("您的浏览器不支持AJAX！");
                        return false;
                    }
                }
            }
            return xmlHttp;
        }

        /**
         * 验证用户名
         * @param username
         * @param password
         * @param checkCode
         */
        function checkUsername(username,password,checkCode) {
            console.log("11");
            console.log(username.value);
            var url = "login.do?method=login&a=" + Math.random() + "&username=" + username.value + "&password=" + password.value + "&checkCode=" + checkCode.value;
            var xmlHttp = getXmlHttp();
            xmlHttp.open("get", url, true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4) {
                    document.getElementById("errorMessage").innerHTML = xmlHttp.responseText;
                    if(xmlHttp.responseText === "登录成功，正在为您跳转页面..."){
                        windows.location.href="/index.jsp";
                    }
                }
            };
            xmlHttp.send();
        }

    </script>

</head>

<body>
<form method='post' name='form1' id='fom' action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="147" background="<%=basePath %>images/top02.gif"><img src="<%=basePath %>images/top03.gif"
                                                                              width="776" height="147"/></td>
        </tr>
    </table>
    <table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
        <tr>
            <td width="221">
                <table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">

                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
                                <tr>
                                    <td align="center"><img src="<%=basePath %>images/ico13.gif" width="107"
                                                            height="97"/></td>
                                </tr>
                                <tr>
                                    <td height="40" align="center">&nbsp;</td>
                                </tr>

                            </table>
                        </td>
                        <td><img src="<%=basePath %>images/line01.gif" width="5" height="292"/></td>
                    </tr>
                </table>
            </td>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="31%" height="35" class="login-text02">用户名称：<br/></td>
                        <td width="69%"><input name="username" id='username' type="text" size="30"/></td>
                        <td id="errorMessage"></td>
                    </tr>
                    <tr>
                        <td height="35" class="login-text02">密　码：<br/></td>
                        <td><input name="password" type="password" id='password' size="33"/></td>
                    </tr>
                    <tr>
                        <td height="35" class="login-text02">验证图片：<br/></td>
                        <td><img id='imag' src="code.do?method=code" width="109" height="40"/> <a href="code.do?method=code" id='lin'
                                                                                                  class="login-text03">看不清楚，换张图片</a>
                        </td>
                    </tr>
                    <tr>
                        <td height="35" class="login-text02">请输入验证码：</td>
                        <td><input id='checkCode' name="checkCode" type="text" size="30"/></td>
                    </tr>
                    <tr>
                        <td height="35">&nbsp;</td>
                        <td><input id="dengru" type="submit" class="right-button01" value="确认登陆" onclick="checkUsername(document.getElementById(username),document.getElementById(password),document.getElementById(checkCode))"/>
                            <input name="Submit232" type="button" class="right-button02" value="重 置"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>