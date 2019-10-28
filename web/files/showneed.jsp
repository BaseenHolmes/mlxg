<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/28 9:01
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>项目管理系统 by www.eyingda.com</title>
    <style type="text/css">

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


    </style>

    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript" src="http://localhost:8080/mlxg/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<SCRIPT language=JavaScript>
    $(document).ready(function () {

        //全选
        $("#allselect").click(function () {
            $(":checkbox").attr("checked", "checked");
        });

        //反选
        $("#fanselect").click(function () {
            var che = $(":checkbox").length;
            for (var i = 0; i < che; i++) {
                if ($(":checkbox:eq(" + i + ")").attr("checked") == "checked") {
                    $(":checkbox:eq(" + i + ")").removeAttr("checked");
                } else {
                    $(":checkbox:eq(" + i + ")").attr("checked", "checked");
                }
            }
        });


    });


</SCRIPT>
<script type="text/javascript">

    $(document).ready(function () {
        //添加需求
        $("#add").click(function () {
            location.href = "<%=path%>/need.do?method=queryAllProject";
        });

        //删除需求
        $("#deleten").click(function () {
            $("#fom").attr('action', "<%=path%>/need.do?method=deleteNeed");
            $("#fom").submit();
        });


    });
</script>

<body>


<form name="fom" id="fom" method="post"
      action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="../images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21">&nbsp; <img src="../images/ico07.gif" width="20" height="18"/></td>
                                    <td width="523">查看内容：
                                        按时间：
                                        <input name="createbegin" id="date1" type="text" size="12"/>
                                        <span class="newfont06">至</span>
                                        <input name="createend" id="date2" type="text" size="12"/>
                                        <input name="Submit4" type="submit" class="right-button02" value="查 询"/></td>
                                    <td width="159" align="left"><a href="#" onclick="sousuo()">
                                        <input name="Submit" type="submit" class="right-button07" id='find'
                                               value="高级搜索"/></a></td>
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
                                    <td height="20"><span class="newfont07">选择：<input type="button"
                                                                                      class="right-button02" value="全选"
                                                                                      id='allselect'>-<input
                                            type="button" class="right-button02" value="反选" id='fanselect'></span>
                                        <input name="deleten" id="deleten" type="button" class="right-button08"
                                               value="删除所选需求信息"
                                        />
                                        <input name="add" id="add" type="button" class="right-button08"
                                               value="添加需求"/></td>

                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">

                                            <tr>
                                                <td colspan="9" bgcolor="#EEEEEE" class="tablestyle_title">
                                                    <div align="center" style="font-size:16px ">需求列表</div>
                                                </td>
                                            </tr>
                                            <tr bgcolor="#EEEEEE" height="30">
                                                <td width="9%">选择</td>
                                                <td width="18%">需求主题</td>
                                                <td width="18%">所属项目</td>
                                                <td width="18%">创建时间</td>
                                                <td width="18%">更新时间</td>
                                                <td width="21%">操作</td>
                                            </tr>


                                            <c:forEach items="${requestScope.needs}" var="need">
                                                <tr bgcolor="#FFFFFF" height="20">
                                                    <td><input type="checkbox" name="delid" id="delid"
                                                               value="${need.needid}"/></td>

                                                    <td>
                                                        <a href="/mlxg/servlet/NeedServlet?methodName=queryother&title=10"
                                                           onclick="">${need.nname}</a></td>
                                                    <td>${need.projectname}</td>
                                                    <td>${need.nstart}</td>
                                                    <td>${need.nupdate}</td>
                                                    <td>
                                                        <a href="<%=request.getContextPath()%>/need.do?method=editNeed&flag=1&nno=${need.needid}">编辑</a>|<a
                                                            href="<%=request.getContextPath()%>/need.do?method=editNeed&flag=2&nno=${need.needid}">查看</a>
                                                    </td>


                                                </tr>

                                            </c:forEach>

                                            <input type="hidden" name="hello" value="10">
                                            <input type="hidden" name="world">
                                        </table>
                                    </td>
                                </tr>
                            </table>


                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="33">
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                               class="right-font08">

                                            <tr>
                                                <td width="50%">第 <span class="right-text09">1</span> 页 | 共 <span
                                                        class="right-text09">2</span> 页 | <span
                                                        class="right-text09">17</span>条记录
                                                </td>
                                                <td width="49%" align="right">
                                                    <table width="95%" cellspacing="0" cellpadding="0" border="0"
                                                           align="center">
                                                        <tbody>
                                                        <tr>

                                                            <td height="6"><img height="1" width="1"
                                                                                src="../images/spacer.gif"></td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    [<a href="http://localhost:8081/mlxg/servlet/NeedServlet?methodName=queryall&page=1"
                                                        class="right-font08">首页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/NeedServlet?methodName=queryall&page=1"
                                                        class="right-font08">上一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/NeedServlet?methodName=queryall&page=2"
                                                        class="right-font08">下一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/NeedServlet?methodName=queryall&page=2"
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

