<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 9:01
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
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>
<script type="text/javascript">

    var div = document.getElementById('hell');
    var index = 0;
    $(document).ready(function () {
        var h = $("#hello1").html();


        //保存数据，并将数据放入hidden中
        $("#save").click(function () {
            var obj = document.getElementsByName("gname");
            var obj1 = document.getElementsByName("hao");
            var obj2 = document.getElementsByName("miss");
            var obj3 = document.getElementsByName("modno");
            var obj4 = document.getElementsByName("miao");
            var obj5 = '12';
            var gname = "";
            var hao = "";
            var miss = "";
            var modno = "";
            var miao = "";
            //alert("h1"+index);
            //验证是否有未填记录
            for (var i = 0; i <= index; i++) {
                if (obj[i].value == "") {
                    alert("您有未填写的功能名称！");
                    return false;
                }
                if (obj1[i].value == "") {
                    alert("您有未填写的需求版本号！");
                    return false;
                }
                if (obj2[i].value == "") {
                    alert("您有未填写的优先级！");
                    return false;
                }
                if (obj3[i].value == "") {
                    alert("您有未填写的模块名称！");
                    return false;
                }
            }
            var r = confirm("确认保存？");
            if (r == true) {

                for (var i = 0; i < index; i++) {
                    alert("aa" + i);
                    alert(obj[i].value + "=====" + obj1[i].value + "====" + obj2[i].value + "=====" + obj3[i].value + "=====" + obj4[i].value);
                    gname = gname + obj[i].value + "-";
                    hao = hao + obj1[i].value + "-";
                    miss = miss + obj2[i].value + "-";
                    modno = modno + obj3[i].value + "-";
                    miao = miao + obj4[i].value + "-";
                    alert("----" + hao);
                }
                //alert("h3");
                gname = gname + obj[index].value;
                hao = hao + obj1[index].value;
                miss = miss + obj2[i].value;
                modno = modno + obj3[i].value;
                miao = miao + obj4[i].value;
                alert(hao);
                //alert("h2");
                $("#gname1").val(gname);
                $("#hao1").val(hao);
                $("#miss1").val(miss);
                $("#modno1").val(modno);
                $("#miao1").val(miao);
                //alert("fff");
                $("#fom").attr("action", "servlet/GongnengServlet?methodName=update");
                //alert("nice");
            } else {
                return false;
            }
        });
    });


    function xuanxm() {

        var activeX = null;
        try {
            activeX = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
            activeX = new ActiveXObject("Msxml2.XMLHTTP");
        }
        var s = document.getElementById("pid");
        var index1 = s.selectedIndex;
        //alert(s[index1].value);
//调用open方法
        activeX.Open("post", "servlet/GongnengServlet?methodName=queryMK&pno=" + s[index1].value, true);
        //alert("222222222");
        activeX.onreadystatechange = function () {
            if (activeX.readyState == 4) {
                $(document).ready(function () {
                    $(".mod").html(activeX.responseText);
                });
            }
        }
//调用send方法
        activeX.send();
    }


    function xuanxuqiu(obj) {
        //alert("2222222");
        var activeX = null;
        try {
            activeX = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
            activeX = new ActiveXObject("Msxml2.XMLHTTP");
        }
        //var s = document.getElementById("nno");
        var index1 = obj.selectedIndex;
        activeX.open("post", "servlet/GongnengServlet?methodName=queryMK1&nno=" + obj[index1].value, true);
        activeX.onreadystatechange = function () {
            if (activeX.readyState == 4) {
                $(document).ready(function () {
                    var num = 0;
                    $(".nnn").attr("id", "nno");
                    for (var i = 0; i <= index; i++) {
                        //alert("1");
                        obj.id = "nno1";
                        //alert($(".nnn:eq("+i+")").attr("id")+"===="+obj.id);
                        if ($(".nnn:eq(" + i + ")").attr("id") == obj.id) {
                            num = i;
                            //alert(index+"====");
                            break;
                        }
                    }
                    //alert("2");
                    $(".d1:eq(" + num + ")").html(activeX.responseText);
                });
                //document.getElementById("d1").innerHTML = activeX.responseText;
                // alert(activeX.responseText);
            }
        }
        //接收返回值
        activeX.send();

    }

    function xuanmk() {
        //alert("2222222");
        var activeX = null;
        try {
            activeX = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
            activeX = new ActiveXObject("Msxml2.XMLHTTP");
        }
        var s = document.getElementById("modno");
        var index = s.selectedIndex;
        //alert(index);
        activeX.open("post", "servlet/GongnengServlet?methodName=addGN&modno=" + s[index].value, true);
        activeX.onreadystatechange = function () {
            if (activeX.readyState == 4) {
                document.getElementById("d1").innerHTML = activeX.responseText;
                alert(activeX.responseText);
            }
        }
        //接收返回值
        activeX.send();

    }


</script>
<script>


</script>
<body class="ContentBody">
<form action="servlet/GongnengServlet?methodName=update&gno=12&flag=1" method="post" name="fom" id="fom">

    <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
        <tr>
            <th class="tablestyle_title">项目功能编辑页面</th>
        </tr>

        <tr>
            <td class="CPanel">

                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">

                    <tr align="center">
                        <td class="TablePanel" height="30" style="font-size:16px"><span class="TablePanel"
                                                                                        style="font-size:16px"></span>

                            <select name="pid" id="pid" onchange="xuanxm();">
                                <option value="0">请选择</option>

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

                            </select>
                    </tr>


                    <TR id="zdjh">
                        <TD width="100%">
                            <div class="MainDiv" id='hello1'>
                                <fieldset style="height:100%;">
                                    <legend class='gongneng'>功能编辑</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="15%">功能名称:</td>
                                            <td width="35%"><input name="gname" id='gname' type="text" value="中故宫和"
                                                                   class="text" style="width:154px"/>
                                                <span class="red">*</span></td>
                                            <td align="right">需求版本号</td>
                                            <td><input class="text" name="hao" value="2" style="width:154px"/></td>
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
                                                    <select style="width:154px;color:gray">
                                                        <option>--请选择--</option>
                                                    </select>
                                                </div>
                                            </td>


                                        </tr>
                                        <tr>
                                            <td width="15%" align="right">所属模块:</td>
                                            <td width="35%"><span class="TablePanel" style="font-size:16px"></span>
                                                <div id="d1" class='d1'>
                                                    <select style="width:154px">
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
                <input type="submit" name="Submit" value="保存" class="button"/>　

                <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
        </TR>
    </TABLE>


</form>

</body>
</html>
