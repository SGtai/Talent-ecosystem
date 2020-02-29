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
							<li><a href="personal_renzheng.html">修改邮箱</a></li>
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
						<img src="<%=imagesPath+"showqrcode.jpg"%>" width="120" height="120">
						<p>扫一扫完成绑定<br>求职信息接收及时，<br>不再错过好工作！</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src="<%=imagesPath+"logo_1.png"%>"/><img src="<%=imagesPath+"logo_2.png"%>" /></a></div>
		<div class="nav">
			<div class="navItem"><a href="/jump/home/index">首页</a></div>
			<div class="navItem"><a href="/jump/home/searchJob">职位搜索</a></div>
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
			<div class="NavLeftBox active">
				<a href="/jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox">
				<a href="/user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_zwss" class="a3">职位搜索</a>
			</div>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_cai" class="a4">你的菜儿</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/jump/user/personal_sqzw">申请的职位</a></li>
				<li><a href="/jump/user/personal_mygz">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/jump/user/personal_mainshi">面试通知</a></li>
				<li><a href="/jump/user/personal_yaoqing">应聘邀请</a></li>
				<li><a href="/jump/user/personal_whogz">谁在关注我</a></li>
				<li><a href="/jump/user/personal_goutong">在线沟通记录</a></li>
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
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
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
				<div class="PaStatus">
					<span class="spStatus">目前处于离职状态，可即刻上岗</span>
					<span class="btn"></span>
				</div>
				<div class="clear"></div>
				<div class="PaCon">
					<span class="span1">用户名：HEB5_14@your_email.com <a href="personal_renzheng.html" class="a1">[未认证]</a> <a href="personal_updatepsd.html" class="a2">修改密码</a></span>
					<span class="span2">微信： <a href="" class="a1">[未绑定]</a></span><br />
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
		<div class="myJL">
			<div class="titBox">
				<span>我的简历</span>
				<a href="/jump/user/personal_jl">更多操作>></a>
			</div>
			<div class="clear"></div>
			<div class="conBox">
				<div class="box1">
					<a href="/jump/user/personal_jlsee">未完成简历</a>
				</div>
				<div class="box2">
					<div class="Orange"></div>
					<div class="Orangetxt">完整度15%</div>
				</div>
				<div class="box3">
					<span>简历状态：</span>
					<div class="statusjl on"></div>
				</div>
				<div class="box4">
					浏览量：<span>0</span>
				</div>
				<div class="box5">
					<span>更新时间：2017-12-28</span>
				</div>
				<div class="box6">
					<a href="">更新</a> |
					<a href="">预览</a> |
					<a href="">下载</a> |
					<a href="/jump/user/personal_jlsee">修改</a>
				</div>
			</div>
			<div class="conBox">
				<div class="box1">
					<a href="/jump/user/personal_jlsee">未完成简历</a>
				</div>
				<div class="box2">
					<div class="Orange"></div>
					<div class="Orangetxt">完整度15%</div>
				</div>
				<div class="box3">
					<span>简历状态：</span>
					<div class="statusjl on"></div>
				</div>
				<div class="box4">
					浏览量：<span>0</span>
				</div>
				<div class="box5">
					<span>更新时间：2017-12-28</span>
				</div>
				<div class="box6">
					<a href="">更新</a> |
					<a href="">预览</a> |
					<a href="">下载</a> |
					<a href="/jump/user/personal_jlsee">修改</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="adBox">
			<img src="<%=imagesPath+"perAD.jpg"%>" width="814" />
		</div>
		<div class="perRpart2">
			<div class="titBox">
				<span>你的菜儿</span>
				<a href="personal_cai.html">查看更多>></a>
			</div>
			<div class="clear"></div>
			<div class="conBox">
				<div class="conBoxL">
					<p>您还没有在网站上留下足迹哦~，我们暂时无法为您推送合适的菜儿！<br />请容跳跳蛙再观察一番~</p>
				</div>
				<div class="conBoxR">
					<img src="<%=imagesPath+"per2.jpg"%>" />
				</div>
			</div>
		</div>
	</div>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>

<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
</body>
</html>
