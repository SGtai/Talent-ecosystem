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
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>菜鸟网后台高校注册</title>
	<link rel="stylesheet" href=<%=cssPath+"pintuer.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"admin.css"%>>
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">

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
					<div class="text-center margin-big padding-big-top"><h1>高校注册</h1></div>
					<div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="text" class="input input-big" name="scAccount" id="scAccount" placeholder="注册账号" data-validate="required:请填写要注册账号" />
								<span class="icon icon-user margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="password" id="password" placeholder="注册密码" data-validate="required:请填写要注册密码" />
								<span class="icon icon-key margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="password" placeholder="再次输入密码" data-validate="required:请再次填写要注册密码" />
								<span class="icon icon-key margin-small"></span>
							</div>
						</div>
					</div>
					<div style="padding:30px;">
						<input type="button" class="button button-block bg-main text-big input-big" value="下一步" style="width: 35%;" onclick="reg1()">
						<input type="button" class="button button-block bg-main text-big input-big" value="返回" style="width: 30%;position: absolute;margin-left: 55%;margin-top: -11%" onclick="">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
<script src=<%=jsPath+"everything.js"%>></script>
<script src=<%=path+"layui.js"%>></script>
<script src=<%=path+"json2.js"%>></script>


</body>
</html>

