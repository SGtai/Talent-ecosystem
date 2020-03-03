<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-3-3
  Time: 19:43
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
	<title>个人中心-我的关注</title>
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
					<font>[28421947]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="personal_updatepsd.html">修改密码</a></li>
							<li><a href="personal_updatenum.html">修改手机</a></li>
							<li><a href="index.html">退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="Left">
				<a class="Mobile" href="">手机版</a>
			</div>
			<div class="Left">
				<div class="Weixin">微信
					<div id="WeixinPopup">
						<img src="images/showqrcode.jpg" width="120" height="120">
						<p>扫一扫完成绑定<br>求职信息接收及时，<br>不再错过好工作！</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src="images/logo_1.png"/><img src="images/logo_2.png" /></a></div>
		<div class="nav">
			<div class="navItem"><a href="index.html">首页</a></div>
			<div class="navItem"><a href="searchJob.html">职位搜索</a></div>
			<div class="navItem"><a href="meetingJob.html">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="jobnews.html">就业资讯</a></li>
							<li><a href="download.html">文档下载</a></li>
							<li><a href="helpJob.html">求职互助</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href="personal.html" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_jl.html" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_zwss.html" class="a3">职位搜索</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_cai.html" class="a4">你的菜儿</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/user/shenqinglist">申请的职位</a></li>
				<li class="orang"><a href="/user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="personal_mainshi.html">面试通知</a></li>
				<li><a href="personal_yaoqing.html">应聘邀请</a></li>
				<li><a href="personal_whogz.html">谁在关注我</a></li>
				<li><a href="personal_goutong.html">在线沟通记录</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="personal_zhanghu.html" class="a7">账户管理</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src="images/showqrcode.jpg" />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">我的关注</h1>
		</div>
		<div class="sqzwBox">
			<ul id="tabsqzw">
				<li>关注的职位</li>
			</ul>
			<div class="clear"></div>

			<c:if test="${list != null}">
				<c:forEach items="${list}" begin="0" var="i">
					<div id="contentsqzw">
						<input hidden value="${i.zpxxid}" id="zpxxid"/>
						<input hidden value="${i.qyid}" id="qyid"/>
						<div class="mygzBox">
							<div class="mygzBox1">
								<a href="jobtype.html" class="ajob">
										<c:if test="${i.postion != null}">
											${i.postion}
										</c:if>

								</a>
								<a href="company.html" class="acmp">
									<c:if test="${i.qyName != null}">
										${i.qyName}
									</c:if></a>
								<a href="javascript:void(0)" class="ljsq" onclick="toudi()">立即投递简历</a>
							</div>
							<div class="clear"></div>
							<div class="mygzBox2">
								<div class="mygzBox2_1">工作地点：<c:if test="${i.adress != null}">${i.adress}</c:if></a> | 职位月薪：<c:if test="${i.money != null}">${i.money}</c:if> | 招聘人数：<c:if test="${i.zpNum != null}">${i.zpNum}</c:if>人</div>
								<div class="mygzBox2_2">
									<span>关注时间：
										<c:if test="${i.sctime != null}">
											${i.sctime}
										</c:if>
									</span>
									<a href="">取消关注</a>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>

	</div>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>

<div style="padding: 20px 100px;height: 150px;" class="layui-form" id="jllist">
	<form class="layui-form">
		<label class="layui-form-label" style="margin-left: -110px;">请选择投递的简历</label>
		<div class="layui-input-block" style="width: 200px;margin-left: 0px;">
			<select name="interest" lay-filter="jlselect" id="jlselect">
			</select>
		</div>
	</form>
</div>
</body>
</html>

