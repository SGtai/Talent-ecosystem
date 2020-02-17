<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/16
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String layuiPath = application.getContextPath()+"/layui/";
    String jsPath = application.getContextPath()+"/admin/js/";
    String path = application.getContextPath()+"/";

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人才生态圈后台登录页面</title>
    <link rel="stylesheet" href=<%=layuiPath+"css/layui.css"%>>
</head>
<body>

<div class="login-main">
    <header class="layui-elip">人才生态圈平台管理端</header>
    <form class="layui-form" >
        <div class="layui-input-inline">
            <input type="text" name="account" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>

        <div class="layui-input-inline">
            <input type="text" id="login_code" required lay-verify="required" placeholder="验证码" autocomplete="off"
                   class="layui-input" style="width: 45%;">
            <canvas id="canvas" width="150px" height="50px" onclick="drawPic()"></canvas>
        </div>

        <div class="layui-input-inline login-btn">
            <button type="submit" lay-submit lay-filter="login_B" class="layui-btn">登录</button>
        </div>
        <hr/>

    </form>
</div>
<script type="text/javascript" src="<%=layuiPath+"jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src=<%=layuiPath+"layui.js"%>></script>
<%--<script src=<%=jspath+"login.js"%>></script>--%>
<script>

    // login
    layui.use(['form','layer','jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;


    });

</script>

</body>
</html>

