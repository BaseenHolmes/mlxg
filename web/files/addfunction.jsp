<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 9:00
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8080/mlxg/">

    <title>My JSP 'editjihua.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<script type="text/javascript" src="http://localhost:8080/mlxg/jquery.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        //保存数据，并将数据放入hidden中
        $("#save").click(function () {
            var r = confirm("确认保存？");
            if (r === true) {
                $("#fom").attr("action", "function.do?method=doAddFunction");
                $("#fom").submit();
            }
        });

    });

    function showNeed(obj) {
        $("#xuqiu").empty();
        var patha = "<%=path%>/function.do?method=showNeedByProjectId";
        $.post(patha, {prono: obj.value}, function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#xuqiu").append("<option value='" + data[i].needid + "'>" + data[i].nname + "</option>")
            }
        });
    }

    function showModule(obj) {
        $("#mokuai").empty();
        var patha = "<%=path%>/function.do?method=showModuleByNeedId";
        $.post(patha, {xuqiu: obj.value}, function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#mokuai").append("<option value=" + data[i].moduleid + ">" + data[i].mname + "</option>")
            }
        });
    }


</script>
<script>


</script>
<body class="ContentBody">
<form action="" method="post" name="fom" id="fom">

    <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
        <tr>
            <th class="tablestyle_title">项目功能添加页面</th>
        </tr>

        <tr>
            <td class="CPanel">

                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">


                    <tr align="center">
                        <td class="TablePanel" height="30" style="font-size:16px"><span class="TablePanel"
                                                                                        style="font-size:16px"></span>

                            <select name="prono" id="prono" onchange="showNeed(this);" style="width:100px">
                                <option selected="selected">请选择项目</option>
                                <c:forEach items="${requestScope.projectList}" var="pro">
                                    <option value="${pro.projectid}">${pro.pname}</option>
                                </c:forEach>
                            </select>
                    </tr>
                    <TR id="zdjh">
                        <TD width="100%">
                            <div class="MainDiv" id='hello1'>
                                <fieldset style="height:100%;">
                                    <legend class='gongneng'>功能1</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="15%">功能名称:</td>
                                            <td width="35%"><input name="gname" id='gname' type="text" class="text"
                                                                   style="width:154px"/>
                                                <span class="red">*</span></td>
                                            <td align="right">需求版本号</td>
                                            <td><input class="text" name="hao" style="width:154px"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">优先级:</td>
                                            <td><select name="miss" style="width:154px">
                                                <option selected="selected">==请选择==</option>
                                                <option value="0">暂不</option>
                                                <option value="1">一般</option>
                                                <option value="2">需要</option>
                                                <option value="3">急</option>
                                                <option value="4">很急</option>
                                            </select></td>
                                            <td nowrap="nowrap" align="right">所属需求:</td>
                                            <td id="xmxuqiu">
                                                <div id="mod" class='mod'>
                                                    <select style="width:154px;color:gray" name="xuqiu" id="xuqiu"
                                                            onchange="showModule(this)">
                                                        <option>--请选择需求--</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="15%" align="right">所属模块:</td>
                                            <td width="35%"><span class="TablePanel" style="font-size:16px"></span>
                                                <div id="d1" class='d1'>
                                                    <select style="width:154px" name="mokuai" id="mokuai">
                                                        <option selected="selected">=请选择=</option>
                                                    </select>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">功能描述:</td>
                                            <td colspan="3"><textarea name="miao" cols="80" rows="6"></textarea></td>
                                        </tr>
                                    </table>
                                    <br/>

                                </fieldset>
                                <div class='hello' id='hell'></div>
                            </div>
                        </TD>
                    </TR>
                </TABLE>


            </td>
        </tr>


        <TR>
            <TD colspan="2" align="center" height="50px">
                <input type="button" name="Submit" id='save' value="保存" class="button"/>　

                <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
        </TR>
    </TABLE>
    <input type='hidden' value='' name='gname1' id='gname1'>
    <input type='hidden' value='' name='hao1' id='hao1'>
    <input type='hidden' value='' name='miss1' id='miss1'>
    <input type='hidden' value='' name='modno1' id='modno1'>
    <input type='hidden' value='' name='miao1' id='miao1'>


</form>

</body>
</html>

