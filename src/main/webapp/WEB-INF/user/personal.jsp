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
							<li><a href="personal_updatepsd.html">修改密码</a></li>
							<li><a href="personal_updatenum.html">修改手机</a></li>
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
		<div class="logo"><a href="/user/index"><img src="<%=imagesPath+"logo_1.png"%>"/><img src="<%=imagesPath+"logo_2.png"%>" /></a></div>
		<div class="nav">
			<div class="navItem"><a href="/user/index">首页</a></div>
			<div class="navItem"><a href="/jump/home/searchJob">职位搜索</a></div>
			<a href="/techa">人才成长区</a>
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
				<li><a href="/jump/user/personal_mainshi">面试通知</a></li>
				<li><a href="/jump/user/personal_yaoqing">应聘邀请</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">菜鸟人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="perRT">
			<span class="spl">您尚未绑定微信，绑定后第一时间接收信息，不再错过任何好工作。</span>
			<span class="spr">蝶飞人才网 ，找工作更靠谱</span>
		</div>
		<div class="perRpart1">
			<div class="perRpart1_l">
				<img src="<%=imagesPath+"per1.jpg"%>" width="80" height="100" />
			</div>
			<div class="perRpart1_r">
				<div class="PaName">您好！</div>
				<div class="clear"></div>
				<div class="PaCon">
					<c:if test="${sessionScope.user.name != null}">
						<span class="span1">用户名：${sessionScope.user.name} <a href="personal_renzheng.html" class="a1">[未认证]</a> <a href="personal_updatepsd.html" class="a2">修改密码</a></span>
					</c:if>
					<span class="span3">手机号：${sessionScope.user.phone} <a href="" class="a3">[已认证]</a> <a href="personal_updatenum.html" class="a2">修改</a></span>
				</div>
			</div>
			<div class="clear"></div>
			<div class="perRpart1_c">
				<div class="itemp">
					<a href="personal_whogz.html">
						<span class="Title">谁在关注我</span>
						<span class="Num">0</span>
					</a>
				</div>
				<div class="itemp">
					<a href="personal_sqzw.html">
						<span class="Title">申请的职位</span>
						<span class="Num">0</span>
					</a>
				</div>
				<div class="itemp">
					<a href="personal_mainshi.html">
						<span class="Title">面试通知</span>
						<span class="Num">0</span>
					</a>
				</div>
				<div class="itemp">
					<a href="personal_yaoqing.html">
						<span class="Title">应聘邀请</span>
						<span class="Num">0</span>
					</a>
				</div>
			</div>
		</div>
		<div class="jobSea">
			<div class="jobSea3">
				<a href="/jump/user/personal_jlupdate">完善个人信息</a>
			</div>
		</div>
		<div class="clear"></div>
		<div class="adBox">
			<img src="<%=imagesPath+"perAD.jpg"%>" width="814" />
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
