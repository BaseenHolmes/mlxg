<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 9:01
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>项目管理系统 by www.eyingda.com</title>
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

    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
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
                        <td height="62" background="../images/nav04.gif">

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
                <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

                                <tr>
                                    <TD height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr>
                                                <td height="20" colspan="2" bgcolor="#EEEEEE" class="tablestyle_title">
                                                    <div align="center" style="font-size:16px">功能明细列表</div>
                                                </td>
                                            </tr>

                                            <tr bgcolor="#FFFFFF" height="20">
                                                <td width="16%" align="right">功能名称:</td>
                                                <td width="84%">中故宫和</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                                <td align="right">所属项目:</td>

                                                <td>种子软件</td>

                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                                <td align="right">所属模块:</td>
                                                <td>测试2</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                                <td align="right">需求版本号:</td>
                                                <td>2</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                                <td align="right">创建时间:</td>
                                                <td>2011-12-01</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                                <td align="right" height="80">功能描述:</td>
                                                <td>12</td>
                                            </tr>
                                            <tr height="80" bgcolor="#FFFFFF">
                                                <td align="right">需求描述:</td>
                                                <td>暂无</td>
                                            </tr>
                                        </table>
                                    </TD>
                                </tr>
                                <tr>
                                    <TD>
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                               class="right-font08">

                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="6"><img src="../images/spacer.gif" width="1" height="1"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
