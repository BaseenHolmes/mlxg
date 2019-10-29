<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/28 15:53
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">
    <title>My JSP 'addmokuai.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

        //保存
        $(document).ready(function () {
            $("#save").click(function () {
                var r = confirm("确认保存？");
                if (r === true) {
                    $("#fom").attr("action", "module.do?method=doAddModule&flag=add");
                    $("#fom").submit();
                }
            })
        });

        //获取需求
        function getNeed(obj) {
            $("#xuqiu").empty();
            var path = "<%=path%>/module.do?method=queryNeedsByProjectid";
            $.post(path, {prono: obj.value}, function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#xuqiu").append('<option value=' + data[i].needid + '>' + data[i].nname + '</option>')
                }
            });
        }


    </script>

    <style type="text/css">
        <!--
        .atten {
            font-size: 12px;
            font-weight: normal;
            color: #F00;
        }

        -->
    </style>
</head>

<body class="ContentBody">
<form action="" method="post" name="fom" id="fom">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">项目模块添加页面</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" id='t1' cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left">
                                <!--
                                <input type="button" name="save"  id='save' value="保存" class="button" />　
                                <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                                -->
                            </td>
                        </tr>


                        <tr align="center">
                            <td class="TablePanel">
                                项目模块添加页面
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <input type="button" value="添加模块" onclick="tianjia();" class="right-button07">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" value="删除模块" id='del' onclick="shanchu();"' class="right-button07">
                            </td>
                        </tr>
                        <TR id="model">
                            <TD width="100%">
                                <div>
                                    <div class="MainDiv" id='hello1'>
                                        <fieldset style="height:100%;">
                                            <legend class='model'>模块一</legend>
                                            <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                                <tr>
                                                    <td nowrap align="right" width="13%">模块名字:</td>
                                                    <td width="46%"><input name="moname" id="moname"
                                                                           onblur='yanzheng("1");' class="text"
                                                                           style="width:154px" type="text" size="40"/>
                                                        <span class="red"> *</span></td>
                                                    <td align="right" width="9%">&nbsp;</td>
                                                    <td width="32%">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td nowrap align="right">模块标识:</td>
                                                    <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");'
                                                               class="text" style="width:154px"/></td>
                                                    <td align="right">优先级:</td>
                                                    <td>
                                                        <select name="modmission" id='modmission'
                                                                onblur='yanzheng("3");' style="width:154px">
                                                            <option>请选择优先级</option>
                                                            <option value="0">暂不</option>
                                                            <option value="1">一般</option>
                                                            <option value="2">需要</option>
                                                            <option value="3">急</option>
                                                            <option value="4">很急</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">所属项目:</td>
                                                    <td><select id="prono" name="prono" onblur='yanzheng("4");'
                                                                style="width:154px" onchange="getNeed(this);">
                                                        <option value="0">请选择项目</option>
                                                        <c:forEach items="${requestScope.projects}" var="proj">
                                                            <option value="${proj.projectid}">${proj.pname}</option>
                                                        </c:forEach>
                                                    </select></td>
                                                    <td nowrap="nowrap" align="right">所属需求:</td>
                                                    <td id="xmxuqiu">
                                                        <select style="width:154px" id="xuqiu" name="needid">
                                                            <option selected="selected" value="">请先选择项目</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap align="right" height="120px">模块描述:</td>
                                                    <td colspan="3"><textarea id="moddescription" name="moddescription"
                                                                              onblur='yanzheng("5");' rows="5"
                                                                              cols="80"></textarea></td>
                                                </tr>
                                            </table>
                                            <br/>
                                        </fieldset>
                                        <div class='hello' id='hell'></div>
                                    </div>

                            </TD>
                        </TR>
                        <TR id="newmodel">

                    </TABLE>
                    <input type='hidden' value='' name='moname1' id='moname1'>
                    <input type='hidden' value='' name='mobiaozhi1' id='mobiaozhi1'>
                    <input type='hidden' value='' name='modmission1' id='modmission1'>
                    <input type='hidden' value='' name='nno1' id='nno1'>
                    <input type='hidden' value='' name='moddescription1' id='moddescription1'>
                    <input type='hidden' value='' name='modneedDescription1' id='modneedDescription1'>

                </td>
            </tr>


            <TR>
                <TD colspan="2" align="center" height="50px">
                    <input type="hidden" name="token" value="1572248991797">
                    <input type="button" name="save" id='save' value="保存" class="button"/>　
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>


    </div>
</form>
</body>
</html>
