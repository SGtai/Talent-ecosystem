<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/16
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 500px;
		}

		#layout {
			width: 35%;
			height: 400px;
			margin: auto;
			margin-top: 100px;
			border: #9F9F9F solid 1px;
		}
		#label1{
			margin-top: -10px;
		}
		#button1{
			margin-left: 38%;
		}
	</style>
</head>
<body>
<div id="layout">
<form class="layui-form" action="" >
	<br>
	<div>
		<h1 align="center">企业立即注册，招聘更多人才</h1>
	</div>
	<br>
	<div class="layui-form-item">
		<label class="layui-form-label">账号</label>
		<div class="layui-input-inline" style="width: 190px">
			<input name="qyAccount" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="qyAccount" >
		</div>
		<div class="layui-form-mid layui-word-aux">请填写6到20位账号</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码</label>
		<div class="layui-input-inline">
			<input name="password" class="layui-input" type="password" placeholder="请输入密码" autocomplete="off" lay-verify="pass">
		</div>
		<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">确认密码</label>
		<div class="layui-input-inline">
			<input name="password2" class="layui-input" type="password" placeholder="请输入密码" autocomplete="off" lay-verify="pass2">
		</div>
		<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label" id="label1">验证统一社会信用代码</label>
		<div class="layui-input-block" style="width:400px">
			<input name="qyData" class="layui-input" type="text" placeholder="请输入统一社会信用代码" autocomplete="off" lay-verify="required|qyData">
		</div>
	</div>
	<div class="layui-form-item" >
		<div class="layui-input-block" id="button1">
			<button class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">注册</button>
			<button class="layui-btn layui-btn-primary" type="reset">重置</button>
		</div>
	</div>
</form>
	<h3 align="center">
		<a href=""  >已有账号，去登录</a>
	</h3>

</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"companylogin.js"%>"></script>

<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
			,layer = layui.layer;

		//自定义验证规则
		form.verify({
			qyAccount: function(value){
				if(value.length ==0){
					return '账号不能为空';
				}
				if(value.length <6||value.length >20){
					return '账号不少得于6位或者超过20位';
				}
				if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
					return '用户名不能有特殊字符';
				}
				if(/(^\_)|(\__)|(\_+$)/.test(value)){
					return '用户名首尾不能出现下划线\'_\'';
				}
				if(/^\d+\d+\d$/.test(value)){
					return '用户名不能全为数字';
				}
			}
			,pass: [
				/^[\S]{6,12}$/
				,'密码必须6到12位，且不能出现空格'
			]
			,pass2: [
				/^[\S]{6,12}$/
				,'密码必须6到12位，且不能出现空格'
			]
			,qyData:function (Code) {

				var patrn = /^[0-9A-Z]+$/;
				//18位校验及大写校验

				if ((Code.length != 18) || (patrn.test(Code) == false)) {
					layer.alert("不是有效的统一社会信用编码！", { icon: 1, offset: "auto", time:2000 });

					return false;

				}  else {
					var Ancode;//统一社会信用代码的每一个值
					var Ancodevalue;//统一社会信用代码每一个值的权重
					var total = 0;
					var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子
					var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';
					//不用I、O、S、V、Z
					for (var i = 0; i < Code.length - 1; i++) {
						Ancode = Code.substring(i, i + 1);
						Ancodevalue = str.indexOf(Ancode);
						total = total + Ancodevalue * weightedfactors[i];
						// 权重与加权因子相乘之和
					}
					var logiccheckcode = 31 - total % 31;
					if (logiccheckcode == 31) {
						logiccheckcode = 0;    }
					var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";
					var Array_Str = Str.split(',');
					logiccheckcode = Array_Str[logiccheckcode];
					var checkcode = Code.substring(17, 18);
					if (logiccheckcode != checkcode) {
						layer.alert("不是有效的统一社会信用编码！", { icon: 1, offset: "auto", time:2000 });
						return false;
					}
					else{
						layer.alert("yes",{ icon: 1, offset: "auto", time:2000 });
					}
				}
			}
		});


		//监听提交
		form.on('submit(demo1)', function(data){
			layer.alert(JSON.stringify(data.field), {
				title: '最终的提交信息'
			});
		});


		// //表单取值
		// layui.$('#LAY-component-form-getval').on('click', function(){
		// 	var data = form.val('example');
		// 	alert(JSON.stringify(data));
		// });

	});
</script>

</body>
</html>
