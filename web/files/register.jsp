<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/23 18:35
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/500.jsp" %>

<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <script>
        /**
         * 获取ajax对象
         * @returns {XMLHttpRequest|boolean}
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
         * 检查用户名是否可用
         * @param obj
         * @returns {boolean}
         */
        function checkUserid() {
            var obj = document.getElementById("username");
            if (obj.value === "") {
                document.getElementById("userText").innerHTML = "用户名不能为空";
                return false;
            }
            var xmlHttp = getXmlHttp();
            var url = "user.do?checkUsername?v=" + Math.random() + "&username=" + obj.value;
            xmlHttp.open("get", url, true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4) {
                    document.getElementById("userText").innerHTML = xmlHttp.responseText;
                    return xmlHttp.responseText !== "用户名已存在";
                }
            };
            xmlHttp.send();
        }

        /**
         * 检查密码是否为空
         * @param obj
         * @returns {boolean}
         */
        function checkPassword() {
            var obj = document.getElementById("password");
            if (obj.value === "") {
                document.getElementById("userText").innerHTML = "密码不能为空";
                return false;
            }
            return true;
        }

        /**
         * 再次确认密码
         * @param obj
         * @returns {boolean}
         */
        function checkAgain() {
            var obj = document.getElementById("again");
            var password = document.getElementById("password");
            return obj.value === password.value;
        }

        /**
         * 验证并提交
         * @returns {boolean}
         */
        function checkAll() {
            return checkUserid() && checkPassword() && checkAgain();
        }

        function AA() {
            window.open('https://github.com/BaseenHolmes/mlxg/commits/master', "");
        }

    </script>
</head>
<body>
<form align="center" action="user.do?method=register">
    <div id="userText"></div>
    用户名：<input type="text" onblur="checkUserid(this)" id="username">
    密码：<input type="password" onblur="checkPassword(this)" id="password">
    确认密码：<input type="password" onblur="checkAgain(this)" id="again">
    <input type="submit" value="提交" onclick="return checkAll()">
    <input type="reset" value="重置">
</form>
</body>
</html>
