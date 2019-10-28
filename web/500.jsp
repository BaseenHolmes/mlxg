<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/24 15:38
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <script type="text/javascript">

    </script>
</head>

<body>
<div align="center" onclick="AA()">恭喜你发现了系统的彩蛋，点击访问本项目源码！！！</div>
</body>
</html>
