<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/18
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
	String dbimgPath =application.getContextPath()+"/images/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>完善企业信息</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height:590px;
		}

		#layout3 {
			width: 50%;
			height: 590px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
		}
		.layui-form-label{
			width: 120px;

		}
		.layui-input{
			width: 250px;
		}
		#button1{
			margin-left: 38%;
		}
	</style>
</head>
<body>
<div id="layout3">
	<form class="layui-form" action="" >
		<input id="qyAccount" type="hidden" value="${sessionScope.Qyinfo.qyAccount}" />
		<div class="layui-upload">
			<button class="layui-btn" id="test1" type="button">上传企业Logo</button>
<%--			<div class="layui-upload-list">--%>
<%--				<img class="layui-upload-img" id="demo1">--%>
<%--				<p id="demoText"></p>--%>
<%--			</div>--%>
			<div class="JlBoxRight" style="text-align:center" >
				<c:if test="${sessionScope.Qyinfo.qyPicture!=null and sessionScope.Qyinfo.qyPicture!=''}">
				<img style="border:1px solid #000" src="<%=dbimgPath%>${sessionScope.Qyinfo.qyPicture}" width="50%" height="180px" />
			</c:if>
			</div>
		</div>
		<br>
		<div>
			<h1 align="center">企业简介</h1>
		</div>
		<br>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"></label>
			<div class="layui-input-inline" style="width:400px;text-align:center">
				<textarea rows="10" name="qyKind" id="qyKind" class="layui-textarea" placeholder="请输入内容">${sessionScope.Qyinfo.qyKind}</textarea>
			</div>
		</div>

		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1">
				<button class="layui-btn" type="submit" lay-filter="reg2" lay-submit="">提交修改</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>

</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script >
	layui.use(['form', 'layer'], function(){
		var form = layui.form
			,layer = layui.layer;
		//监听提交
		form.on('submit(reg2)', function(data){
			var qyAccount=$('#qyAccount').val();
			var qyKind=$('#qyKind').val();
			$.ajax(
				{
					type:"POST",
					url:"/company/doRegQyKind",
					dataType:"text",
					data:{qyAccount:qyAccount,qyKind:qyKind},
					success:function (msg) {
						if (msg==="success"){
							layer.alert("修改成功", { icon: 1, offset: "auto", time:1000 });
						} else{
							layer.alert("修改失败，请重新提交！", { icon: 1, offset: "auto", time:1000 });
						}
					},
					error:function (msg) {
						layer.alert(msg);
					}
				}
			);
			return false;
		});
	});
</script>
<script>
	layui.use('upload', function() {
		var $ = layui.jquery
			, upload = layui.upload;

		//普通图片上传
		var uploadInst = upload.render({
			elem: '#test1'
			, url: '/company/photo' //改成您自己的上传接口
			, before: function (obj) {
				//预读本地文件示例，不支持ie8
				// obj.preview(function (index, file, result) {
				// 	$('#demo1').attr('src', result); //图片链接（base64）
				// });
			}
			, done: function (res) {
				//如果上传失败
				return layer.alert('上传成功',function () {
					window.location.reload();
				});
			}
		});
	})
</script>
</body>
</html>
