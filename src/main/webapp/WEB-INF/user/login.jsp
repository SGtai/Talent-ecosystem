<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-26
  Time: 17:02
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
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="stylesheet" href=<%=cssPath+"login.css"%>>

</head>
<body>
<div class="header">
	<div class="mainwarp">
		<div class="logo"><a href="index.html"><img src=<%=imagesPath+"log.png"%>/></a></div>
		<div class="welcome">欢迎登录</div>
		<div class="headerright">
<%--			<a href="loginCompany.html">企业登录</a>--%>
			<span>|</span>
			<a href="/jump/home/index">返回首页</a>
		</div>
	</div>
</div>
<div class="content">
	<div class="logtype"></div>
	<div class="clear"></div>
	<div class="logoDiv">
		<div class="logoLeft">
			<div class="leftimg">
				<img src="<%=imagesPath+"log1.gif"%>"/>
			</div>
		</div>

		<div class="logoRight">
			<form class="layui-form">
				<div class="normalLogin">
					<div class="username">
						<span></span>
						<input id="phone" name="phone" type="text" placeholder="请输入用户名/邮箱/已验证手机号"/>
					</div>
					<div class="password">
						<span></span>
						<input id="password" name="password" type="text" placeholder="请输入密码"/>
					</div>
					<div class="autoLogo">
						<span class="CheckBox Yes"></span>
						<span>我已阅读并接受<a href="registeragreement.html">用户协议</a></span>
					</div>
					<div class="logobtn">
						<a href="javascript:void(0)" onclick="dologin()" >登  录</a>
					</div>
					<div class="zcbtn">
						<a href="/jump/user/reg">还没有账号？立即注册</a>
					</div>
				</div>
			</form>
		</div>

	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>"/>蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>

<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"loginAndReg.js"%>></script>
</body>
</html>
