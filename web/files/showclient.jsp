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


    <title>�ͻ�ϵͳ</title>

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
                                    <td width="519"><label>��˾����:
                                        <input name="clientname" type="text" id="clientname"/>
                                    </label>
                                        <input name="Submit" type="text" id='chaxun' class="right-button02"
                                               value="�� ѯ"/></td>
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
                                    <td height="20"><span class="newfont07">ѡ��<a href="#" class="right-font08"
                                                                                  id='allselect' onclick="x()">ȫѡ</a>-<a
                                            href="#" class="right-font08" id='fanselect'>��ѡ</a></span>
                                        <input name="Submit" type="submit" class="right-button08" value="ɾ����ѡ��Ա��Ϣ"
                                               id='delBtn'/><!--onclick="return function() {
          if(document.getElementById('delBtn').value == null || document.getElementById('delBtn').value === '' || document.getElementById('delBtn').value === undefined){
              alert('��˾���Ʋ���Ϊ��');
              return false
          }
          return true;
        }"--> <input name="aubmit"
                     id='tiana'
                     type="button"
                     class="right-button08"
                     value="�����Ա��Ϣ" onclick="insertkehu()"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr>
                                                <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ͻ���ϸ�б�
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="8%" align="center" bgcolor="#EEEEEE">ѡ��</td>
                                                <td width="12%" height="20" align="center" bgcolor="#EEEEEE">��˾����</td>
                                                <td width="7%" align="center" bgcolor="#EEEEEE">��ϵ��</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">��ϵ�绰</td>
                                                <td width="14%" align="center" bgcolor="#EEEEEE">��ϵ��ַ</td>
                                                <td width="28%" align="center" bgcolor="#EEEEEE">��˾����</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">���ʱ��</td>
                                                <td width="11%" align="center" bgcolor="#EEEEEE">����</td>
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
                                                            href="<%=path%>/client.do?method=queryOneClient&id=${list.clientid}">�༭</a>&nbsp;|&nbsp;<a
                                                            href="<%=path%>/client.do?method=queryOneClient&id=${list.clientid}">�鿴<input
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
                                    <td width="50%">�� <span
                                            class="right-text09">${requestScope.totalPage }</span>
                                        ҳ | �� <span
                                                class="right-text09">${ requestScope.curpage}</span>
                                        ҳ
                                    </td>
                                    <td width="49%" align="right">[<a
                                            href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${1}"
                                            class="right-font08">��ҳ</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.curpage-1>0?requestScope.curpage-1 :"1"}"
                                           class="right-font08">��һҳ</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.curpage<requestScope.totalPage?requestScope.curpage+1:requestScope.totalPage }"
                                           class="right-font08">��һҳ</a>
                                        |
                                        <a href="<%=path%>/servlet/clientServlet?methodName=queryall&page=${requestScope.totalPage}"
                                           class="right-font08">ĩҳ</a>] ת����
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