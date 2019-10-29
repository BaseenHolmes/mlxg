<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/28 23:06
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">

    <title>My JSP 'editmokuai.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all"/>

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="http://localhost:8080/mlxg/jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

        //保存
        $(document).ready(function () {
            $("#save").click(function () {
                var r = confirm("确认保存？");
                if (r == true) {
                    fom.action = "<%=path%>/module.do?method=doAddModule&flag=update";
                    fom.submit();
                } else {
                    return;
                }
            })
        })


    </script>
    <script language="JavaScript" type="text/javascript">


        //验证
        function yanzheng(n) {
            $(document).ready(function () {
                if (n == '1') {
                    //moname
                    var moname = $("#moname").val();
                    if (moname.length > 10) {
                        alert("模块标题不能大于10个字节！");
                        $("#moname").attr("value", '');
                        //$("#save").attr("disabled","disabled");
                    } else if (moname == '') {
                        alert("模块标题不能为空！");
                        //$("#save").attr("disabled","disabled");
                    }

                } else if (n == '2') {
                    //mobiaozhi
                    var mobiaozhi = $("#mobiaozhi").val();
                    if (mobiaozhi.length > 10) {
                        alert("计划标识不能大于5个字节！");
                        $("#mobiaozhi").attr("value", '');
                        //$("#save").attr("disabled","disabled");
                    } else if (mobiaozhi == '') {
                        alert("计划标识不能为空！");
                        //$("#save").attr("disabled","disabled");
                    }

                } else if (n == '3') {
                    //prono
                    var prono = $("#prono").val();
                    if (!/^[0-9]*$/.test(prono)) {
                        alert(prono);
                    }

                } else if (n == '4') {
                    //modmission
                    var modmission = $("#modmission").val();
                    if (!/^[0-9]*$/.test(modmission)) {
                        alert(modmission);
                    }
                } else if (n == '5') {
                    //moddescription
                    var moddescription = $("#moddescription").val();
                    if (moddescription.length > 300) {
                        alert("项目备注不能大于150个字节！");
                        $("#moddescription").attr("value", '');
                    }
                } else if (n == '6') {
                    //modneedDescription
                    var modneedDescription = $("#modneedDescription").val();
                    if (modneedDescription.length > 300) {
                        alert("项目备注不能大于300个字节！");
                        $("#modneedDescription").attr("value", '');
                    }
                }


            });
        }


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
                <th class="tablestyle_title">项目模块修改页面</th>
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
                            <td class="TablePanel">${requestScope.module.projectname}</td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>项目模块信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="13%">模块名字:</td>
                                            <td width="46%"><input name="moname" id='moname' onblur='yanzheng("1");'
                                                                   value="${requestScope.module.mname}" class="text"
                                                                   style="width:154px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td nowrap="nowrap" align="right">模块标识:</td>
                                            <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");'
                                                       type="text" value="${requestScope.module.mbiaoshi}" class="text"
                                                       style="width:154px"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">所属项目:</td>
                                            <td><select id="prono" name="prono" onblur='yanzheng("3");'
                                                        style="width:154px" onchange="getNeed(this);">
                                                <option selected='selected'
                                                        value="${requestScope.module.projectid}">${requestScope.module.projectname}</option>
                                                <c:forEach items="${requestScope.projects}" var="proj">
                                                    <option value="${proj.projectid}">${proj.pname}</option>
                                                </c:forEach>
                                            </select></td>
                                            <td nowrap="nowrap" align="right">所属需求:</td>
                                            <td id="xmxuqiu">
                                                <div id="nno">
                                                    <select id="xuqiu" name="needid" style="width:154px">
                                                        <option selected="selected"
                                                                value="${requestScope.module.needid}">${requestScope.module.needname}</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td align="right">优先级:</td>
                                            <td>
                                                <select name="modmission" id='modmission' onblur='yanzheng("4");'
                                                        style="width:154px">
                                                    <option value="${requestScope.module.myouxianji}"
                                                            selected="selected">
                                                        <c:if test="${requestScope.module.myouxianji == 0}">
                                                            暂不
                                                        </c:if>
                                                        <c:if test="${requestScope.module.myouxianji == 1}">
                                                            一般
                                                        </c:if>
                                                        <c:if test="${requestScope.module.myouxianji == 2}">
                                                            需要
                                                        </c:if>
                                                        <c:if test="${requestScope.module.myouxianji == 3}">
                                                            急
                                                        </c:if>
                                                        <c:if test="${requestScope.module.myouxianji == 4}">
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
                                            <td align="right"></td>
                                            <td></td>

                                        </tr>
                                        <tr align="top">
                                            <td nowrap align="right" height="120px">模块描述:</td>
                                            <td colspan="3">
                                                <textarea id="moddescription" name="moddescription"
                                                          onblur='yanzheng("5");' style="" rows="6"
                                                          cols="80">${requestScope.module.mtext}</textarea></td>
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
                    <input type="hidden" name="modno" value="13"/>　
                    <input type="button" name="save" id='save' value="保存" class="button"/>　
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>

    </div>
</form>
</body>
</html>

