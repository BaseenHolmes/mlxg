<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 22:23
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8081/mlxg/">

    <title>My JSP 'jihuamingxi.jsp' starting page</title>

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
        document.getElementById("fom").action = "xiangmu.htm";
        document.getElementById("fom").submit();
    }

</SCRIPT>

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
                <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

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
                                                    计划明细列表 &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%" height="20" align="right" bgcolor="#FFFFFF">计划标题:</td>
                                                <td width="85%" align="left" bgcolor="#FFFFFF">望着</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">项目名称:</td>
                                                <td bgcolor="#FFFFFF">种子软件</td>
                                            </tr>
                                            <tr>
                                                <td height="20" align="right" bgcolor="#FFFFFF">项目模块:</td>
                                                <td bgcolor="#FFFFFF">称为老总</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">项目功能:</td>
                                                <td bgcolor="#FFFFFF">么有问题</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划开始时间:</td>
                                                <td bgcolor="#FFFFFF">2011-12-12</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划结束时间:</td>
                                                <td bgcolor="#FFFFFF">2011-12-31</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">实际开始时间:</td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">实际结束时间:</td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划创建时间:</td>
                                                <td bgcolor="#FFFFFF">2011-12-01</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">任务执行人:</td>
                                                <td bgcolor="#FFFFFF">逃兵</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">工期:</td>
                                                <td bgcolor="#FFFFFF">19 天</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">优先级:</td>


                                                <td bgcolor="#FFFFFF">很急</td>

                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">任务类型:</td>
                                                <td bgcolor="#FFFFFF">1</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">任务下发时间:</td>
                                                <td bgcolor="#FFFFFF">2019-10-25</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">前置任务计划:</td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">状态:</td>

                                                <td bgcolor="#FFFFFF">未开始</td>


                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">是否超期:</td>
                                                <td bgcolor="#FFFFFF">否</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">超期天数:</td>
                                                <td bgcolor="#FFFFFF">没有超期 天</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#FFFFFF">计划备注:</td>
                                                <td bgcolor="#FFFFFF">大打</td>
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
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</body>
</html>
