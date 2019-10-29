<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%--
   @Description: TODO 
   @Author Baseen
   @Date Created in 2019/10/29 21:59
   @Version v1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb18030"/>
    <title>项目管理系统 </title>
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


    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://localhost:8081/mlxg/jquery.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#goto").click(function () {
                var curPage = $("#gotot").val();
                if (!/^[1-9][0-9]*$/.test(curPage)) {
                    alert("请输入数字！");
                    return false;
                }
                if (curPage < 0 || curPage > 1) {
                    alert("输出数字不正确！");
                    return false;
                }
                if (curPage == "") {
                    alert("请输入！");
                    return false;
                }
                $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=" + curPage + "&flag=1");
            });
            $("#begjh").click(function () {
                var jno = $("#begjh").attr("name");
                //alert(jno);
                var path = 'http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=zhixingWork';
                $.post(path, {jno: jno});
                $("#begjh").val("已开始");
                $("#begjh").attr("disabled", "disabled");
            });
        });

    </script>
    <script type="text/JavaScript">
        var dx, dy;
        var dx = (screen.height / 2 - 105) + "";
        var dy = (screen.width / 2 - 200) + "";
        $(document).ready(function () {
            $("#find").click(function () {
                var path = "http://localhost:8081/mlxg/files/listrenwusousuo.jsp";
                var returnv = window.showModalDialog(path, "高级查询", "dialogTop=" + dx + ";dialogLeft=" + dy + ";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
                //var returnv=window.open("http://localhost:8081/mlxg/files/listrenwusousuo.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
                //alert(returnv);
                if (returnv != undefined) {
                    $("#fom").attr("action", "http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=chaxunWorkInfo&curPage=1" + returnv);
                }
            });
            $("#find0").click(function () {
                //alert("hello");
                var text1 = $("#text1").val();
                var text2 = $("#text2").val();
                //alert(text1+text2);
                //alert(/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text1));
                if (text1 != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text1)) {
                    alert("格式不正确，应为yyyy-mm-dd");
                    return;
                }
                if (text2 != "" && !/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text2)) {
                    alert("格式不正确，应为yyyy-mm-dd");
                    return;
                }

                var path = "http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=chaxunWorkInfo&curPage=1&jtitle=&mgrname=&kehuname=&jmission=&createdatebegin=" + text1 + "&createdateend=" + text2;
                //alert(path);
                $("#fom").attr("action", path);
            });
        });
    </script>
    <script>

    </script>

</head>
<body>
<form name="fom" id="fom" method="post" action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="../images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="../images/ico07.gif" width="20" height="18"/></td>
                                    <td width="538">查看内容：&nbsp;按时间：
                                        <input name="textfield" type="text" size="12" id='text1'/>
                                        <span class="newfont06">至</span>
                                        <input name="textfield" type="text" size="12" id='text2'/>
                                        <input name="Submit4" type="submit" class="right-button02" id='find0'
                                               value="查 询"/></td>
                                    <td width="144" align="left">
                                        <input name="Submit3" type="submit" class="right-button07" id='find'
                                               value="高级搜索"/>
                                    </td>
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
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">
                                            <tr class="CTitle">
                                                <td height="22" colspan="7" align="center" style="font-size:16px;">
                                                    个人任务信息列表
                                                </td>
                                            </tr>
                                            <tr bgcolor="#EEEEEE">

                                                <td width="10%">任务标题</td>
                                                <td width="10%">创建时间</td>
                                                <td width="10%">发送者</td>
                                                <td width="10%">执行人</td>
                                                <td width="5%">优先级</td>
                                                <td width="6%">操作</td>
                                            </tr>


                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="6"><img src="../images/spacer.gif" width="1" height="1"/></td>
                                </tr>
                                <tr>
                                    <td height="33">
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                               class="right-font08">
                                            <tr>
                                                <td width="50%">共 <span class="right-text09">1</span> 页 | 第 <span
                                                        class="right-text09">2</span> 页
                                                </td>
                                                <td width="49%" align="right">[<a
                                                        href="http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=1&flag=1"
                                                        class="right-font08">首页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=1&flag=1"
                                                        class="right-font08">上一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=1&flag=1"
                                                        class="right-font08">下一页</a> | <a
                                                        href="http://localhost:8081/mlxg/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=1&flag=1"
                                                        class="right-font08">末页</a>] 转至：
                                                </td>
                                                <td width="1%">
                                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="1%"><input name="gotot" id='gotot' type="text"
                                                                                  class="right-textfield03" size="1"/>
                                                            </td>
                                                            <td width="87%"><input name="goto" id='goto' type="submit"
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
            </td>
        </tr>
    </table>
</form>
</body>
</html>
