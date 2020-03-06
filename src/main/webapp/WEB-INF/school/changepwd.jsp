<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
	String apppath=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改企业信息</title>
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
	<script src=<%=path+"layui.js"%>></script>
	<script src=<%=path+"json2.js"%>></script>
	<style>
		body {
			width: 100%;
			height: 1000px;
		}

		#layout {
			width: 50%;
			height: 500px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
		}
		.layui-form-label{
			width: 120px;

		}
		.layui-input{
			width: 250px;
			text-align: center;
		}
		.layui-form-item{
			margin-left: 5%;
			margin-top: 6%;
		}
		#button1{
			margin-left: 38%;
		}
	</style>
</head>
<body>
<div id="layout">
	<form class="layui-form" action="" >
		<div>
			<h1 align="center" style="margin-top: 4%">修改高校密码</h1>
		</div>
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label" >账号：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="scName" id="scName" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.scAccount} autocomplete="off" disabled />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">原始密码：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="mpass" id="mpass" class="layui-input" type="text" placeholder="请输入"  autocomplete="off"   lay-verify="required" maxlength="30" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="newpass" id="newpass" class="layui-input" type="text" placeholder="请输入"  autocomplete="off"   lay-verify="required" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="10">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">再次确认新密码：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="renewpass" id="renewpass" class="layui-input" type="text" placeholder="请输入"  autocomplete="off"  lay-verify="required" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18" >
			</div>
		</div>
		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1" style="margin-left: 42%">
				<button type="button" class="layui-btn"  id="bb" onclick="changepwd()">确认修改</button>
			</div>
		</div>
<script>
	function changepwd() {
		var password=$("#mpass").val();
		var newpass=$("#newpass").val();
		var renewpass=$("#renewpass").val();
		if(password.length==0||newpass.length==0||renewpass.length==0){
			alert("请填写完整");
			return;
		}
		if(password==newpass){
			alert("新密码不能与旧密码一致");
			return;
		}
		if(newpass.length<=5){
			alert("新密码不能小于6位高于12位");
			return;
		}
		if(newpass==renewpass){
			$.ajax(
				{
					type:"POST",
					url:'<%=apppath+"school/pwd"%>',
					dataType:"text",
					data:{
						password:password,
						newpass:newpass
					},
					success:function (msg) {
						if(msg==="0"){
							alert("旧密码输入错误，请重新输入");
						}else if(msg==="1"){
							alert("修改成功");
							$("#mpass").val("");
							$("#newpass").val("");
							$("#renewpass").val("");
						}else if(msg==="erro"){
							alert("您还未登陆erro");
						}
					},
					error:function (msg) {
						alert("系统忙，请稍等");
					}
				}
			);
		}else{
			alert("再次确认新密码不一致，请重新输入");
		}
	}
</script>

</body></html>
