<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/16
  Time: 20:37
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
<html>
<head>
	<title>菜鸟网后台高校登陆</title>
	<link rel="stylesheet" href=<%=cssPath+"pintuer.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"admin.css"%>>
	<link rel="stylesheet" href="<%=othPath+"layui/css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
	<script src=<%=othPath+"layui/layui.js"%>></script>
</head>
<body>
<%--这个div放的是图片--%>
<div class="bg"></div>
<div class="container" style="position: absolute;margin-left: 5%;margin-top: -5%" >
	<div class="line bouncein">
		<div class="xs6 xm4 xs3-move xm4-move">
			<div style="height:150px;"></div>
			<div class="media media-y margin-big-bottom">
			</div>
			<form action="" method="post">
				<div class="panel loginbox">
					<div class="text-center margin-big padding-big-top"><h1>高校登陆</h1></div>
					<div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="text" class="input input-big" name="name" placeholder="登录账号" data-validate="required:请填写账号" />
								<span class="icon icon-user margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
								<span class="icon icon-key margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field">
								<input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
								<img src=<%=othPath+"images/passcode.jpg"%>; alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">

							</div>
						</div>
					</div>
					<div style="padding:30px;">
						<input type="submit" class="button button-block bg-main text-big input-big" value="登录" style="width: 35%;">
						<input type="button" class="button button-block bg-main text-big input-big" value="返回首页" style="width: 30%;position: absolute;margin-left: 55%;margin-top: -11%">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	// 这里是逻辑判断用户输入是否符合规定，不符合减轻服务器压力

</script>
</body>
</html>
