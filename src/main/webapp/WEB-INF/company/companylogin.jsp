<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/16
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
	String Path=application.getContextPath();
	String cssPath = application.getContextPath() + "/companys/css/";
	String cssPath2 = application.getContextPath() + "/adminS/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册界面</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
<%--	<link rel="stylesheet" href=<%=cssPath+"style.css"%>>--%>

	<style>
		body {
			width: 100%;
			height: 500px;
			background-color: #16a085;
			background: url(<%=Path%>'/uploadS/images/regbeijing.jpg');
			background-size: 100% auto;
		}

		#layout {
			width: 35%;
			height: 480px;
			margin: auto;
			margin-top: 100px;
			border: #9F9F9F solid 1px;
			/*background-color: #ffffff;*/
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
<%--<div class="particles">--%>

<%--	<div class="intro">--%>
		<div id="layout">
		<form class="layui-form" action="" >
			<br>
			<div>
				<h1 align="center">企业立即注册，招聘更多人才</h1>
			</div>
			<br>
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline" style="width: 190px">
					<input name="qyAccount" class="layui-input" type="text" placeholder="请输入" autocomplete="off" id="qyAccount" onblur="queryaccount(this.value)">
				</div>
				<div class="layui-form-mid ">请填写6到20位账号</div>
				<div id="qy1" style="display: none;"></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input name="password" class="layui-input" type="password" id="password"  placeholder="请输入密码" autocomplete="off"  onblur="passexist(this.value)">
				</div>
				<div class="layui-form-mid">请填写6到12位密码</div>
				<div id="qy2" style="display: none;"></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-inline">
					<input name="password2" class="layui-input" type="password" id="password2" placeholder="请输入密码" autocomplete="off" onblur="passexist2(this.value)">
				</div>
				<div class="layui-form-mid ">请填写6到12位密码</div>
				<div id="qy3" style="display: none;"></div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label" >公司名称</label>
				<div class="layui-input-inline" style="width:400px">
					<input name="qyName" class="layui-input" type="text" placeholder="请输入公司名称" autocomplete="off" onblur="qyName2(this.value)">
				</div>
				<div id="qy5" style="display: none;"></div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label" >所在城市：</label>
				<div class="layui-input-inline">
					<select name="prid" lay-filter="chooseProvince2" lay-verify="required">
						<option value="">请选择省份</option>
						<c:if test="${province2!=null}">
							<c:forEach items="${province2}" begin="0" var="i">
								<option  value="${i.prid}">${i.name}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="ctid" id="ctid" lay-verify="required">
					</select>
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label" id="label1">验证统一社会信用代码</label>
				<div class="layui-input-inline" style="width:400px">
					<input name="qyData" class="layui-input" type="text" placeholder="请输入统一社会信用代码" autocomplete="off" onblur="verification(this.value)">
				</div>
				<div id="qy4" style="display: none;"></div>
			</div>
			<div class="layui-form-item" >
				<div class="layui-input-block" id="button1">
					<button class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">注册</button>
					<button class="layui-btn layui-btn-primary" type="reset">重置</button>
				</div>
			</div>
		</form>
		<h3 align="center">
			<a href=<%=Path+"/jump/admin/login"%>>已有账号，去登录</a>
		</h3>
		</div>
<%--	</div>--%>

<%--</div>--%>
<input id="Path" type="hidden" value="<%=Path%>" />

<%--<script src=<%=jsPath+"jquery-1.11.1.min.js"%>></script>--%>
<%--<script src=<%=cssPath2+"jquery.particleground.min.js"%>></script>--%>
<%--<script src=<%=jsPath+"demo2.js"%>></script>--%>
<script src=<%=path+"jquery-3.4.1.js"%> ></script>
<script src=<%=path+"layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"companylogin.js"%>"></script>

</body>
</html>
