<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/16
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 500px;
		}

		#layout {
			width: 40%;
			height: 400px;
			margin: auto;
			margin-top: 100px;
			border: #9F9F9F solid 1px;
		}
	</style>
</head>
<body>
<div id="layout">
<form class="layui-form" action="" >
	<br>
	<div>
		<h1 align="center">企业立即注册，招聘更多人才</h1>
	</div>
	<br>
	<div class="layui-form-item" >
		<label class="layui-form-label">用户名</label>
		<div class="layui-input-block" style="width: 400px">
			<input type="text" id="account" name="account" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
			       class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密 码</label>
		<div class="layui-input-inline">
			<input name="password" class="layui-input" id="password" type="password" placeholder="请输入密码" autocomplete="off" lay-verify="pass">
		</div>
		<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">确认密码</label>
		<div class="layui-input-inline">
			<input name="password2" class="layui-input" id="password2"  type="password" placeholder="请再次输入密码" autocomplete="off" lay-verify="pass">
		</div>
		<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">统一社会信用代码</label>
		<div class="layui-input-block" style="width: 400px">
			<input type="text" id="card" name="" required lay-verify="required" placeholder="请输入统一社会信用代码" autocomplete="off"
			       class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block" style="left: 20%">
			<button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>
	<h3 align="center">
		<a href=""  >已有账号，去登录</a>
	</h3>

</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"companylogin.js"%>"></script>
</body>
</html>
