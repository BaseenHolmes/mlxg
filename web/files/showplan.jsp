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

    <title>My JSP 'listjihua.jsp' starting page</title>

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

    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/xiangmu.js"></script>
</head>
<script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>
<script type="text/JavaScript">

    var dx, dy;
    var dx = (screen.height / 2 - 105) + "";
    var dy = (screen.width / 2 - 200) + "";
    $(document).ready(function () {
        $("#find").click(function () {
            var returnv = window.showModalDialog("http://localhost:8081/mlxg/files/gaojisoujihua.jsp", "高级查询", "dialogTop=" + dx + ";dialogLeft=" + dy + ";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
            if (returnv != undefined) {
                $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=gaoJiCha" + returnv);
            }
        });
    });

</script>
<SCRIPT language=JavaScript>

    $(document).ready(function () {

        //全选
        $("#allselect").click(function () {
            //alert($("#allselect"));
            $(":checkbox").attr("checked", "checked");
        });

        //反选
        $("#fanselect").click(function () {
            var size = $(":checkbox").length;
            for (var i = 0; i < size; i++) {
                if ($(":checkbox:eq(" + i + ")").attr("checked") == "checked") {
                    //alert($(":checkbox").attr("checked"));
                    $(":checkbox:eq(" + i + ")").removeAttr("checked");
                } else {
                    $(":checkbox:eq(" + i + ")").attr("checked", "checked");
                }
            }
        });

        //删除


    });


    function linkdel() {
        var obj = document.getElementsByName("delid");
        var obj1 = document.getElementsByName("world");

        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                obj1[i].value = "yes";
            } else {
                obj1[i].value = "no";
            }
        }
        var r = confirm("确认删除？");
        if (r == true) {
            document.getElementById("fom").action = "servlet/JiHuaServlet?methodName=delJiHua";
            document.getElementById("fom").submit();
        } else {
            return;
        }

    }


</SCRIPT>
<script type="text/javascript">

    $(document).ready(function () {

        //分页
        $("#gog").click(function () {
            var curPage = $("#ij").val();
            alert(curPage);
            if (!/^[0-9]*$/.test(curPage)) {
                alert("请输入数字！");
                return false;
            }
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=showJiHuaXinXi&tag=showjihua&curPage=" + curPage);
        });

        //添加计划
        $("#add").click(function () {
            $("#fom").attr("action", "servlet/JiHuaServlet?methodName=showJiHuaXinXi&tag=addjihua");
            $("#fom").submit();
        });


        //发任务
        $(".fa").click(function () {
            var jjno = this.name;
            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=faJiHua&jno=" + jjno);

        })


        //时间查询
        $("#chaxun").click(function () {
            alert("111");
            var probuildDate = $("#probuildDate").val();
            //alert(probuildDate);
            if (probuildDate != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probuildDate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                return;
            }
            var enddate = $("#enddate").val();
            //alert(enddate);
            if (enddate != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(enddate)) {
                alert("格式不正确，应为yyyy-mm-dd");
                return;
            }

            $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=gaoJiCha&curPage=1&jtitle=&proname=&jper=&jmagr=&probuildDate=&enddate=");

        });
    });
</script>

<body onload="on_load()">

<form name="fom" id="fom" method="post" action="">
    <table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="550">查看内容：按时间：
                                        <input name="probuildDate" id='probuildDate' type="text" size="12"/><span
                                                class="newfont06">至</span>
                                        <input name="enddate" id='enddate' type="text" size="12"/>
                                        <input name="Submit" type="submit" class="right-button02" id='chaxun'
                                               value="查 询"/>
                                    </td>
                                    <td width="132" align="left"><a href="#" onclick="sousuo()">
                                        <input name="Submit" type="submit" class="right-button07" id='find'
                                               value="高级搜索"/></a></td>
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
                                    <td height="20"><span class="newfont07">选择：<input type="button"
                                                                                      class="right-button02" value="全选"
                                                                                      id='allselect'>-<input
                                            type="button" class="right-button02" value="反选" id='fanselect'></span>
                                        <input name="Submit" type="button" class="right-button08" value="删除所选计划"
                                               onclick="linkdel();"/>
                                        <input name="Submit2" id="add" type="button" class="right-button08"
                                               value="添加计划"/></td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">

                                            <tr>
                                                <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    项目计划列表 &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="5%" align="center" bgcolor="#EEEEEE">选择</td>
                                                <td width="10%" height="20" align="center" bgcolor="#EEEEEE">计划标题</td>
                                                <td width="7%" align="center" bgcolor="#EEEEEE">项目名称</td>
                                                <td width="7%" align="center" bgcolor="#EEEEEE">执行人</td>
                                                <td width="8%" align="center" bgcolor="#EEEEEE">负责人</td>
                                                <td width="8%" align="center" bgcolor="#EEEEEE">工期</td>
                                                <td width="5%" align="center" bgcolor="#EEEEEE">优先级</td>
                                                <td width="6%" align="center" bgcolor="#EEEEEE">状态</td>
                                                <td width="8%" align="center" bgcolor="#EEEEEE">是否超期</td>

                                                <td width="14%" align="center" bgcolor="#EEEEEE">操作</td>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">望着</td>
                                                <td bgcolor="#FFFFFF">种子软件</td>
                                                <td bgcolor="#FFFFFF">逃兵</td>
                                                <td bgcolor="#FFFFFF">浩南</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">19 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">19 天</td>


                                                <td bgcolor="#FFFFFF">很急</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=4&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=4&tag=onejihua">查看</a>|


                                                    <input type='submit' name='4' id='fa' class='fa' value='已下发'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="4">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">saygo</td>
                                                <td bgcolor="#FFFFFF">种子软件</td>
                                                <td bgcolor="#FFFFFF">张鑫</td>
                                                <td bgcolor="#FFFFFF">浩南</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">9 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">9 天</td>


                                                <td bgcolor="#FFFFFF">需要</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=6&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=6&tag=onejihua">查看</a>|


                                                    <input type='submit' name='6' id='fa' class='fa' value='发任务'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="6">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">123</td>
                                                <td bgcolor="#FFFFFF">英立培训</td>
                                                <td bgcolor="#FFFFFF">逃兵</td>
                                                <td bgcolor="#FFFFFF">老贺</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">31 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">31 天</td>


                                                <td bgcolor="#FFFFFF">需要</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=1&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=1&tag=onejihua">查看</a>|


                                                    <input type='submit' name='1' id='fa' class='fa' value='发任务'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="1">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">编数据1</td>
                                                <td bgcolor="#FFFFFF">英立培训</td>
                                                <td bgcolor="#FFFFFF">逃兵</td>
                                                <td bgcolor="#FFFFFF">老贺</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">32 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">32 天</td>


                                                <td bgcolor="#FFFFFF">需要</td>


                                                <td bgcolor="#FFFFFF">进行中</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=3&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=3&tag=onejihua">查看</a>|


                                                    <input type='submit' name='3' id='fa' class='fa' value='已下发'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="3">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">ads</td>
                                                <td bgcolor="#FFFFFF">种子软件</td>
                                                <td bgcolor="#FFFFFF">张鑫</td>
                                                <td bgcolor="#FFFFFF">浩南</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">9 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">9 天</td>

                                                <td bgcolor="#FFFFFF">暂不</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=7&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=7&tag=onejihua">查看</a>|


                                                    <input type='submit' name='7' id='fa' class='fa' value='发任务'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="7">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">911</td>
                                                <td bgcolor="#FFFFFF">龙谷私服</td>
                                                <td bgcolor="#FFFFFF">张鑫</td>
                                                <td bgcolor="#FFFFFF">浩南</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">334 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">334 天</td>


                                                <td bgcolor="#FFFFFF">需要</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=2&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=2&tag=onejihua">查看</a>|


                                                    <input type='submit' name='2' id='fa' class='fa' value='发任务'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="2">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                            <tr align="center">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td height="20" bgcolor="#FFFFFF">好不好</td>
                                                <td bgcolor="#FFFFFF">种子软件</td>
                                                <td bgcolor="#FFFFFF">逃兵</td>
                                                <td bgcolor="#FFFFFF">浩南</td>

                                                <!--
                                                    <td bgcolor="#FFFFFF">3 天</td>
                                               -->
                                                <td bgcolor="#FFFFFF">3 天</td>


                                                <td bgcolor="#FFFFFF">需要</td>


                                                <td bgcolor="#FFFFFF">未开始</td>


                                                <td bgcolor="#FFFFFF">是</td>
                                                <td bgcolor="#FFFFFF"><a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=5&tag=editjihua">编辑</a>|<a
                                                        href="servlet/JiHuaServlet?methodName=jiHuaXinXi&jno=5&tag=onejihua">查看</a>|


                                                    <input type='submit' name='5' id='fa' class='fa' value='发任务'
                                                           disabled='disabled'>


                                                    <input type='hidden' name='hello' id='jno' value="5">
                                                    <input type='hidden' name='world'>

                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="6"><img src="images/spacer.gif" width="1" height="1"/></td>
                    </tr>
                    <tr>
                        <td height="33">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                   class="right-font08">
                                <tr>
                                    <td width="50%">第 <span class="right-text09">1</span> 页 | 共 <span
                                            class="right-text09">1</span> 页 | <span class="right-text09">7</span>条记录
                                    </td>

                                    <td width="49%" align="right">[<a
                                            href="http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=showJiHuaXinXi&curPage=1&tag=showjihua"
                                            class="right-font08">首页</a>
                                        |
                                        <a href="http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=showJiHuaXinXi&curPage=1&tag=showjihua"
                                           class="right-font08">上一页</a>
                                        |
                                        <a href="http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=showJiHuaXinXi&curPage=2&tag=showjihua"
                                           class="right-font08">下一页</a>
                                        |
                                        <a href="http://localhost:8081/mlxg/servlet/JiHuaServlet?methodName=showJiHuaXinXi&curPage=1&tag=showjihua"
                                           class="right-font08">末页</a>] 转至：
                                    </td>
                                    <td width="1%">
                                        <table width="20" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="1%"><input id="ij" type="text" class="right-textfield03"
                                                                      size="1"/></td>
                                                <td width="87%"><input name="gog" id='gog' type="submit"
                                                                       class="right-button06" value=" "/>
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

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
    <img src="file:///F|/项目管理相关资料/项目管理系统页面/images/loadon.gif"/>
</div>

</body>
</html>

