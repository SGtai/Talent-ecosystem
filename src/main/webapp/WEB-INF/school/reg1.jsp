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
	<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
	<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
	<script src=<%=path+"layui.js"%>></script>
	<script src=<%=path+"json2.js"%>></script>

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
								<input type="text" class="input input-big" name="scAccount" id="scAccount" placeholder="注册账号" data-validate="required:请填写要注册账号" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="12" />
								<span class="icon icon-user margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="password" id="password1" placeholder="注册密码" data-validate="required:请填写要注册密码" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="12"/>
								<span class="icon icon-key margin-small"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="password" id="password2" placeholder="再次输入密码" data-validate="required:请再次填写要注册密码" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="12" />
								<span class="icon icon-key margin-small"></span>
							</div>
						</div>
					</div>
					<div style="padding:30px;">
						<input type="button" class="button button-block bg-main text-big input-big" value="下一步" style="width: 35%;" onclick="reg1()">
						<input type="button" class="button button-block bg-main text-big input-big" value="返回" style="width: 30%;position: absolute;margin-left: 55%;margin-top: -11%" onclick="back()">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	// 注册1
	function reg1() {
		var acc=document.getElementById("scAccount").value;
		var pass=document.getElementById("password1").value;
		var nextpass=document.getElementById("password2").value;
		if(acc.length<6||pass.length<6||acc.length>12||pass.length>12){
			alert("注册的账户、密码不能低于6位，高于12位")
		}else{
			if(pass===nextpass){
				$.ajax(
					{
						type:"POST",
						url:"/school/reg1",
						dataType:"text",
						data:{scAccount:acc,password:pass},
						success:function (msg) {
							if(msg==="0"){
								alert("注册失败，该账号已经存在");
							}else if(msg==="1"){
								$("#scAccount").val("");
								$("#password1").val("");
								$("#password2").val("");
								var a=document.createElement("a");
								a.href="/jump/school/reg2";
								a.click();
							}
						},
						error:function (msg) {
							alert("系统忙，请稍等");
						}
					}
				);
			}else{
				alert("尊敬的用户，您两次输入密码不一致，请重新输入");

			}
		}
		$("#password1").val("");
		$("#password2").val("");
	}
	function back() {
		var returnlogin = document.createElement("a");
		returnlogin.href="/jump/school/reg1";
		returnlogin.click();
	}

</script>




</body>
</html>

