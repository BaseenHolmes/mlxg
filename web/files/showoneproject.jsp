<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 16:00
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">
    <title>My JSP 'listxiangmumingxi.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <style type="text/css">
        body {
            margin: 0px;
        }

        html {
            overflow-x: auto;
            overflow-y: auto;
            border: 0;
        }
    </style>

    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<form name="fom" id="fom" method="post" action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="679" align="left"><a href="#" onclick="sousuo()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
                                    </td>
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
                                                <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    项目细列表 &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%" height="20" align="right" bgcolor="#FFFFFF">项目名称:</td>
                                                <td width="85%" align="left"
                                                    bgcolor="#FFFFFF">${requestScope.project.pname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">客户名称:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.cname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">项目经理:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.uname}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">项目金额:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pchengben}</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">开发人数:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pnumber}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划启动日期:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pstart}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划完成日期:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pend}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">实际启动日期:</td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">实际完成日期:</td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">立项日期:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pcreate}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">更新日期:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pupdate}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">任务优先级:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.project.pyouxianji}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">是否超期:</td>
                                                <td bgcolor="#FFFFFF">${requestScope.chaoqila}</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">超期天数:</td>
                                                <td bgcolor="#FFFFFF"> 0 天</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">完成状态:</td>

                                                <td bgcolor="#FFFFFF">${requestScope.project.pzhuangtai}</td>
                                            </tr>
                                            <tr height='80'>
                                                <td align="right" bgcolor="#FFFFFF">项目备注:</td>
                                                <td bgcolor="#FFFFFF" rowspan="3">${requestScope.project.pbeizhu}</td>
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
                        <td height="33">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                   class="right-font08">
                                <tr>
                                    <td width="50%" align="right">共 <span class="right-text09">1</span> 页 | 第 <span
                                            class="right-text09">1</span> 页
                                    </td>
                                <tr>

                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</body>
</html>

