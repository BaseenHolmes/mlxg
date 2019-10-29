<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 21:58
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>项目管理系统 by www.eyingda.com</title>
    <link rel="stylesheet" rev="stylesheet" href="/mlxg/css/style.css" type="text/css" media="all"/>


    <script language="JavaScript" type="text/javascript">
        function tishi() {
            var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
            if (a != true) return false;
            window.open("冲突页.htm", "", "depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        }

        function check() {
            document.getElementById("aa").style.display = "";
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
<script type="text/javascript" src="/mlxg/jquery.js"></script>
<script type="text/javascript">
    function gaibian() {
        var s = document.getElementById("sdescription").value;
        var i = 300 - s.length;
        if (s.length <= 300) {
            document.getElementById("sy").innerHTML = "剩余(" + i + ")字";
        } else {
            document.getElementById("sy").innerHTML = "字数超出限制";
        }
    }

    function baocun() {
        var ss = $("#sdescription").val();
        var pgsalary = $("#pgsalary").val();
        var posalary = $("#posalary").val();
        var skou = $("#skou").val();
        if (pgsalary == "") {
            alert("奖金不能为空！");
        } else if (!/^[0-9]*$/.test(pgsalary) == true) {
            alert("奖金必须输入数字！");
        } else if (pgsalary.length > 10) {
            alert("奖金长度过长！");
        } else if (posalary == "") {
            alert("其他奖金不能为空！");
        } else if (!/^[0-9]*$/.test(posalary) == true) {
            alert("其他奖金必须输入数字！");
        } else if (posalary.length > 10) {
            alert("其他奖金长度过长！");
        } else if (skou == "") {
            alert("处罚扣除金额不能为空！");
        } else if (ss.length > 300) {
            alert("字数超过限制");
        } else {
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/SalaryServlet?methodName=InsertSalary");
            $("#fom").submit();
        }
    }
</script>
<body class="ContentBody">
<form method="post" name="form" id="fom">

    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">员工工资发放</th>
            </tr>
            <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                        </tr>
                        <tr>
                            <td width="100%">
                                <fieldset style="height:100%;">
                                    <legend>工资信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="15%">奖金:</td>
                                            <td width="35%">
                                                <input name="fname" value="1" type="hidden">
                                                <input name=pno value="55555" type="hidden">
                                                <input class="text" name='pgsalary' id='pgsalary' style="width: 154px"
                                                       value="0"/></td>
                                            <td align="right" width="16%">其他奖金:</td>
                                            <td width="34%"><input class="text" name='posalary' id='posalary'
                                                                   style="width: 154px" value="0"/>
                                                <span class="red">*</span></td>
                                        </tr>
                                        <tr>
                                            <td width="15%" nowrap align="right">处罚扣除金额:</td>
                                            <td width="35%"><input class="text" name='skou' id='skou'
                                                                   style="width:154px" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">年份:</td>
                                            <td><select name="year">
                                                <option>2009</option>
                                                <option selected="selected">2010</option>
                                                <option selected="selected">2011</option>
                                            </select></td>
                                            <td align="right">月份:</td>
                                            <td><select name="month">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td align="right">描述:
                                            </td>
                                            <td colspan="3">&nbsp;<textarea name="sdescription" id="sdescription"
                                                                            cols="100" rows="8"
                                                                            onkeyup="gaibian();"></textarea><font
                                                    size="2px" id="sy" color="blue">剩余(300)字</font></td>
                                        </tr>
                                    </table>
                                    <br/>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="50px">
                    <input type="button" value="保存" class="button" onclick="baocun();"/>
                    　
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>

