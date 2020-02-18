<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>菜鸟网后台高校首页</title>
	<link rel="stylesheet" href=<%=cssPath+"pintuer.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"admin.css"%>>
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header layui-bg-black">
		<div class="layui-logo">后台管理</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left"></ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<span style="cursor: pointer">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					管理员
				</span>
			</li>
			<li class="layui-nav-item"><a href="">退出</a></li>
		</ul>
	</div>
	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<li class="layui-nav-item layui-nav-itemed">
					<a  href="javascript:;">用户管理</a>
					<dl class="layui-nav-child">
						<dd><a href="<%="admin/returnuserquery.do"%>" target="myiframe">用户查询</a></dd>
						<dd><a href="<%="admin/returnusercontrol.do"%>" target="myiframe">用户管控</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<a href="javascript:;">文档管理</a>
					<dl class="layui-nav-child layui-nav-itemed" >
						<dd><a href="javascript:;" target="myiframe">文档审核</a></dd>
						<dd><a href="javascript:;" target="myiframe">文档管理</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<a href="javascript:;">日志管理</a>
					<dl class="layui-nav-child layui-nav-itemed">
						<dd><a href="javascript:;" target="myiframe">用户日志管理</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<a href="javascript:;">系统配置</a>
					<dl class="layui-nav-child layui-nav-itemed">
						<dd><a href="javascript:;" target="myiframe">上传奖励配置</a></dd>
						<dd><a href="javascript:;" target="myiframe">注册奖励配置</a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<div class="layui-body">
		<!-- 内容主体区域 -->
		<div style="padding: 15px;)">
			<iframe src="" frameborder="1" name="myiframe" style="width: 100%;height: 77vh"></iframe>
		</div>
	</div>

	<div class="layui-footer layui-bg-black">

	</div>
</div>
<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
<script src=<%=jsPath+"everything.js"%>></script>
<script src=<%=path+"layui.js"%>></script>
<script src=<%=path+"json2.js"%>></script>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
</script>
</body>
</html>
