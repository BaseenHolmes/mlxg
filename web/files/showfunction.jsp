<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 8:57
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="files/jquery.js"></script>
<SCRIPT language=JavaScript>

    $(document).ready(function () {

        //全选
        $("#allselect").click(function () {
            //alert($("#allselect"));
            $(":checkbox").attr("checked", "checked");
        });

        //反选
        $("#fanselect").click(function () {
            var size = $(":checkbox").length;
            for (var i = 0; i < size; i++) {
                if ($(":checkbox:eq(" + i + ")").attr("checked") == "checked") {
                    //alert($(":checkbox").attr("checked"));
                    $(":checkbox:eq(" + i + ")").removeAttr("checked");
                } else {
                    $(":checkbox:eq(" + i + ")").attr("checked", "checked");
                }
            }
        });

        //高级搜索
        var dx, dy;
        var dx = (screen.height / 2 - 105) + "";
        var dy = (screen.width / 2 - 200) + "";
        $(document).ready(function () {
            $("#find").click(function () {
                var returnv = window.showModalDialog("http://localhost:8081/mlxg/files/gongnenggaoji.jsp", "高级查询", "dialogTop=" + dx + ";dialogLeft=" + dy + ";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");

                if (returnv != undefined) {
                    $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=gaojiquery&curPage=1" + returnv);
                } else {
                    return false;
                }
            });
        });
    });


    //删除模块
    $(document).ready(function () {
        $("#del").click(function () {
            $("#fom").attr("action", "<%=path%>/function.do?method=deleteFunction");
            $("#fom").submit();
        });
    });


</SCRIPT>


<script type="text/javascript">

    $(document).ready(function () {

        //分页
        var t = '2';
        $("#gog").click(function () {
            var curPage = $("#ij").val();
            if (parseInt(curPage) > parseInt(t)) {
                curPage = '2';
            }
            if (parseInt(curPage) < parseInt(t)) {
                curPage = curPage;
            }
            if (parseInt(curPage) < 1) {
                curPage = '1';
            }
            if (!/^[0-9]*$/.test(curPage)) {
                alert("请输入数字！");
                return false;
            }
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=" + curPage);
        });

        //添加功能
        $("#add").click(function () {
            location.href = "<%=path%>/function.do?method=addFunction&flag=add";
        });

        //范围查询
        $("#fanwei").click(function () {

            var gname = $("#gname").val();
            if (gname == "") {
                alert("无查询条件");
                $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=1");
                $("#fom").submit();
            } else {
                $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=gaojiquery&curPage=1&gname=" + gname + "&createbegin=&createend=&proname=&ntitle=&modname=");
                $("#fom").submit();
            }
        });
    });
</script>

<body>
<form name="fom" id="fom" method="post"
      action="http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=gaojiquery1&curPage=1">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="../images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="../images/ico07.gif" width="20" height="18"/></td>

                                    <td width="538">查看内容：
                                        按功能名称：
                                        <input type="text" id="gname" name="gname"/>
                                        <input name="Submit4" type="submit" class="right-button02" value="查 询" ;"/>
                                    </td>

                                    <td width="144" align="left"><a href="#" onclick="sousuo()">
                                        <input name="Submit3" type="submit" class="right-button07" id='find'
                                               value="高级搜索"/>
                                    </a></td>
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
                                    <td height="20"><span class="newfont07">选择：<input type="button"
                                                                                      class="right-button02" value="全选"
                                                                                      id='allselect'>-<input
                                            type="button" class="right-button02" value="反选" id='fanselect'></span>
                                        <input name="Submit" id="del" type="button" class="right-button08"
                                               value="删除所选功能"
                                        />
                                        <input name="Submit2" id="add" type="button" class="right-button08"
                                               value="添加功能"/></td>

                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr class="CTitle">
                                                <td height="22" colspan="8" align="center" style="font-size:16px">
                                                    功能详细列表
                                                </td>
                                            </tr>
                                            <tr bgcolor="#EEEEEE">
                                                <td width="4%" align="center" height="30">选择</td>
                                                <td width="10%">功能名称</td>
                                                <td width="10%">创建时间</td>
                                                <td width="10%">所属项目</td>
                                                <td width="10%">所属需求</td>
                                                <td width="10%">所属模块</td>
                                                <td width="5%">优先级</td>
                                                <td width="12%">操作</td>
                                            </tr>

                                            <c:forEach items="${requestScope.functionList}" var="funList">
                                                <tr bgcolor="#FFFFFF">
                                                    <td height="20"><input type="checkbox" name="delid"
                                                                           value="${funList.functionid}"/></td>
                                                    <td>${funList.fname}</td>
                                                    <td bgcolor="#FFFFFF">${funList.fstart}</td>
                                                    <td bgcolor="#FFFFFF">${funList.projectname}</td>
                                                    <td bgcolor="#FFFFFF">${funList.needname}</td>
                                                    <td bgcolor="#FFFFFF">${funList.modulename}</td>
                                                    <c:if test="${funList.fyouxianji==0}">
                                                        <td bgcolor="#FFFFFF">暂不</td>
                                                    </c:if>
                                                    <c:if test="${funList.fyouxianji==1}">
                                                        <td bgcolor="#FFFFFF">一般</td>
                                                    </c:if>
                                                    <c:if test="${funList.fyouxianji==2}">
                                                        <td bgcolor="#FFFFFF">需要</td>
                                                    </c:if>
                                                    <c:if test="${funList.fyouxianji==3}">
                                                        <td bgcolor="#FFFFFF">急</td>
                                                    </c:if>
                                                    <c:if test="${funList.fyouxianji==4}">
                                                        <td bgcolor="#FFFFFF">很急</td>
                                                    </c:if>
                                                    <td bgcolor="#FFFFFF"><a
                                                            href="<%=path%>/function.do?method=editFunction&id=${funList.functionid}&flag=edit">编辑|</a><a
                                                            href="<%=path%>/function.do?method=showOneFunction&id=${funList.functionid}&flag=show">查看|</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="6"><img src="../images/spacer.gif" width="1" height="1"/></td>
                                </tr>
                                <tr>
                                    <td height="33">
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                               class="right-font08">
                                            <tr>
                                                <td width="50%">第 <span class="right-text09">1</span> 页 | 共 <span
                                                        class="right-text09">2</span> 页 | <span
                                                        class="right-text09">13</span>条记录
                                                </td>

                                                <td width="49%" align="right">
                                                    [<a href="http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=1"
                                                        class="right-font08">首页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=1"
                                                        class="right-font08">上一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=2"
                                                        class="right-font08">下一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/GongnengServlet?methodName=queryall&page=2"
                                                        class="right-font08">末页</a>] 转至：
                                                </td>
                                                <td width="1%">
                                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="1%"><input id="ij" type="text"
                                                                                  class="right-textfield03" size="1"/>
                                                            </td>
                                                            <td width="87%"><input name="gog" id='gog' type="submit"
                                                                                   class="right-button06" value=" "/>

                                                            </td>
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
            </td>
        </tr>
    </table>

</form>
</body>
</html>

