<%@ page language="java" import="java.util.*" pageEncoding="GB18030"
         contentType='text/html;charset=GB18030' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


    <title>客户系统</title>

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

    <link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath %>jquery.js"></script>
    <script type="text/javascript">
        function insertkehu() {
            location.href = '<%=path%>/files/insertkehu.jsp';
        }

        function x() {
            var deletes = document.getElementsByName('deletes');
            for (var i = 0; i < deletes.length; i++) {
                deletes[i].checked = 'checked';
            }
        }

    </script>
</head>

<body>
<form name="fom" id="fom" method="post" action='<%=path%>/client.do?method=deleteClient'>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="<%=path%>/images/nav04.gif">
                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>

                                    <td width="24"><img src="<%=path%>/images/ico07.gif" width="20" height="18"/></td>
                                    <td width="519"><label>公司名称:
                                        <input name="clientname" type="text" id="clientname"/>
                                    </label>
                                        <input name="Submit" type="text" id='chaxun' class="right-button02"
                                               value="查 询"/></td>
                                    <td width="679" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
                                    <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08"
                                                                                  id='allselect' onclick="x()">全选</a>-<a
                                            href="#" class="right-font08" id='fanselect'>反选</a></span>
                                        <input name="Submit" type="submit" class="right-button08" value="删除所选人员信息"
                                               id='delBtn'/><!--onclick="return function() {
          if(document.getElementById('delBtn').value == null || document.getElementById('delBtn').value === '' || document.getElementById('delBtn').value === undefined){
              alert('公司名称不能为空');
              return false
          }
          return true;
        }"--> <input name="aubmit"
                     id='tiana'
                     type="button"
                     class="right-button08"
                     value="添加人员信息" onclick="insertkehu()"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr>
                                                <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户详细列表
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="8%" align="center" bgcolor="#EEEEEE">选择</td>
                                                <td width="12%" height="20" align="center" bgcolor="#EEEEEE">公司名称</td>
                                                <td width="7%" align="center" bgcolor="#EEEEEE">联系人</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                                                <td width="14%" align="center" bgcolor="#EEEEEE">联系地址</td>
                                                <td width="28%" align="center" bgcolor="#EEEEEE">公司背景</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">添加时间</td>
                                                <td width="11%" align="center" bgcolor="#EEEEEE">操作</td>
                                            </tr>

                                            <c:forEach items="${requestScope.clientlist}" var="list" varStatus="vs">
                                                <tr>
                                                    <td bgcolor="#FFFFFF"><input type="checkbox" name="deletes"
                                                                                 value="${list.clientid}"/></td>
                                                    <td height="20" bgcolor="#FFFFFF"><a
                                                            href="<%=path%>/client.do?method=queryOneClient&id=${list.clientid}">${list.cname}</a>
                                                    </td>
                                                    <td bgcolor="#FFFFFF">${list.cper}</td>
                                                    <td height="20" bgcolor="#FFFFFF">${list.cphone}</td>
                                                    <td bgcolor="#FFFFFF">${list.caddress}</td>
                                                    <td bgcolor="#FFFFFF">${list.cbeijing}</td>
                                                    <td bgcolor="#FFFFFF">${list.cdate}</td>
                                                    <td bgcolor="#FFFFFF"><a
                                                            href="<%=path%>/client.do?method=queryOneClient&id=${list.clientid}">编辑</a>&nbsp;|&nbsp;<a
                                                            href="<%=path%>/client.do?method=queryOneClient&id=${list.clientid}">查看<input
                                                            type="hidden" name="hello" value="${list.clientid}"><input
                                                            type="hidden" class='world' name="world" id='world'></a>
                                                    </td>
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
                        <td height="6"><img src="<%=path%>/images/spacer.gif" width="1"
                                            height="1"/></td>
                    </tr>
                    <tr>
                        <td height="33">
                            <table width="100%" border="0" align="center" cellpadding="0"
                                   cellspacing="0" class="right-font08">
                                <tr>
                                    <td width="50%">共 <span
                                            class="right-text09">${requestScope.totalPage }</span>
                                        页 | 第 <span
                                                class="right-text09">${ requestScope.curpage}</span>
                                        页
                                    </td>
                                    <td width="49%" align="right">[<a
                                            href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${1}"
                                            class="right-font08">首页</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.curpage-1>0?requestScope.curpage-1 :"1"}"
                                           class="right-font08">上一页</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.curpage<requestScope.totalPage?requestScope.curpage+1:requestScope.totalPage }"
                                           class="right-font08">下一页</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.totalPage}"
                                           class="right-font08">末页</a>] 转至：
                                    </td>
                                    <td width="1%">
                                        <table width="20" border="0" cellspacing="0"
                                               cellpadding="0">
                                            <tr>
                                                <td width="1%"><input id="page" name="page"
                                                                      type="text"
                                                                      class="right-textfield03"
                                                                      size="1"/></td>
                                                <td width="87%"><input name="Submit23222"
                                                                       type="text"
                                                                       class="right-button06"
                                                                       value="" id='lik'/>
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