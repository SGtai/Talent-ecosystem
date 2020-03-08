<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/8
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
	String Path = application.getContextPath();
	String dbimgPath =application.getContextPath()+"/uploadS/images/";
%>
<html>
<head>
	<title>预览</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 700px;
		}

		#layout{
			width: 720px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
			background-color: #f2f2f2;

		}
	</style>
</head>
<body >
<button type="button" class="layui-btn layui-btn-radius">
	<a href="javascript:history.back(-1)"><<返回</a>
</button>
	<form id="layout" class="layui-form" action="" style="border: #9F9F9F solid 1px;background-color: #f2f2f2;
			background-image: url('../../uploadS/images/zhaopinbeijing.jpg');
			background-size: 100%">
		<div class="layui-form-item" style="width: 720px;margin-top:75%" align="center">
			<b><h1><label style="color:yellow">诚|聘|精|英&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp广|募|良|才</label></h1></b>
			<h2><label  style="color: #cccccc">招聘时间：${yulan[0].zhaopinTime} </label></h2>
		</div>
		<div class="layui-form-item" style="width: 720px;margin-top:0;margin-left: 17%" >
			<B><h2><label  style="color: yellow">招聘岗位：${yulan[0].postion}</label></h2></B>
			<h3><label  style="color: #cccccc">招聘人数：${yulan[0].zpNum}人</label></h3>
			<h3><label  style="color: #cccccc">学历要求：${yulan[0].xueliRequire}</label></h3>
			<h3><label  style="color: #cccccc">工作经验：${yulan[0].gzExperience}</label></h3>
			<h3><label  style="color: #cccccc">年龄：${yulan[0].ageLow}-${yulan[0].ageHigh}周岁</label></h3>
			<c:if test="${yulan[0].salaryLow==0&&yulan[0].salaryHigh==0}">
				<h3><label  style="color: #cccccc">月薪：面议</label></h3>
			</c:if>
			<c:if test="${yulan[0].salaryHigh!=0}">
				<h3><label  style="color: #cccccc">月薪：${yulan[0].salaryLow}-${yulan[0].salaryHigh}月/元</label></h3>
			</c:if>
			<h3><label  style="color: #cccccc">性别：${yulan[0].sex}</label></h3>
			<c:if test="${yulan[0].dayTime=='全天'}">
				<h3><label  style="color: #cccccc">工作时间：${yulan[0].dayTime}</label></h3>
			</c:if>
			<c:if test="${yulan[0].dayTime!='全天'}">
				<h3><label  style="color: #cccccc">工作时间：${yulan[0].dayTime}小时/每天</label></h3>
			</c:if>
			<h3><label  style="color: #cccccc">休息时间：${yulan[0].weekTime}</label></h3>
			<h3><label  style="color: #cccccc">班次：${yulan[0].workTime}</label></h3>
			<h3><label  style="color: #cccccc">基本福利：${yulan[0].baoxian} ${yulan[0].gjijin} ${yulan[0].jiangjin} ${yulan[0].zhusu}</label></h3>
			<h3><label  style="color: #cccccc">其他福利：${yulan[0].welfare}</label></h3>
			<h3><label  style="color: #cccccc">岗位职责：${yulan[0].jobDuty}</label></h3>
		</div>
		<div class="layui-form-item" style="width: 720px;margin-top:0;margin-left: 10%" >

		</div>
		<div class="layui-form-item" style="width: 720px;margin-top:0;margin-left: 45%" >
			<B><h2><label  style="color: yellow;text-align: right" >招聘单位:${yulan[0].qyname}</label></h2></B>
			<h2><label  style="color: #cccccc">联系人:${yulan[0].lxMan}</label></h2>
			<h2><label  style="color: #cccccc">联系电话:${yulan[0].lxPhone}</label></h2>
			<h2><label  style="color: #cccccc">联系地址:${yulan[0].lxAddress}</label></h2>
		</div>
	</form>
	<script src=<%=path + "jquery-3.4.1.js"%> ></script>
	<script src=<%=path + "layui.js"%>></script>
	<script src="<%=path+"json2.js"%>"></script>
</body>
</html>
