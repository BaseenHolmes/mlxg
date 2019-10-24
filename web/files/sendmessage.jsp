<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>项目管理系统 by www.eyingda.com</title>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all"/>

    <script  type="javascript">

    </script>

    <script language="JavaScript" type="text/javascript">

        /**
         * 选择收件人后显示收件人
         * @param obj
         */
        function recipientName(obj) {
            document.getElementById("name3").value = obj.value;
        }

        /**
         * 验证表单信息
         * @returns {boolean}
         */
        function check() {

            var biaoti = document.getElementById("biaoti");
            if(biaoti.value == null){
                alert("消息标题不能为空");
                return false;
            }

            var message = document.getElementById("Message");
            if(message.value == null){
                alert("消息标题不能为空");
                return false;
            }

            var recipient = document.getElementById("name3");
            if(recipient.value == null){
                alert("请选择收件人");
                return false;
            }
            return true;
        }

    </script>
    <script type="text/javascript" src="<%=basePath%>jquery.js"></script>
</head>

<body class="ContentBody">

<form action="message.do?method=doSendMessage" method="post" name="form" id='form' target="mainFrame">
    <input type="hidden" value="${sessionScope.token}" name="token">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">新建信息</th>
            </tr>
            <tr>

            <TR>
                <TD width="100%">
                    <fieldset style="height:100%;">
                        <legend>新建信息</legend>
                        <table border="0" cellpadding="2" cellspacing="1" style="width:100%">


                            <tr>
                                <td nowrap align="right" width="11%">消息标题:</td>
                                <td width="27%"><input name='biaoti' type="text" class="text" style="width:154px"
                                                       value="" id='biaoti'/>
                                    <span class="red"> *</span>
                                    <div style="position:absolute;color:red" id='bid'></div>
                                </td>

                                <td align="right" width="25%">&nbsp;</td>
                                <td width="37%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="11%" align="right" nowrap>接收者:</td>
                                <td colspan="3">

                                    <input type='text' name='name3' id='name3' class='text'
                                           style="width:154px;height:20px;left=150" disabled='disabled'>
                                    <input type='hidden' name='name' id='name' class='text'
                                           style="width:154px;height:20px;left=150">
                                    <span class="red"> *</span>
                                    <div style="position:absolute;color:red" id='nid'></div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>

                            <tr>
                                <td width="11%" nowrap align="right">信息内容:</td>
                                <td colspan="2"><textarea name="textarea" cols="100" rows="20" id='message'></textarea>

                                </td>
                                <td>

                                    <table>
                                        <tr>
                                            <td>请选择接收者：</td>
                                        </tr>
                                        <tr>
                                            <td><select multiple="multiple" size="18" name="recipient" id='recipient'
                                                         style='width:174px;left:0px' onchange="recipientName(this)">
                                                <c:forEach items="${requestScope.recipients}" var="recipients">
                                                    <option value='${recipients.username}'>${recipients.username}</option>

                                                </c:forEach>

                                            </select></td>
                                        </tr>
                                    </table>
                                </td>


                            </tr>
                        </table>
                        <br/>
                    </fieldset>
                </TD>
            </TR>
        </TABLE>
        <table>
            <TR>
                <TD colspan="2" align="center" height="50px">
                    <input type="submit" value="发送" class="button" id='fid1' onclick="return check()"/>　

                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </table>

    </div>
</form>
</body>
</html>
