<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/17
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String layuiPath = application.getContextPath() + "/layui/";
    String jsPath = application.getContextPath() + "/adminS/js/";
    String cssPath = application.getContextPath() + "/adminS/css/";
    String path = application.getContextPath() + "/";

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script src=<%=layuiPath + "jquery-3.4.1.js"%>></script>
    <link rel="stylesheet" href=<%=layuiPath+"css/layui.css"%>>
    <link rel="stylesheet" href=<%=cssPath+"adminLogin.css"%>>
</head>
<body>
<div class="wrap">
    <div class="loginForm">
        <form class="layui-form">
            <div class="logoHead">
                <h2 style="margin-top: 15px">菜鸟人才网平台管理系统</h2>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>账号:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input class="layui-input adminInput" type="text" name="account"
                           lay-verify="required" autocomplete="off" placeholder="输入账号">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input class="layui-input adminInput" type="password" name="password"
                           lay-verify="required" autocomplete="off" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>验证码:</label>
                </div>
                <div class="cardDiv">
                    <input id="code" class="layui-input cardInput" type="text" name="code"
                           lay-verify="required" autocomplete="off" placeholder="输入验证码">
                </div>
                <div class="codeDiv">
                    <%--                    <input id="loginCode" class="layui-input codeInput" type="button">--%>
                    <img title="点击切换验证码" type="button" class="codeInput"
                         src="/admin/getVerifyCode" id="verifyCodeImage">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="submitLabel">
                    <label>没有账号？<a href="#" id="loginRegister">点击注册</a></label>
                </div>
                <div class="submitDiv">
                    <%--                    <input id="loginBtn" type="button" class="submit layui-btn layui-btn-primary" lay-filter="login" value="登录">--%>
                    <button id="loginBtn" type="button" class="submit layui-btn layui-btn-primary" lay-submit
                            lay-filter="login">登录
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src=<%=layuiPath+"layui.js"%> type="text/javascript"></script>
<script type="text/javascript">
    // 点击图片更换验证码事件
    $('#verifyCodeImage').on('click', function () {
        // $('#verifyCodeImage').removeProp('src');
        $('#verifyCodeImage').attr('src', '/admin/getVerifyCode?' + Math.random());
    })
    layui.use(['jquery', 'form', 'layer'], function () {
        var $ = layui.jquery
            , form = layui.form
            , layer = layui.layer;


        //验证码失去焦点
        $('#code').blur(function () {
            //获取input输入的值
            var inputCode = document.getElementById("code").value;
            $.ajax({
                type: "POST",
                url: "/admin/contrastCode",
                dataType: "text",
                data: {code: inputCode},
                success: function (flag) {
                    if (flag === 'true') {
                    } else {
                        layer.msg('验证码不一致', {icon: 5});
                        $("#code").val('');
                        $('#verifyCodeImage').attr('src', '/admin/getVerifyCode?' + Math.random());
                    }
                },
                error: function () {
                    layer.msg('服务器繁忙');
                }
            });

        })


        // $('#loginBtn').val("正在登录...");
        //注册表单提交
        form.on('submit(login)', function (data) {

            //ajax
            $.ajax({
                type: "POST",
                url: "/admin/login",
                dataType: "text",
                data: data.field,
                success: function (flag) {
                    if (flag === 'true') {
                        layer.msg('登录成功', {icon: 6});
                        window.location.href = '/jump/admin/main';
                    } else if ('noCode') {
                        layer.msg('验证码不正确，请重新输入', {icon: 5});
                        $("#code").val('');
                        $('#verifyCodeImage').attr('src', '/admin/getVerifyCode?' + Math.random());
                    } else if ('noAccount') {
                        layer.msg('账号不存在，请重新输入', {icon: 5});
                    } else {
                        layer.msg('密码不正确，请重新输入', {icon: 5});
                    }
                },
                error: function () {
                    layer.msg('服务器繁忙');
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


    });


</script>
</body>
</html>
