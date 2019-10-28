<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/28 13:36
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8081/mlxg/">

    <title>My JSP 'listxuqiumingxi.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        .tabfont01 {
            font-family: "宋体";
            font-size: 9px;
            color: #555555;
            text-decoration: none;
            text-align: center;
        }

        .font051 {
            font-family: "宋体";
            font-size: 12px;
            color: #333333;
            text-decoration: none;
            line-height: 20px;
        }

        .font201 {
            font-family: "宋体";
            font-size: 12px;
            color: #FF0000;
            text-decoration: none;
        }

        .button {
            font-family: "宋体";
            font-size: 14px;
            height: 37px;
        }

        html {
            overflow-x: auto;
            overflow-y: auto;
            border: 0;
        }

        -->
    </style>

    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<SCRIPT language=JavaScript>
    function sousuo() {
        window.open("gaojisousuo.htm", "", "depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
    }

    function selectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                obj[i].checked = true;
            }
        }
    }

    function unselectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                if (obj[i].checked == true) obj[i].checked = false;
                else obj[i].checked = true;
            }
        }
    }

    function link() {
        document.getElementById("fom").action = "xuqiumingxi.html";
        document.getElementById("fom").submit();
    }
</SCRIPT>

<body>
<form name="fom" id="fom" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="subtree1" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">

                                            <tr>
                                                <td height="20" colspan="2" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title">
                                                    <div align="center" style="font-size:16px">需求详细内容</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="16%" height="20" align="right" bgcolor="#FFFFFF">需求标题:</td>
                                                <td width="84%" colspan="2"
                                                    bgcolor="#FFFFFF">${requestScope.need.nname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">所属项目:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${requestScope.need.projectname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">创建时间:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${requestScope.need.nstart}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">更新时间:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${requestScope.need.nupdate}</td>
                                            </tr>
                                            <tr>
                                                <td height="80" align="right" bgcolor="#FFFFFF">备注:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${requestScope.need.ntext}</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="6"><img src="images/spacer.gif" width="1" height="1"/></td>
                    </tr>
                    <tr>
                        <TD height="33">

                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                   class="right-font08">
                                <tr>
                                    <td width="50%" align="right">共 <span class="right-text09">1</span> 页 | 第 <span
                                            class="right-text09">1</span> 页
                                    </td>
                                <tr>
                                </tr>
                            </table>
                        </TD>
                    </tr>
                </table>
            </td>
        </tr>

</body>
</html>

