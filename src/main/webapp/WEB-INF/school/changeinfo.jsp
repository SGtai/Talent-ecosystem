<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
	String apppath=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改高校信息</title>
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
	<script src=<%=path+"layui.js"%>></script>
	<script src=<%=path+"json2.js"%>></script>
	<style>
		body {
			width: 100%;
			height: 1000px;
		}

		#layout {
			width: 80%;
			height: 850px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;
		}
		.layui-form-label{
			width: 120px;

		}
		.layui-input{
			width: 250px;
			text-align: center;
		}
		.layui-form-select .layui-input{
			width: 100px;
			text-align: center;
		}
		#button1{
			margin-left: 38%;
		}
		.layui-form-item .layui-input-inline {
			float: left;
			width: 100px;
		}
	</style>
</head>
<body>
<div id="layout">
	<form class="layui-form" action="" >
		<div>
			<h1 align="center">修改高校信息</h1>
			<h3 style="color: red">提示:方框打勾默认可编辑可提交修改，不打勾默认不修改</h3>
		</div>
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label" >高校名称：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="scName" id="scName" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.scName} autocomplete="off"  lay-verify="required" maxlength="30"/>
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox"  lay-filter="a1" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label" style="margin-left: 3%">法定代表人：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="scfdMan" id="scfdMan" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.scfdMan} autocomplete="off"  lay-verify="required" maxlength="20" />
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a2" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学校省市位置：</label>
			<div class="layui-input-inline">
				<select name="pro" lay-filter="pro" id="pro" lay-verify="required">
					<option value="">请选择省</option>
					<c:if test="${province!=null}">
						<c:forEach items="${province}" begin="0" var="i">
							<option value="${i.prid}">${i.name}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			<div class="layui-input-inline " style="margin-left: 4%">
				<select name="city" id="city" lay-verify="required">
					<option value="">请选择市</option>
					<c:if test="${city!=null}">
						<c:forEach items="${city}" begin="0" var="i">
							<option value="${i.ctid}">${i.name}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			<label class="layui-form-label" style="margin-left: 4.3%">学校地址：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="scAddress" id="scAddress" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.scAddress} autocomplete="off"   lay-verify="required" maxlength="30" >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a3" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">开办资金：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="kaibanMoney" id="kaibanMoney" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.kaibanMoney} autocomplete="off"   lay-verify="required" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="10">
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a4" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label" style="margin-left: 3%">举办单位：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="jubanDanwei" id="jubanDanwei" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.jubanDanwei} autocomplete="off"  lay-verify="required" maxlength="30" >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a5" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">信用代码：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="xinyongDaima" id="xinyongDaima" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.xinyongDaima} autocomplete="off"  lay-verify="required" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18" >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a6" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label" style="margin-left: 3%">联系方式：</label>
			<div class="layui-input-inline" style="width: 190px">
				<input name="scPhone" id="scPhone" class="layui-input" type="text" placeholder="请输入" value=${requestScope.scinfo.scPhone} autocomplete="off"  lay-verify="required" maxlength="11">
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;margin-left: 2%">
				<input type="checkbox" lay-filter="a7" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">经费来源：</label>
			<div class="layui-input-block">
				<input id="s1" title="国家、政府财政拨款" type="checkbox" value="国家、政府财政拨款">
				<input id="s2" title="收取学杂费" type="checkbox" value="收取学杂费">
				<input id="s3" title="社会或个人赞助、捐助" type="checkbox" value="社会或个人赞助、捐助">
				<input id="s4" title="智力、技术有偿服务" type="checkbox" value="智力、技术有偿服务">
			</div>
			<input type="text" style="display: none" id="jinqianly">
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">学校简介：</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scAbout" id="scAbout" class="layui-textarea" placeholder="请输入内容" maxlength="240">${requestScope.scinfo.scAbout}</textarea>
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: 6%;margin-left: -5%">
				<input type="checkbox" lay-filter="a8" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学校资料：</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="scdata" class="layui-textarea" placeholder="请输入内容" maxlength="240">${requestScope.scinfo.scdata}</textarea>
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: 6%;margin-left: -5%">
				<input type="checkbox" lay-filter="a9" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学校类型：</label>
			<div class="layui-input-inline" >
				<select name="sctype" lay-filter="sctype" id="sctype" lay-verify="required">
					<option value="">请选择学校类型</option>
					<option value="普通高等教育">普通高等教育</option>
					<option value="成人高等教育">成人高等教育</option>
					<option value="高教自学考试">高教自学考试</option>
					<option value="电大开放教育">电大开放教育</option>
					<option value="远程网络教育">远程网络教育</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学校logo：</label>
			<div class="layui-input-block">
				<input type="text" name="file" required="" lay-verify="required" placeholder="文档名称" readonly=""
				       id="filename" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -5%;margin-left: 40%">
				<input type="checkbox" id="a0" lay-filter="a10" checked class="layui-icon-radio">
			</div>
		</div>
		<button type="button" class="layui-btn" id="test2" style="margin-left: 50%; margin-top: -10%">
			<i class="layui-icon">&#xe67c;</i>修改图片
		</button>
		<input class="layui-upload-file" type="file" accept="" name="file">
		<button type="button" class="layui-btn" id="test3" style="margin-top: -10% ">
			<i class="layui-icon"></i>浏览当前高校图片
		</button>
		<div class="layui-form-item" >
			<div class="layui-input-block" id="button1" style="margin-left: 48%">
				<button type="button" class="layui-btn"  id="bb">提交</button>
				<button type="button" class="layui-btn" style="position: absolute;visibility: hidden" id="btn">修改</button>
			</div>
		</div>
		<div id="uploadLoadingDiv">
			<div class="layui-progress" lay-showpercent="true" lay-filter="demo" >
				<div class="layui-progress-bar layui-bg-red" lay-percent=""></div>
			</div>
		</div>
		<script>
			$("#pro").val('${requestScope.scinfo.prid}');
			$("#sctype").val('${requestScope.scinfo.type}');
			$("#city").val('${requestScope.scinfo.ctid}');
		</script>
		<script>
			layui.use(['form', 'layer','element', 'jquery', 'upload'], function () {
				var upload = layui.upload;
				var form = layui.form;
				var $ = layui.jquery;
				var layer = layui.layer;
				var element = layui.element;
				var timer;//定义一个计时器
				form.on('select(pro)', function(data) {
					if(data.value!=""&&data.value!=null){
						$.ajax(
							{
								type:"POST",
								url:'<%=apppath+"school/findcity"%>',
								dataType:"text",
								data:{
									province:data.value
								},
								success:function (msg) {
									var city = $('#city');
									city.empty();
									var arr = JSON.parse(msg);
									city.append("<option value=''>请选择市</option>");
									for (var i = 0; i < arr.length; i++) {
										city.append("<option value='"+arr[i].ctid+"'>"+arr[i].name+"</option>");
									}
									layui.form.render('select');
								},
								error:function (msg) {
									alert("系统忙，请稍等");
								}
							}
						);
					}else{
						var city = $('#city');
						city.empty();
						city.append("<option value=''>请选择市</option>");
						layui.form.render('select')
					}
				});
				//执行实例
				upload.render({
					elem: '#test2' //绑定元素
					, url: '<%=apppath+"school/changeInfo1"%>' //上传接口
					, multiple: false //设置是否多文件上传
					, auto: false  //取消自动上传，并指定提交按钮进行上传
					, bindAction: '#btn' //这个绑定id为btn的按钮触发这个提交
					, accept: 'file' //允许上传的文件类型
					, before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
						this.data = {
							scName:document.getElementById("scName").value,
							scdata:document.getElementById("scdata").value,
							scAddress:document.getElementById("scAddress").value,
							scfdMan:document.getElementById("scfdMan").value,
							moneyLaiyuan:document.getElementById("jinqianly").value,
							kaibanMoney:document.getElementById("kaibanMoney").value,
							jubanDanwei:document.getElementById("jubanDanwei").value,
							xinyongDaima:document.getElementById("xinyongDaima").value,
							scAbout:document.getElementById("scAbout").value,
							scPhone:document.getElementById("scPhone").value,
							prid:$("#pro").val(),
							ctid:$("#city").val(),
							type:$("#sctype").val()
						};
						layer.load(); //上传loading
						var n = 0;
						timer = setInterval(function(){//按照时间随机生成一个小于95的进度，具体数值可以自己调整
							n = n + Math.random()*10|0;
							if(n>95){
								n = 95;
								clearInterval(timer);
							}
							element.progress('demo', n+'%');
						}, 50+Math.random()*100);
					}
					, choose: function (obj) {
						var files = this.files = obj.pushFile();//需要上传的这个文档对象
						obj.preview(function (index, file, result) {
							$("#filename").val(file.name);
						})
					}
					, done: function (msg) {
						if(msg=="0"){
							element.progress('demo', '0%');layer.closeAll();
							alert("修改失败");
						}else if(msg=="-1"){
							element.progress('demo', '0%');layer.closeAll();
							alert("修改失败，手机号码已经被注册");
						}else if(msg=="-2"){
							element.progress('demo', '0%');layer.closeAll();
							alert("修改失败，社会信用代码已经被注册")
						}
						else if(msg=="1"){
							element.progress('demo', '100%');//一成功就把进度条置为100%
							alert("修改成功");
							layer.closeAll();
							var a=document.createElement("a");
							a.href='<%=apppath+"school/changeinfo"%>';
							a.click();
						}
					}
					, error: function () {
						//请求异常回调
					}
				});
			});

		</script>
		<script>
			$('#bb').click(
				function () {
					var scName1=document.getElementById("scName").value;
					var scdata1=document.getElementById("scdata").value;
					var scAddress1=document.getElementById("scAddress").value;
					var scfdMan1=document.getElementById("scfdMan").value;
					var kaibanMoney1=document.getElementById("kaibanMoney").value;
					var jubanDanwei1=document.getElementById("jubanDanwei").value;
					var xinyongDaima1=document.getElementById("xinyongDaima").value;
					var scAbout1=document.getElementById("scAbout").value;
					var scPhone1=document.getElementById("scPhone").value;
					var p=$("#pro").val();
					var c=$("#city").val();
					var type=$("#sctype").val();
					//金钱来源
					var jinqianly="";
					var s1=$("#s1");
					var s2=$("#s2");
					var s3=$("#s3");
					var s4=$("#s4");
					if(s1.is(':checked')){
						jinqianly=jinqianly.concat(s1.val()+"/");
					}
					if(s2.is(':checked')){
						jinqianly=jinqianly.concat(s2.val()+"/");
					}
					if(s3.is(':checked')){
						jinqianly=jinqianly.concat(s3.val()+"/");
					}
					if(s4.is(':checked')){
						jinqianly=jinqianly.concat(s4.val()+"/");
					}
					$("#jinqianly").val(jinqianly);
					//判断是否填写完整
					if(
						scName1.length===0||
						scdata1.length===0||
						scAddress1.length===0||
						scfdMan1.length===0||
						kaibanMoney1.length===0||
						jubanDanwei1.length===0||
						xinyongDaima1.length===0||
						scAbout1.length===0||
						scPhone1===0||
						jinqianly==""||
						p==""||
						c==""||
						type==""
					){
						layer.alert("尊敬的用户，请填写完整内容", {icon: 2, offset: "right", time: 30000});
						return;
					}

					if($("#a6").is(':checked')){
						//判断社会信用代码是否正确
						var patrn = /^[0-9A-Z]+$/;
						//18位校验及大写校验
						if ((xinyongDaima1.length != 18) || (patrn.test(xinyongDaima1) == false))
						{
							layer.alert("不是有效社会信用代码", {icon: 2, offset: "right", time: 30000});
							return;
						}else {
							var Ancode;//统一社会信用代码的每一个值
							var Ancodevalue;//统一社会信用代码每一个值的权重
							var total = 0;
							var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子
							var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';//不用I、O、S、V、Z
							for (var i = 0; i < xinyongDaima1.length - 1; i++) {
								Ancode = xinyongDaima1.substring(i, i + 1);
								Ancodevalue = str.indexOf(Ancode);
								total = total + Ancodevalue * weightedfactors[i];       //权重与加权因子相乘之和
							}
							var logiccheckcode = 31 - total % 31;
							if (logiccheckcode == 31) {
								logiccheckcode = 0;
							}
							var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";
							var Array_Str = Str.split(',');
							logiccheckcode = Array_Str[logiccheckcode];
							var checkcode = xinyongDaima1.substring(17, 18);
							if (logiccheckcode != checkcode) {
								layer.alert("不是有效社会信用代码", {icon: 2, offset: "right", time: 30000});
								return;
							}
						}
					}
					//判断手机号填写是否正确
					if($("#a7").is(':checked')){
						var regBox = {
							regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,   //....邮箱
							regName : /^[a-z0-9_-]{3,16}$/,//....用户名
							regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//....手机
							regTel : /^0[\d]{2,3}-[\d]{7,8}$/ //....电话
						};
						var mflag = regBox.regMobile.test(scPhone1);
						var tflag = regBox.regTel.test(scPhone1);
						if(mflag||tflag) {}else{
							layer.alert("尊敬的用户，您的手机号码填写有误-正确号码如：13x67209xx2或05xx-6090xxx", {icon: 2, offset: "right", time: 30000});
							return;
						}
					}
					//判断是否上传高校logo了
					if($("#a0").is(':checked')){
						if($("#filename").val().length==0){
							layer.alert("尊敬的用户，您还未选择要上传的图片", {icon: 2, offset: "right", time: 30000});
							return;
						}
					}
					if($("#a0").is(':checked')){
						var a = document.getElementById("btn");
						a.click();
					}else{
						$.ajax(
							{
								type:"POST",
								url:'<%=apppath+"school/changeInfo2"%>',
								dataType:"text",
								data:{
									scName:document.getElementById("scName").value,
									scdata:document.getElementById("scdata").value,
									scAddress:document.getElementById("scAddress").value,
									scfdMan:document.getElementById("scfdMan").value,
									moneyLaiyuan:document.getElementById("jinqianly").value,
									kaibanMoney:document.getElementById("kaibanMoney").value,
									jubanDanwei:document.getElementById("jubanDanwei").value,
									xinyongDaima:document.getElementById("xinyongDaima").value,
									scAbout:document.getElementById("scAbout").value,
									scPhone:document.getElementById("scPhone").value,
									scpicture:document.getElementById("filename").value,
									prid:$("#pro").val(),
									ctid:$("#city").val(),
									type:$("#sctype").val()
								},
								success:function (msg) {
									if(msg=="0"){
										alert("修改失败");
									}else if(msg=="-1"){
										alert("修改失败，手机号码已经被注册");
									}else if(msg=="-2"){
										alert("修改失败，社会信用代码已经被注册")
									}else if(msg=="1"){
										alert("修改成功");
										var a=document.createElement("a");
										a.href='<%=apppath+"school/changeinfo"%>';
										a.click();
									}
								},
								error:function (msg) {
									alert("系统忙，请稍等");
								}
							}
						);
					}


				}
			);
		</script>
		<script>
			layui.use(['form'], function () {
				var $ = layui.$; //Jquery,
				var form = layui.form;//表单
				form.on('checkbox(a1)', function(data){
					if (data.elem.checked) {
						$("#scName").attr("disabled", false )
					}else {
						$("#scName").val('${requestScope.scinfo.scName}');
						$("#scName").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a2)', function(data){
					if (data.elem.checked) {
						$("#scfdMan").attr("disabled", false )
					}else {
						$("#scfdMan").val('${requestScope.scinfo.scfdMan}');
						$("#scfdMan").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a3)', function(data){
					if (data.elem.checked) {
						$("#scAddress").attr("disabled", false )
					}else {
						$("#scAddress").val('${requestScope.scinfo.scAddress}');
						$("#scAddress").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a4)', function(data){
					if (data.elem.checked) {
						$("#kaibanMoney").attr("disabled", false )
					}else {
						$("#kaibanMoney").val('${requestScope.scinfo.kaibanMoney}');
						$("#kaibanMoney").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a5)', function(data){
					if (data.elem.checked) {
						$("#jubanDanwei").attr("disabled", false )
					}else {
						$("#jubanDanwei").val('${requestScope.scinfo.jubanDanwei}');
						$("#jubanDanwei").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a6)', function(data){
					if (data.elem.checked) {
						$("#xinyongDaima").attr("disabled", false )
					}else {
						$("#xinyongDaima").val('${requestScope.scinfo.xinyongDaima}');
						$("#xinyongDaima").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a7)', function(data){
					if (data.elem.checked) {
						$("#scPhone").attr("disabled", false )
					}else {
						$("#scPhone").val('${requestScope.scinfo.scPhone}');
						$("#scPhone").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a8)', function(data){
					if (data.elem.checked) {
						$("#scAbout").attr("disabled", false )
					}else {
						$("#scAbout").val('${requestScope.scinfo.scAbout}');
						$("#scAbout").attr("disabled", "disabled" )
					}
				});
				form.on('checkbox(a9)', function(data){
					if (data.elem.checked) {
						$("#scdata").attr("disabled", false )
					}else {
						$("#scdata").val('${requestScope.scinfo.scdata}');
						$("#scdata").attr("disabled", "disabled" )
					}
				});
			});
			$("#jinqianly").val('${requestScope.scinfo.moneyLaiyuan}');
			var jinqianly=$("#jinqianly").val();
			var arr=jinqianly.split("/");
			for (var i = 0; i < arr.length; i++) {
				if(arr[i]==="国家、政府财政拨款"){
					$("#s1").attr('checked','checked');
				}
				if(arr[i]==="收取学杂费"){
					$("#s2").attr('checked','checked');
				}
				if(arr[i]==="社会或个人赞助、捐助"){
					$("#s3").attr('checked','checked');
				}
				if(arr[i]==="智力、技术有偿服务"){
					$("#s4").attr('checked','checked');
				}
			}
		</script>
	</form>
</div>
</body>
</html>