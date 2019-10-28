<%@ page import="java.util.List" %>
<%@ page import="com.huaxing.mlxg.po.Client" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/27 22:03
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">

    <title>My JSP 'editxiangmu.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all"/>
    <script type="text/javascript" src="js/xiangmu.js"></script>
    <script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>

    <script language="JavaScript" type="text/javascript">


    </script>
    <script language="JavaScript" type="text/javascript">
        //验证
        //验证

        /*function panduan() {
            var proidcomplete = $("#proidcomplete").val();
            if (proidcomplete == '0') {
                //alert(proidcomplete);
                document.getElementById("procompeteDate").readOnly = 'readonly';
            } else if (proidcomplete == '1') {
                //alert(proidcomplete);
                document.getElementById("procompeteDate").readOnly = 'readonly';
            } else if (proidcomplete == '2') {
                //alert(proidcomplete);
                document.getElementById("procompeteDate").readOnly = false;
            }

        }*/

        function save1() {
            var proname = $("#proname").val();
            var clientno = $("#clientno").val();
            var promoney = $("#promoney").val();
            var pronum = $("#pronum").val();
            var proManager = $("#proManager").val();
            var proidcomplete = $("#proidcomplete").val();
            var prozmoney = $("#prozmoney").val();
            var probeginDate = $("#probeginDate").val();
            var procompeteDate = $("#procompeteDate").val();
            var promission = $("#promission").val();
            var probeizhu = $("#probeizhu").val();
            form1.action = "project.do?method=doEditProject&id=${requestScope.id}";
            form1.submit();

        }


    </script>
</head>

<body class="ContentBody">
<form action="" method="post" name="form1" id="form1">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">&nbsp;项目修改页面</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left">
                                <!--
                                <input type="button" name="save"  id='save' value="保存" class="button" />　
                                <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                                -->
                            </td>
                        </tr>
                        <tr align="center">
                            <td class="TablePanel">种子软件</td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>项目信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="15%">项目名称:</td>
                                            <td width="35%"><input name='proname' id='proname' type="text" class="text"
                                                                   style="width:154px" onblur='yanzheng("1");'
                                                                   value="${requestScope.project.pname}"/>
                                                <span class="red">*</span><br></td>

                                            <td nowrap align="right" width="18%">所属单位:</td>
                                            <td width="35%">
                                                <select name="clientid" id='clientno' onblur='yanzheng("2");'
                                                        style="width:154px">
                                                    <option selected="selected"
                                                            value="${requestScope.project.clientid}">${requestScope.project.cname}</option>
                                                    <c:forEach items="${requestScope.clientList}" var="client">
                                                        <option value="${client.clientid}">${client.cname}</option>

                                                    </c:forEach>
                                                </select>
                                                <span class="red">*</span></td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="15%">项目金额:</td>
                                            <td width="35%"><input name='promoney' id='promoney' type="text"
                                                                   class="text" style="width:154px"
                                                                   onblur='yanzheng("3");'
                                                                   value="${requestScope.project.pyusuan}"/></td>
                                            <td nowrap align="right" width="18%">开发人数:</td>
                                            <td width="35%"><input name='pronum' id='pronum' type="text" class="text"
                                                                   style="width:154px" onblur='yanzheng("4");'
                                                                   value="${requestScope.project.pnumber}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">项目经理:</td>
                                            <td width="35%">
                                                <select name="proManager" id="proManager" style="width:154px"
                                                        onblur='yanzheng("5");'>

                                                    <option selected="selected"
                                                            value="${requestScope.project.userid}">${requestScope.project.uname}</option>
                                                    <c:forEach items="${requestScope.userList}" var="user">
                                                        <option value="${user.userid}">${user.username}</option>
                                                    </c:forEach>
                                                </select></td>
                                            <td nowrap align="right" width="18%">完成状态:</td>
                                            <td width="35%">
                                                <select name="proidcomplete" id='proidcomplete' style="width:154px"
                                                        <%--onchange="panduan();" --%>onblur='yanzheng("6");'>
                                                    <option value="${requestScope.project.pzhuangtai}"
                                                            selected="selected">
                                                        <c:if test="${requestScope.project.pzhuangtai == 0}">
                                                            未开始
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pzhuangtai == 1}">
                                                            进行中
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pzhuangtai == 2}">
                                                            已完成
                                                        </c:if>
                                                    </option>
                                                    <option value="0">未开始</option>
                                                    <option value="1">进行中</option>
                                                    <option value="2">已完成</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">实际总成本:</td>
                                            <td><input name='prozmoney' id='prozmoney' type="text" class="text"
                                                       style="width:154px" onblur='yanzheng("7");'
                                                       value="${requestScope.project.pyusuan}"/></td>
                                            <td nowrap="nowrap" align="right">实际开发日期:</td>
                                            <td><input name='probeginDate' id='probeginDate' type="text" class="text"
                                                       style="width:154px" onblur='yanzheng("8");' value=""/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">实际完成日期:</td>
                                            <td><input name='procompeteDate' id='procompeteDate' type="text"
                                                       class="text" style="width:154px" onblur='yanzheng("9");' value=""
                                                       readonly="readonly"/></td>
                                            <td align="right">优先级:</td>
                                            <td>
                                                <select name="promission" id='promission' style="width:154px"
                                                        onblur='yanzheng("10");'>
                                                    <option value="${requestScope.project.pyouxianji}"
                                                            selected="selected">
                                                        <c:if test="${requestScope.project.pyouxianji == 0}">
                                                            暂不
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pyouxianji == 1}">
                                                            一般
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pyouxianji == 2}">
                                                            需要
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pyouxianji == 3}">
                                                            急
                                                        </c:if>
                                                        <c:if test="${requestScope.project.pyouxianji == 4}">
                                                            很急
                                                        </c:if>
                                                    </option>
                                                    <option value="0">暂不</option>
                                                    <option value="1">一般</option>
                                                    <option value="2">需要</option>
                                                    <option value="3">急</option>
                                                    <option value="4">很急</option>
                                                </select>

                                            </td>

                                        </tr>
                                        <tr>
                                            <td width="15%" nowrap align="right">备注:</td>
                                            <td colspan="3"><textarea name="probeizhu" id='probeizhu' cols="100"
                                                                      rows="10" onblur='yanzheng("11");'
                                                                      style="">${requestScope.project.pbeizhu}</textarea>
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
                <TD colspan="2" align="center" height="50px">
                    <input type="hidden" name="prono" value="1">
                    <input type="button" name="save" id='save' onclick="save1();" value="保存" class="button"/>　
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>

                </TD>
            </TR>
        </TABLE>


    </div>
</form>
</body>
</html>
