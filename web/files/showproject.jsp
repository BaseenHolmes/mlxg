<%@ page language="java" import="java.util.*,com.huaxing.mlxg.po.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'listxiangmuxinxi.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/xiangmu.js"></script>
</head>
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>

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

        //添加
        $("#add").click(function () {
            location.href = "<%=path%>/project.do?method=showAddProject";
        });

        //删除
        /*function deleteProject() {
            var deletes = document.getElementsByName('delid');
            for (var i = 0; i < deletes.length; i++) {
                deletes[i].checked = 'checked';
            }
        }*/


    });


</SCRIPT>

<body>

<form name="fom" id="fom" method="post" action="<%=path%>/project.do?method=doDeleteProject">
    <table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="550">查看内容：按时间：
                                        <input name="probuildDate" id='probuildDate' type="text" size="12"/><span
                                                class="newfont06">至</span>
                                        <input name="enddate" id='enddate' type="text" size="12"/>
                                        <input name="Submit" type="submit" class="right-button02" id='chaxun'
                                               value="查 询"/></td>
                                    <td width="132" align="left"><a href="#" onclick="sousuo()">
                                        <input name="Submit" type="submit" class="right-button07" id='find'
                                               value="高级搜索"/> </a></td>
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
                                        <input name="delpro" type="submit" class="right-button08" value="删除所选项目信息"/>
                                        <input name="Submit2" id="add" type="button" class="right-button08"
                                               value="添加项目"/></td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">

                                            <tr>
                                                <td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    项目信息列表 &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="5%" align="center" bgcolor="#EEEEEE">选择</td>
                                                <td width="10%" height="20" align="center" bgcolor="#EEEEEE">项目名称</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">客户名称</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">项目经理</td>
                                                <td width="5%" align="center" bgcolor="#EEEEEE">开发人数</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">立项时间</td>
                                                <%--<td width="10%" align="center" bgcolor="#EEEEEE">更新时间</td>--%>
                                                <td width="6%" align="center" bgcolor="#EEEEEE">任务优先级</td>
                                                <td width="5%" align="center" bgcolor="#EEEEEE">状态</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                                            </tr>
                                            <c:forEach items="${requestScope.projects}" var="pro" varStatus="p">
                                                <tr align="center">
                                                    <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"
                                                                                 value="${pro.projectid}"/></td>
                                                    <td height="20" bgcolor="#FFFFFF">${pro.pname}</td>
                                                    <td bgcolor="#FFFFFF">${pro.cname}</td>
                                                    <td bgcolor="#FFFFFF">${pro.uname}</td>
                                                    <td bgcolor="#FFFFFF">${pro.pnumber} 人</td>
                                                    <td bgcolor="#FFFFFF">${pro.pstart}</td>
                                                        <%--<td bgcolor="#FFFFFF"></td>--%>
                                                    <c:if test="${pro.pyouxianji==0}">
                                                        <td bgcolor="#FFFFFF">暂不</td>
                                                    </c:if>
                                                    <c:if test="${pro.pyouxianji==1}">
                                                        <td bgcolor="#FFFFFF">一般</td>
                                                    </c:if>
                                                    <c:if test="${pro.pyouxianji==2}">
                                                        <td bgcolor="#FFFFFF">需要</td>
                                                    </c:if>
                                                    <c:if test="${pro.pyouxianji==3}">
                                                        <td bgcolor="#FFFFFF">急</td>
                                                    </c:if>
                                                    <c:if test="${pro.pyouxianji==4}">
                                                        <td bgcolor="#FFFFFF">很急</td>
                                                    </c:if>


                                                    <c:if test="${pro.pzhuangtai==0}">
                                                        <td bgcolor="#FFFFFF">未开始</td>
                                                    </c:if>
                                                    <c:if test="${pro.pzhuangtai==1}">
                                                        <td bgcolor="#FFFFFF">进行中</td>
                                                    </c:if>
                                                    <c:if test="${pro.pzhuangtai==2}">
                                                        <td bgcolor="#FFFFFF">已完成</td>
                                                    </c:if>
                                                    <td bgcolor="#FFFFFF"><a
                                                            href="project.do?method=editProject&id=${pro.projectid }">编辑</a>|<a
                                                            href="servlet/XiangMuServlet?methodName=xiangMuMingXi&prono=${pro.projectid }&tag=2">查看</a>
                                                    </td>
                                                    <input type='hidden' name='hello' value="${pro.projectid }">
                                                    <input type='hidden' name='world'>
                                                </tr>
                                            </c:forEach>
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
                                    <td width="50%">第 <span
                                            class="right-text09">${requestScope.curPage>=requestScope.yeshu?requestScope.yeshu:requestScope.curPage}</span>
                                        页 | 共 <span class="right-text09">${requestScope.yeshu }</span> 页 | <span
                                                class="right-text09">${requestScope.totalPage  }</span>条记录
                                    </td>

                                    <td width="49%" align="right">[<a
                                            href="<%=basePath %>servlet/XiangMuServlet?methodName=showJiBenXinXi&curPage=1&tag=jibenxinxi"
                                            class="right-font08">首页</a>
                                        |
                                        <a href="<%=basePath %>servlet/XiangMuServlet?methodName=showJiBenXinXi&curPage=${requestScope.curPage>1?requestScope.curPage-1:1 }&tag=jibenxinxi"
                                           class="right-font08">上一页</a>
                                        |
                                        <a href="<%=basePath %>servlet/XiangMuServlet?methodName=showJiBenXinXi&curPage=${requestScope.curPage<requestScope.totalPage?requestScope.curPage+1:requestScope.yeshu }&tag=jibenxinxi"
                                           class="right-font08">下一页</a>
                                        |
                                        <a href="<%=basePath %>servlet/XiangMuServlet?methodName=showJiBenXinXi&curPage=${requestScope.yeshu}&tag=jibenxinxi"
                                           class="right-font08">末页</a>] 转至：
                                    </td>
                                    <td width="1%">
                                        <table width="20" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="1%"><input id="ij" type="text" class="right-textfield03"
                                                                      size="1"/></td>
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
</form>

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
    <img src="file:///F|/项目管理相关资料/项目管理系统页面/images/loadon.gif"/>
</div>

</body>
</html>
