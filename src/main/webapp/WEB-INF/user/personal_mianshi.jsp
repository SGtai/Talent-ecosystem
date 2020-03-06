<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-3-3
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String cssPath = application.getContextPath()+"/userS/css/";
	String jsPath = application.getContextPath()+"/userS/js/";
	String path = application.getContextPath()+"/";
	String imagesPath =application.getContextPath()+"/homeS/images/";
	String dbimgPath =application.getContextPath()+"/images/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href=<%=cssPath+"personal.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<title>个人中心-面试通知</title>
</head>

<body>
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
		<div class="Account">
			<div class="Left">
				<div class="Info">
					<font>[${sessionScope.user.phone}]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="<%=path%>jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="javascript:void(0)" onclick="tuichu2('<%=path%>')">退出</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="nav">
			<div class="navItem"><a href="<%=path%>user/index">首页</a></div>
			<div class="navItem"><a href="<%=path%>jump/home/searchJob">职位搜索</a></div>
			<div class="navItem"><a href="<%=path%>techa">人才成长区</a></div>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href="<%=path%>jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox">
				<a href="<%=path%>user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="<%=path%>jump/user/myschooll" class="a3">我的校友</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li class="orang"><a href="<%=path%>user/shenqinglist">申请的职位</a></li>
				<li><a href="<%=path%>user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li class="orang"><a href="<%=path%>user/mianshi">面试通知</a></li>
				<li><a href="<%=path%>user/yaoyue">应聘邀请</a></li>
			</ul>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">申请的职位</h1>
		</div>
		<div class="sqzwBox">
			<ul id="tabsqzw">
				<li class="currentsqzw">全部</li>
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
			<div id="contentsqzw">
				<ul style="display:block;">
					<table class="tabzw" cellpadding="0" cellspacing="0">
						<tbody>
						<tr>
							<th width="22%" style="border-left: 1px #EDEDED solid;">职位信息</th>
							<th width="25%">企业名称</th>
							<th width="20%" style="text-align: center;">简历名称</th>
							<th width="15%"><div>申请时间</div></th>
							<th width="15%"><div>操作</div></th>
						</tr>
				<c:if test="${list != null}">
					<c:forEach items="${list}" begin="0" var="i">
						<tr>
							<td valign="middle">
								<a href="<%=path%>user/jobinfo?id1=${i.qyid}&id2=${i.zpxxid}">${i.postion}</a>
							</td>
							<td><a href="#" class="cpname">${i.qyName}</a></td>
							<td><span>${i.jlname}</span></td>
							<td><span>${i.sctime}</span></td>
							<td><span style="color:#707070">邀请面试</span></td>
							<td><a href="javascript:void(0)" onclick="msresultOk(${i.cxrzId},'<%=path%>')">接收邀请</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="msresultNo(${i.cxrzId},'<%=path%>')">拒绝邀请</a></td>
						</tr>
					</c:forEach>
				</c:if>

						</tbody>
					</table>
				</ul>
			</div>
		</div>

	</div>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">菜鸟人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />菜鸟人才网版权所有 <a href="">闽ICP证0******9号</a><a href="#"></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：200-8**-****</p>
</div>
<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal_jl.js"%>></script>
</body>
</html>

