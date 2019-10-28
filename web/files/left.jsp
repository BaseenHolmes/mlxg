<%@ page language="java" import="java.util.*" pageEncoding="gb18030" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb18030"/>
    <title>项目管理系统 </title>
    <style type="text/css">
        /*body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-image: url(
        <%=path%>
        /images/left.gif);
                }*/
    </style>
    <link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css"/>

    <script src="<%=path%>/dtree.js" type="text/javascript"></script>

    <script type="text/javascript">
        var powerId = new dTree('powerId');
        var check = "false";
        powerId.add(0, -1, '选择操作', '');

        /*function checkNode(nodeId) {
            powerId.checkNode(nodeId);
        }*/
    </script>

</head>

<body>
<%
    session.setAttribute("token", System.currentTimeMillis() + "");
%>

<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
    <tr>
        <TD>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="207" height="55" background="<%=path%>/images/nav01.gif">
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="25%" rowspan="2"><img src="<%=path%>/images/ico02.gif" width="35"
                                                                 height="35"/></td>
                                <td width="75%" height="22" class="left-font01">您好，<span
                                        class="left-font02">${sessionScope.username }</span></td>
                            </tr>
                            <tr>
                                <td height="22" class="left-font01">
                                    [&nbsp;<a href="<%=basePath %>login.do?method=exit" target="_top"
                                              class="left-font01">退出</a>&nbsp;]
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="10" bgcolor="#FFFFFF" class="border03">
                <tr>
                    <td align="left">
                        <script type="text/javascript">
                            var flag = "haha";
                        </script>
                        <c:forEach items="${requestScope.poidList}" var="poidList">
                            <script type="text/javascript">
                                powerId.add(${poidList.poid}, ${poidList.fuid}, '${poidList.pname}', "", "", '', "", '${poidList.phref}', "", "mainFrame");
                            </script>
                        </c:forEach>
                        <script type="text/javascript">
                            document.write(powerId);
                            powerId.openAll();
                        </script>
                    </td>
                </tr>
            </table>

        </TD>
    </tr>
</table>

</body>
</html>
