<%@ page language="java" import="java.util.*,po.*" pageEncoding="GB18030" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>files/">

    <title>My JSP 'kehuminxi.jsp' starting page</title>

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
            font-family: "����";
            font-size: 9px;
            color: #555555;
            text-decoration: none;
            text-align: center;
        }

        .font051 {
            font-family: "����";
            font-size: 12px;
            color: #333333;
            text-decoration: none;
            line-height: 20px;
        }

        .font201 {
            font-family: "����";
            font-size: 12px;
            color: #FF0000;
            text-decoration: none;
        }

        .button {
            font-family: "����";
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
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
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
                        <td height="62" background="<%=path%>/images/nav04.gif">

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
                                    <td height="40" class="font42">
                                        <table width="885" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03" height="247">

                                            <tr>
                                                <td height="20" colspan="2" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    �ͻ���ϸ����
                                                </td>
                                            </tr>

                                            <tr>
                                                <td width="16%" height="20" align="right" bgcolor="#FFFFFF">��˾����:</td>
                                                <td width="84%" colspan="2" bgcolor="#FFFFFF">${client.cname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">��ϵ��:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${client.cper}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">��ϵ�绰:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${client.cphone}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">��ϵ��ַ:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${client.caddress}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">�������:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${client.cdate}</td>
                                            </tr>

                                            <tr>
                                                <td height="85" align="right" bgcolor="#FFFFFF">��˾����:</td>
                                                <td colspan="2" bgcolor="#FFFFFF">${client.cbeijing}</td>
                                            </tr>

                                        </table>
                                    </td>
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
