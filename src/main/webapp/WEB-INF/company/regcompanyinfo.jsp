<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/18
  Time: 10:18
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
	<title>Layui</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 500px;
		}

		#layout {
			width: 35%;
			height: 650px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
		}
		.layui-form-label{
			width: 120px;
		}
		.layui-input{
			width: 250px;
		}
		#button1{
			margin-left: 38%;
		}
	</style>
</head>
<body>
<div id="layout">
	<form class="layui-form" action="" >
		<br>
		<div>
			<h1 align="center">完善企业信息</h1>
		</div>
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label" >公司名称</label>

			<div class="layui-input-inline" >
				<input name="qyName" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" >统一社会信用代码</label>
			<div class="layui-input-inline" >
				<input name="qyData" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
			<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">注册地址</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="qyAddress" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
			<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">法定代表人</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="qyfdMan" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
			<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">注册资本</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="regMoney" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
			<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">公司类型</label>
			<div class="layui-input-block">
				<input name="qyType" title="有限责任公司" type="radio" checked="" value="有限责任公司">
				<input name="qyType" title="股份有限责任公司" type="radio" value="股份有限责任公司">
				<input name="qyType" title="个人独资企业" type="radio" value="个人独资企业">
				<input name="qyType" title="合伙企业" type="radio" value="合伙企业">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">经营范围</label>
			<div class="layui-input-inline" style="width: 250px">
				<textarea name="jyScope" class="layui-textarea" placeholder="请输入内容"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">营业期限</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="jyTime" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required">
			</div>
			<%--			<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>--%>
			<div id="qy1" style="display: none;"></div>
		</div>

		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1">
				<button class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">完善资料</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>

</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"companylogin.js"%>"></script>
</body>
</html>