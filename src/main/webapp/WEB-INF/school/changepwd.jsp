<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/17
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/";
	String othPath =application.getContextPath()+"/schoolS/other/";
%>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title></title>
	<link rel="stylesheet" href=<%=cssPath+"pintuer.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"admin.css"%>>
	<link rel="stylesheet" href="<%=othPath+"layui/css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
	<script src=<%=othPath+"layui/layui.js"%>></script>
</head>
<body style="padding-left: 30%;padding-top: 8%">
<%--<div class="bg"></div>--%>
	<div class="panel admin-panel" style="width: 60%;background-color: #eede1b">
		<div class="panel-head" style="background-color: #666666"><strong><span class="icon-key"></span> 修改高校用户密码</strong></div>
		<div class="body-content">
			<form method="post" class="form-x" action="" style="width: 200%;margin-left: 15%">
				<div class="form-group">
					<div class="label">
						<label>高校用户账号：</label>
					</div>
					<div class="field">
						<label style="line-height:33px;">
							这里是我要从服务器获取的高校用户账号名字
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>原始密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>确认新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="button" onclick=""> 提交</button>
						<button class="button bg-main icon-check-square-o" type="button" style="margin-left: 3%"> 返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>


</body></html>
