<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
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

    <title>My JSP 'kehu.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <title>项目管理系统 </title>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all"/>

    <script type="text/javascript" src="<%=basePath %>jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

        function check() {
            if (document.getElementById('clientname').value == null || document.getElementById('clientname').value === '' || document.getElementById('clientname').value === undefined) {
                alert('公司名称不能为空');
                return false
            }
            return true;
        }

    </script>
    <style type="text/css">
        <!--
        .atten {
            font-size: 12px;
            font-weight: normal;
            color: #F00;
        }

        -->
    </style>
</head>

<body class="ContentBody">
<form method="post" name="form" target="mainFrame" id="fom" action="client.do?method=insertClient">

    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">客户基本信息录入</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left">
                            </td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>客户信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">


                                        <tr>
                                            <td nowrap align="right" width="15%">公司名称:</td>
                                            <td width="35%">
                                                <input name="clientname" class="text" style="width:154px" value=""
                                                       id="clientname"/>
                                                <span class="red">*</span>
                                                <div id="name"></div>
                                            </td>
                                            <td width="16%" align="right" nowrap="nowrap">联系人:</td>
                                            <td width="34%"><input class="text" name="cper" id="cper"
                                                                   style="width:154px" value="">
                                                <div id="per"></div>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td nowrap="nowrap" align="right">联系电话:</td>
                                            <td><input class="text" name="ctel" id="ctel" style="width:154px" value=""/>
                                                <div id="tel"></div>
                                            </td>
                                            <td align="right">联系地址:</td>
                                            <td><input class="text" name="caddr" id="caddr" style="width:154px"
                                                       value=""/>
                                                <div id="addr"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right">公司背景:</td>
                                            <td colspan="3"><textarea name="cbackground" id="cbackground" cols="100"
                                                                      rows="8"></textarea>
                                                <div id="background"></div>
                                            </td>
                                        </tr>

                                    </table>
                                    <br/>
                                </fieldset>
                            </TD>

                        </TR>
                    </TABLE>
                </td>
            </tr>
            <TR>
                <TD colspan="2" height="50px" align="right">


                    <input type="submit" name="Submit" value="保存" class="button" id="save" onclick="return check()"/>

                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>

    </div>
</form>
</body>
</html>
