<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/18
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册界面</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 500px;
		}

		#layout {
			width: 35%;
			height: 440px;
			margin: auto;
			margin-top: 100px;
			border: #9F9F9F solid 1px;
		}
		#label1{
			margin-top: -10px;
		}
		#button1{
			margin-left: 38%;
		}
	</style>
</head>
<body>
<div id="layout">
	<form class="layui-form" action="" >
		<input id="qyAccount" type="hidden" value="${sessionScope.Qyinfo.qyAccount}" />
		<br>
		<div>
			<h1 align="center">企业修改密码</h1>
		</div>
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-inline" style="width: 190px">
				<label name="qyAccount" class="layui-form-label" style="width: 180px;text-align: left;" >${sessionScope.Qyinfo.qyAccount}</label>
			</div>
			<div class="layui-form-mid layui-word-aux"></div>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">原始密码</label>
			<div class="layui-input-inline">
				<input name="password3" class="layui-input" type="password" id="password3"  placeholder="请输入密码" autocomplete="off"  onblur="passexist3(this.value)">
			</div>
			<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
			<div id="qy4" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-inline">
				<input name="password" class="layui-input" type="password" id="password"  placeholder="请输入密码" autocomplete="off"  onblur="passexist(this.value)">
			</div>
			<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
			<div id="qy2" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-inline">
				<input name="password2" class="layui-input" type="password" id="password2" placeholder="请输入密码" autocomplete="off" onblur="passexist2(this.value)">
			</div>
			<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
			<div id="qy3" style="display: none;"></div>
		</div>
		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1">
				<button class="layui-btn" type="submit" lay-filter="changepassword" lay-submit="">修改密码</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>
</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"changepassword.js"%>"></script>

</body>
</html>
