<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-3-4
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>个人中心-应聘邀请</title>
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
			<div class="navItem"><a href="<%=path%>">首页</a></div>
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
				<li><a href="<%=path%>user/shenqinglist">申请的职位</a></li>
				<li><a href="<%=path%>user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="<%=path%>user/mianshi">面试通知</a></li>
				<li class="orang"><a href="<%=path%>user/yaoyue">应聘邀请</a></li>
			</ul>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1>账户管理</h1>
		</div>
		<div class="TopNotice">
			<span>修改密码</span>
		</div>
		<div class="AccountMain">
			<div class="updatePsd">
				<div class="boxDiv">
					<input hidden id="userpass" value="${sessionScope.user.password}"/>
					<span class="nametxt">原密码：</span>
					<input name="" type="text" id="password"/>
				</div>
				<div class="boxDiv">
					<span class="nametxt">新密码：</span>
					<input name="" type="text" id="newpassword"/>
					<span class="SpNotice">请输入6-20个字符</span>
				</div>
				<div class="boxDiv">
					<span class="nametxt">确认新密码：</span>
					<input name="" type="text" id="newpassword2"/>
				</div>
				<div class="boxDiv">
					<a href="javascript:void(0)" onclick="passsure('<%=path%>')" class="updateBtn">确认修改</a>
				</div>
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


