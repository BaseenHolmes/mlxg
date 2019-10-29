<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/28 13:53
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">

    <title>My JSP 'listmokuai.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="css/css.css" rel="stylesheet" type="text/css"/>

    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript" src="http://localhost:8080/mlxg/jquery.js"></script>
<script type="text/JavaScript">

    var dx, dy;
    var dx = (screen.height / 2 - 105) + "";
    var dy = (screen.width / 2 - 200) + "";
    $(document).ready(function () {
        $("#find").click(function () {
            var returnv = window.showModalDialog("http://localhost:8081/mlxg/files/gaojisoumokuai.jsp", "高级查询", "dialogTop=" + dx + ";dialogLeft=" + dy + ";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
            if (returnv != undefined) {
                $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=gaoJiCha" + returnv);
                //alert("1111");
            }
        });
    });

</script>

<SCRIPT language=JavaScript>

    $(document).ready(function () {

        //全选
        $("#allselect").click(function () {
            $(":checkbox").attr("checked", "checked");
        });

        //反选
        $("#fanselect").click(function () {
            var size = $(":checkbox").length;
            for (var i = 0; i < size; i++) {
                if ($(":checkbox:eq(" + i + ")").attr("checked") == "checked") {
                    $(":checkbox:eq(" + i + ")").removeAttr("checked");
                } else {
                    $(":checkbox:eq(" + i + ")").attr("checked", "checked");
                }
            }
        });
    });

    //删除
    function linkdel() {
        //var obj = document.getElementsByName("delid");
        var r = confirm("确认删除？");
        if (r === true) {
            $("#fom").attr("action", "module.do?method=deleteModule");
            $("#fom").submit();
        }

    }

</SCRIPT>
<script type="text/javascript">

    $(document).ready(function () {

        //分页
        $("#gog").click(function () {
            var curPage = $("#ij").val();
            if (!/^[0-9]*$/.test(curPage)) {
                alert("请输入数字！");
                return false;
            }
            if (parseInt(curPage, 10) < 1) {
                aler(curPage);
                curPage = 1;
            }
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=showMoKuai&tag=showmokuai&curPage=" + curPage);
        });


        //添加模块
        $("#add").click(function () {
            /*$("#fom").attr("action", "servlet/MoKuaiServlet?methodName=showMoKuai&tag=addmokuai");
            $("#fom").submit();*/
            location.href = "<%=path%>/module.do?method=addModule&flag=add";
        });


        //时间查询
        $("#chaxun").click(function () {
            alert("111");
            var probuildDate = $("#probuildDate").val();
            //alert(probuildDate);
            if (probuildDate != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probuildDate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                return;
            }
            var enddate = $("#enddate").val();
            //alert(enddate);
            if (enddate != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(enddate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                return;
            }
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=gaoJiCha&curPage=1&moname=&mobiaozhi=&proname=&nname=&probuildDate=&enddate=");
        });

    });
</script>

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
                                    <td width="21"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="538">查看内容：按时间：
                                        <input name="probuildDate" id='probuildDate' type="text" size="12"/><span
                                                class="newfont06">至</span>
                                        <input name="enddate" id='enddate' type="text" size="12"/>
                                        <input name="Submit" type="submit" class="right-button02" id='chaxun'
                                               value="查 询"/>
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
                                        <input name="Submit" type="button" class="right-button08" value="删除所选模块"
                                               onclick="linkdel();"/>
                                        <input name="Submit2" id="add" type="button" class="right-button08"
                                               value="添加模块"/></td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr class="CTitle">
                                                <td height="22" colspan="8" align="center" style="font-size:16px">
                                                    模块详细列表
                                                </td>
                                            </tr>
                                            <tr bgcolor="#EEEEEE">
                                                <td width="4%" align="center" height="30">选择</td>
                                                <td width="10%">模块名称</td>
                                                <td width="6%">标识</td>
                                                <td width="10%">创建时间</td>
                                                <td width="10%">所属项目</td>
                                                <td width="10%">所属需求</td>
                                                <td width="5%">优先级</td>
                                                <td width="12%">操作</td>
                                            </tr>

                                            <c:forEach items="${requestScope.module}" var="modl">
                                                <tr>
                                                    <td bgcolor="#FFFFFF" height="20"><input type="checkbox"
                                                                                             name="delid" id="delid"
                                                                                             value="${modl.moduleid}"/>
                                                    </td>
                                                    <td bgcolor="#FFFFFF">${modl.mname}</td>
                                                    <td bgcolor="#FFFFFF">${modl.mbiaoshi}</td>
                                                    <td bgcolor="#FFFFFF">${modl.mstart}</td>
                                                    <td bgcolor="#FFFFFF">${modl.projectname}</td>
                                                    <td bgcolor="#FFFFFF">${modl.needname}</td>
                                                    <c:if test="${modl.myouxianji==0}">
                                                        <td bgcolor="#FFFFFF">暂不</td>
                                                    </c:if>
                                                    <c:if test="${modl.myouxianji==1}">
                                                        <td bgcolor="#FFFFFF">一般</td>
                                                    </c:if>
                                                    <c:if test="${modl.myouxianji==2}">
                                                        <td bgcolor="#FFFFFF">需要</td>
                                                    </c:if>
                                                    <c:if test="${modl.myouxianji==3}">
                                                        <td bgcolor="#FFFFFF">急</td>
                                                    </c:if>
                                                    <c:if test="${modl.myouxianji==4}">
                                                        <td bgcolor="#FFFFFF">很急</td>
                                                    </c:if>
                                                    <td bgcolor="#FFFFFF">
                                                        <a href="module.do?method=addModule&id=${modl.moduleid}&flag=editmokuai">编辑|</a><a
                                                            href="module.do?method=showOneModule&id=${modl.moduleid}&flag=chakan">查看</a>
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

                                                <td width="49%" align="right">[<a
                                                        href="http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=showMoKuai&curPage=1&tag=showmokuai"
                                                        class="right-font08">首页</a>
                                                    |
                                                    <a href="http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=showMoKuai&curPage=1&tag=showmokuai"
                                                       class="right-font08">上一页</a>
                                                    |
                                                    <a href="http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=showMoKuai&curPage=2&tag=showmokuai"
                                                       class="right-font08">下一页</a>
                                                    |
                                                    <a href="http://localhost:8081/mlxg/servlet/MoKuaiServlet?methodName=showMoKuai&curPage=2&tag=showmokuai"
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
