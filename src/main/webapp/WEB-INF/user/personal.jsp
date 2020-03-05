<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-27
  Time: 11:35
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
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href=<%=cssPath+"personal.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<title>个人中心</title>
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
							<li><a href="/jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="javascript:void(0)" onclick="tuichu2()">退出</a></li>
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
			<div class="navItem"><a href="/user/index">首页</a></div>
			<div class="navItem"><a href="/jump/home/searchJob">职位搜索</a></div>
			<div class="navItem"><a href="/techa">人才成长区</a></div>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox active">
				<a href="/jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox">
				<a href="/user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="" class="a3">我的校友</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/user/shenqinglist">申请的职位</a></li>
				<li><a href="/user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/user/mianshi">面试通知</a></li>
				<li><a href="/user/yaoyue">应聘邀请</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
	</div>
	<div class="perRightcon">
		<div class="perRT">
			<span class="spr">菜鸟人才网 ，找工作更靠谱</span>
		</div>
		<div class="perRpart1">
			<div class="perRpart1_l">
				<c:if test="${sessionScope.user.picture ==null or sessionScope.user.picture ==''}">
					<img src="<%=imagesPath+"per1.jpg"%>" width="80" height="100" />
				</c:if>
				<c:if test="${sessionScope.user.picture !=null and sessionScope.user.picture !=''}">
					<img src="<%=dbimgPath%>${sessionScope.user.picture}" width="80" height="100" />
				</c:if>
			</div>
			<div class="perRpart1_r">
				<div class="PaName">您好！</div>
				<div class="clear"></div>
				<div class="PaCon">
					<c:if test="${sessionScope.user.name != null}">
						<span class="span1">用户名：${sessionScope.user.name} <a href="personal_renzheng.html" class="a1"></a> <a href="/jump/user/personal_updatepsd" class="a2">修改密码</a></span>
					</c:if>
					<span class="span3">手机号：${sessionScope.user.phone} <a href="" class="a3"></a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="jobSea">
			<div class="jobSea3">
				<a href="/jump/user/personal_jlupdate">完善个人信息</a>
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
</body>
</html>
