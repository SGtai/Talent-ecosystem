<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/18
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>完善企业信息</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 650px;
		}

		#layout2 {
			width: 35%;
			height: 650px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
		}
		#qytype2{
			width: 150px;
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
<div id="layout2">
	<form class="layui-form" action="" >
		<input id="qyAccount" type="hidden" value="${sessionScope.Qyinfo.qyAccount}" />
		<br>
		<div>
			<h1 align="center">完善企业信息</h1>
		</div>
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label" >公司名称:</label>
			<div class="layui-input-inline" >
				<label name="qyName" class="layui-form-label" style="width: 180px;text-align: left;" >${sessionScope.Qyinfo.qyName}</label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" >统一社会信用代码:</label>
			<div class="layui-input-inline" >
				<label name="qyData" class="layui-form-label" style="width: 180px;text-align: left;">${sessionScope.Qyinfo.qyData}</label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">注册地址</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="qyAddress" id="qyAddress" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.Qyinfo.qyAddress}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">法定代表人</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="qyfdMan" id="qyfdMan" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.Qyinfo.qyfdMan}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">注册资本</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="regMoney" id="regMoney" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.Qyinfo.regMoney}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">公司类型</label>
			<div class="layui-inline" >
				<select name="qyType" id="qytype2"  lay-verify="required" >
					<option value="">请选择公司类型</option>
					<option value="国有企业">国有企业</option>
					<option value="集体所有制">集体所有制</option>
					<option value="个人独资企业">个人独资企业</option>
					<option value="股份制企业">股份制企业</option>
					<option value="有限合伙企业">有限合伙企业</option>
					<option value="股份合作企业">股份合作企业</option>
					<option value="合伙企业">合伙企业</option>
					<option value="联营企业">联营企业</option>
					<option value="港、澳、台">港、澳、台</option>
					<option value="外商投资企业">外商投资企业</option>
				</select>
			</div>
			<input id="qytype" type="hidden" value="${sessionScope.Qyinfo.qyType}" />
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">经营范围</label>
			<div class="layui-input-inline" style="width: 250px">
				<textarea name="jyScope" id="jyScope" class="layui-textarea" placeholder="请输入内容">${sessionScope.Qyinfo.jyScope}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">营业期限</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="jyTime" id="jyTime" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.Qyinfo.jyTime}">
			</div>
		</div>
		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1">
				<button class="layui-btn" type="submit" lay-filter="reg" lay-submit="">完善资料</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>

</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"regcompanyinfo.js"%>"></script>
<script type="text/javascript">
	var data=document.getElementById("qytype").value;
	$("#qytype2").find("option[value='${sessionScope.Qyinfo.qyType}']").attr("selected",'selected');
</script>
</body>
</html>