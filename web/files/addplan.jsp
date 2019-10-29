<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 22:22
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="http://localhost:8081/mlxg/">

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

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

    </script>
    <script language="JavaScript" type="text/javascript">

        //验证
        function save1() {
            //alert("1111");
            var jtitle = $("#jtitle").val();
            var jrbegindate = $("#jrbegindate").val();
            var jrenddate = $("#jrenddate").val();
            var jbyper = $("#jbyper").val();
            var jmission = $("#jmission").val();
            var jleixing = $("#jleixing").val();
            var iscomplete = $("#iscomplete").val();
            var jbeizhu = $("#jbeizhu").val();
            var nno = $("#nno").val();
            var prono = $("#prono").val();
            var nno = $("#nno").val();
            var modno = $("#modno").val();
            var gno = $("#gno").val();
            var jno = $("#jno").val();

            if (jtitle.length > 10) {
                alert("计划标题不能大于10个字节！");
                $("#jtitle").attr("value", '');
                //$("#save").attr("disabled","disabled");
            } else if (jtitle == '') {
                alert("计划标题不能为空！");
                //$("#save").attr("disabled","disabled");
            } else

            //jrbegindate

            if (jrbegindate == '') {
                alert("项目计划开始时间不能为空！");
            } else if (!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrbegindate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                $("#jrbegindate").attr("value", '');
            } else


            //jrenddate

            if (jrenddate == '') {
                alert("项目计划结束时间不能为空！");
            } else if (!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrenddate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                $("#jrenddate").attr("value", '');
            } else

            //jbyper

            if (!/^[0-9]*$/.test(jbyper)) {
                alert(jbyper);
            } else

            //jmission

            if (!/^[0-9]*$/.test(jmission)) {
                alert(jmission);
            } else

            //jleixing

            if (!/^[0-9]*$/.test(jleixing)) {
                alert(jleixing);
            } else

            //iscomplete

            if (!/^[0-9]*$/.test(iscomplete)) {
                alert(iscomplete);
            } else


            //项目，需求，模块，功能，前置计划
            if (!/^[0-9]*$/.test(prono)) {
                alert(prono);
            } else if (!/^[0-9]*$/.test(nno)) {
                alert(nno);
                return false;
            } else if (!/^[0-9]*$/.test(modno)) {
                alert(modno);
                return false;
            } else if (!/^[0-9]*$/.test(gno)) {
                alert(gno);
                return false;
            } else if (!/^[0-9]*$/.test(jno)) {
                alert(jno);
                return false;
            } else

            //jbeizhu

            if (jbeizhu.length > 300) {
                alert("项目备注不能大于300个字节！");
                $("#jbeizhu").attr("value", '');
            } else

            //jbeizhu

            if (nno.length > 300) {
                alert("项目备注不能大于300个字节！");
                $("#nno").attr("value", '');
            } else {
                fom.action = "servlet/JiHuaServlet?methodName=addJiHua";
                fom.submit();

            }

        }


        //获取需求
        function xuanxiangmu() {
            var value = $("#prono").val();
            //alert(value);
            var path = "servlet/JiHuaServlet?methodName=lianDong1";

            $.post(path, {prono: value}, function (v) {
                //alert(v);
                $("#xuqiu").html(v);
            });
        }

        //获取模块
        function xuanxuqiu() {
            var value = $("#nno").val();
            //alert(value);
            var path = "servlet/JiHuaServlet?methodName=lianDong";

            $.post(path, {nno: value}, function (v) {
                //alert(v);
                $("#mokuai").html(v);
            });
        }

        //获取功能
        function xuanmk() {
            var value = $("#modno").val();
            //alert(value);
            var path = "servlet/JiHuaServlet?methodName=lianDong2";

            $.post(path, {modno: value}, function (v) {
                //alert(v);
                $("#gongneng").html(v);
            });
        }

        //获取功能下的计划
        function xuanjh() {
            var value = $("#gno").val();
            //alert(value);
            var path = "servlet/JiHuaServlet?methodName=lianDong3";

            $.post(path, {gno: value}, function (v) {
                //alert(v);
                $("#jihua").html(v);
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
                <th class="tablestyle_title">项目计划添加页面</th>
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
                            <td class="TablePanel"><select name="prono" id="prono" onchange="xuanxiangmu();">
                                <option selected="selected">请选择项目</option>

                                <option value="3">劳动力市场</option>

                                <option value="1">种子软件</option>

                                <option value="2">Dota编辑器</option>

                                <option value="4">五台山旅游</option>

                                <option value="5">A3不限电</option>

                                <option value="6">英立培训</option>

                                <option value="7">龙谷私服</option>

                                <option value="8">七十二变</option>

                                <option value="9">安卓3D</option>

                                <option value="10">Jias系统</option>

                                <option value="11">穿越过去</option>

                                <option value="12">das</option>

                                <option value="13">adasdasd</option>

                            </select></td>
                            <td class="TablePanel">&quot;</td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>修改计划</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="15%">计划标题:</td>
                                            <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");'
                                                                   type="text" class="text" style="width:154px"/>
                                                <span class="red">*</span></td>
                                            <td width="16%" align="right" nowrap="nowrap">前置任务计划:</td>
                                            <td width="34%">
                                                <div id='jihua'>
                                                    <select style="width:154px">
                                                        <option>请先选择功能</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td nowrap="nowrap" align="right">计划开始时间:</td>
                                            <td><input class="text" name='jrbegindate' id='jrbegindate'
                                                       onblur='yanzheng("2");' style="width:154px"/></td>
                                            <td align="right">计划结束时间:</td>
                                            <td><input class="text" name='jrenddate' id='jrenddate'
                                                       onblur='yanzheng("3");' style="width:154px"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">任务执行人:</td>
                                            <td>
                                                <select name="jbyper" id='jbyper' onblur='yanzheng("4");'
                                                        style="width:154px" class="text">
                                                    <option selected="selected">请选择任务执行人</option>

                                                    <option value="44444">张鑫</option>

                                                    <option value="55555">逃兵</option>

                                                    <option value="2">pipi</option>

                                                </select>
                                            </td>
                                            <td align="right">优先级:</td>
                                            <td>
                                                <select name="jmission" id='jmission' onblur='yanzheng("5");'
                                                        style="width:154px">
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
                                            <td align="right">任务类型:</td>
                                            <td>
                                                <select id='jleixing' name="jleixing" onblur='yanzheng("6");'
                                                        style="width:154px" class="text">
                                                    <option selected="selected">请选择任务类型</option>
                                                    <option value="0">测试类型0</option>
                                                    <option value="1">测试类型1</option>
                                                    <option value="2">测试类型2</option>
                                                    <option value="3">测试类型3</option>
                                                </select>
                                            </td>
                                            <td align="right">状态:</td>
                                            <td>
                                                <select id='iscomplete' name="iscomplete" onblur='yanzheng("7");'
                                                        style="width:154px" class="text">
                                                    <option selected="selected">请选择完成状态</option>
                                                    <option value="0">未开始</option>
                                                    <!--
                                                      <option value="1" >进行中</option>
                                                      <option value="2" >已完成</option>
                                                       -->
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">项目需求:</td>
                                            <td>
                                                <div id="xuqiu">
                                                    <select style="width:154px">
                                                        <option selected="selected">请先选择项目</option>
                                                    </select>
                                                </div>
                                            </td>

                                            <td align="right">项目模块:</td>
                                            <td>
                                                <div id="mokuai">
                                                    <select style="width:154px" class="text">
                                                        <option selected="selected">请先选择需求</option>
                                                    </select>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">项目功能:</td>
                                            <td>
                                                <div id="gongneng">
                                                    <select style="width:154px">
                                                        <option selected="selected">请先选择模块</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">计划备注:</td>
                                            <td colspan="3"><textarea id='jbeizhu' name="jbeizhu"
                                                                      onblur='yanzheng("8");' cols="100"
                                                                      rows="8"></textarea></td>
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
                    <input type="hidden" name="token" value="1572358922074">
                    <input type="button" name="save" id='save' value="保存" onclick="save1();" class="button"/>　
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
            </TR>
        </TABLE>


    </div>
</form>
</body>
</html>
