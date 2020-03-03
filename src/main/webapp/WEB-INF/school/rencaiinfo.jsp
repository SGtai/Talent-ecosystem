<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文件上传系统后台</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
	<script src=<%=path+"layui.js"%>></script>
	<script src=<%=path+"json2.js"%>></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="table_pa"></table>
<script type="text/html" id="toolbar">
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">查看</a>
	<a class="layui-btn layui-btn-sm background-style" lay-event="able1">修改</a>
</script>
<div id="di">
	<form class="layui-form">
		<h1 style="margin-left: 40%">人才信息查询</h1>

		<div style="margin-left: 15%;margin-top: 1%">
			<div class="layui-form-item">
				<div class="layui-inline" style="margin-left: 3%">
					<label class="layui-form-label">姓名 ：</label>
					<div class="layui-input-inline">
						<input name="name" id="name" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline" style="margin-left: -5%">
					<label class="layui-form-label">专业 ：</label>
					<div class="layui-input-inline">
						<input name="zy" id="zy" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daochu" type="button">导出人才</button>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daoru" type="button">导入人才</button>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline" style="margin-left: 3%">
					<label class="layui-form-label">请选择范围</label>
						<div class="layui-input-inline">
							<input type="text" name="start_time" class="layui-input" id="start_time"
							       placeholder="开始时间">
						</div>
						<div class="layui-input-inline">
							<input type="text" name="end_time" class="layui-input" id="end_time"
							       placeholder="结束时间">
						</div>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa" type="button">搜索</button>

				</div>
				<div class="layui-inline">
					<button style="margin-left: 20%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_shuaxin" type="button">刷新</button>
				</div>
			</div>
		</div>
	</form>
	<div style="margin-left: 20%;margin-top: -2%"><table id="demo" lay-filter="table_pa"></table></div>

	<%--人才简历--%>
	<div id="mydiv" style="display: none ; padding: 10px;margin-left: 10%">
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" id="hide1"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">学校名称</label>
			<div class="layui-input-inline">
				<input type="text" id="hide2"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">出生年月</label>
			<div class="layui-input-inline">
				<input type="text" id="hide3"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">专业</label>
			<div class="layui-input-inline">
				<input type="text" id="hide4"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">政治面貌</label>
			<div class="layui-input-inline">
				<input type="text" id="hide5"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">学历</label>
			<div class="layui-input-inline">
				<input type="text" id="hide6"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" id="hide7"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">住址</label>
			<div class="layui-input-inline">
				<input type="text" id="hide8"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<img  src="\schoolS\cunchu\logo\555555\jmgz.jpg" alt="" style="width: 20%;height: 20%;margin-left: 70%;margin-top: -30%">
		<div  class="layui-form-item">
			<label class="layui-form-label" style="margin-left: -5%">学习经历</label>
			<table class="layui-table" style="margin-left: -5%">
				<col width="200">
				<col width="200">
				<col width="200">
				<thead>
				<tr>
					<th>时间</th>
					<th>学校</th>
					<th>专业</th>
				</tr>
				</thead>
				<tbody id="ex">
				<tr>
					<td>无</td>
					<td>无</td>
					<td>无</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div  class="layui-form-item">
			<label class="layui-form-label" style="margin-left: -5%">工作经历</label>
			<table class="layui-table" style="margin-left: -5%">
				<col width="200">
				<col width="200">
				<col width="200">
				<thead>
				<tr>
					<th>时间</th>
					<th>公司</th>
					<th>工作内容</th>
				</tr>
				</thead>
				<tbody id="gz">
				<tr>
					<td>无</td>
					<td>无</td>
					<td>无</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">技能证书</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="hide9" class="layui-textarea" placeholder="请输入内容" maxlength="240" disabled></textarea>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">自我评价</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="hide10" class="layui-textarea" placeholder="请输入内容" maxlength="240" disabled></textarea>
			</div>
		</div>
	</div>

<%--	个人简历修改--%>
	<div id="mydiv1" style="display: none ; padding: 10px;margin-left: 10%">
		<form class="layui-form">
			<div>
				<h1 align="center" style="margin-left: -15%">修改简历信息</h1>
				<h3 style="color: red;margin-left: -10%" >提示:方框打勾默认可编辑可提交修改，不打勾默认不修改</h3>
			</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" id="usename"  autocomplete="off" class="layui-input" >
				<input type="hidden" id="usename1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%">
				<input type="checkbox" id="a1" lay-filter="a1" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label">出生年月</label>
			<div class="layui-input-inline">
				<input type="text" id="birth"  autocomplete="off" class="layui-input" >
				<input type="hidden" id="birth1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%">
				<input type="checkbox" id="a2" lay-filter="a2" checked class="layui-icon-radio">
			</div>

		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">住址</label>
			<div class="layui-input-inline">
				<input type="text" id="address"  autocomplete="off" class="layui-input">
				<input type="hidden" id="address1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%">
				<input type="checkbox" id="a3" lay-filter="a3" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label">专业</label>
			<div class="layui-input-inline">
				<input type="text" id="zhuanye"  autocomplete="off" class="layui-input" >
				<input type="hidden" id="zhuanye1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%">
				<input type="checkbox" id="a4" lay-filter="a4" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">政治面貌</label>
			<div class="layui-input-inline">
				<input type="text" id="mm"  autocomplete="off" class="layui-input" >
				<input type="hidden" id="mm1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%;">
				<input type="checkbox" id="a5" lay-filter="a5" checked class="layui-icon-radio">
			</div>
			<label class="layui-form-label">学历</label>
			<div class="layui-input-inline">
				<input type="text" id="xl"  autocomplete="off" class="layui-input" >
				<input type="hidden" id="xl1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: -1%">
				<input type="checkbox" id="a6" lay-filter="a6" checked class="layui-icon-radio">
			</div>
		</div>

		<img  src="\schoolS\cunchu\logo\555555\jmgz.jpg" alt="" style="width: 20%;height: 20%;margin-left: 70%;margin-top: -30%">
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">技能证书</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="jn" class="layui-textarea" placeholder="请输入内容" maxlength="240"></textarea>
				<input type="hidden" id="jn1"  autocomplete="off" class="layui-input" hidden >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: 2%;margin-left: 0%">
				<input type="checkbox" id="a7" lay-filter="a7" checked class="layui-icon-radio">
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">自我评价</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="pp" class="layui-textarea" placeholder="请输入内容" maxlength="240"></textarea>
				<input type="hidden" id="pp1"  autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux" style="margin-top: 2%;margin-left: 0%">
				<input type="checkbox" id="a8" lay-filter="a8" checked class="layui-icon-radio">
			</div>
		</div>
		</form>
	</div>
	<%--	人才批量导入面板--%>
	<div id="daorumb" style="display: none ; padding: 10px;margin-left: 10%">
		<div class="layui-form-item">
			<label class="layui-form-label">模板下载</label>
			<div class="layui-inline">
				<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" onclick="downloadTemp()">下载模板</button>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="margin-left: 0%">批量上传</label>
			<div class="layui-inline">
				<input class="layui-upload-file" type="file" accept="" name="file" readonly>
				<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" id="test2" style="margin-left: 0%; margin-top: -0%">
					<i class="layui-icon">&#xe67c;</i>选择文件
				</button>
			</div>
			<div class="layui-inline">
				<input type="text" name="file" required="" lay-verify="required" placeholder="文档名称" readonly=""
				       id="filename" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-inline">
				<button type="button" class="layui-btn"  id="bb">提交</button>
				<button type="button" class="layui-btn" style="position: absolute;visibility: hidden" id="btn">修改</button>
			</div>
		</div>
	</div>
	<script>
		layui.use(['form','layer','jquery','table','laydate','upload'], function() {
			var table = layui.table;
			var form = layui.form;
			var $ = layui.jquery;
			var layer = layui.layer;
			var laydate = layui.laydate;
			var upload = layui.upload;
			var nowTime = new Date().valueOf();
			var max = null;
			//上传文件
			upload.render({
				elem: '#test2' //绑定元素
				, url: '/school/daoru' //上传接口
				, multiple: false //设置是否多文件上传
				, auto: false  //取消自动上传，并指定提交按钮进行上传
				, bindAction: '#btn' //这个绑定id为btn的按钮触发这个提交
				, accept: 'file' //允许上传的文件类型
				,exts:'xls|xlsx'
				, before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
					this.data = {

					}
				}
				, choose: function (obj) {
					var files = this.files = obj.pushFile();//需要上传的这个文档对象
					obj.preview(function (index, file, result) {
						$("#filename").val(file.name);
					})
				}
				, done: function (json) {
					if(json.msg=="fail1"){
						alert("文件不存在或者格式错误");
					}else if(json.msg=="fail2"){
						alert("上传文件超过10M")
					}else if(json.msg=="fail3"){
						alert("上传文件不是xsl文件");
					}else {
						alert("上传成功");
					}
				}
				, error: function () {
					//请求异常回调
				}
			});
			//日期显示
			var start = laydate.render({
				elem: '#start_time',
				type: 'datetime',
				max: nowTime,
				btns: ['clear', 'confirm'],
				done: function(value, date){
					endMax = end.config.max;
					end.config.min = date;
					end.config.min.month = date.month -1;
				}
			});
			var end = laydate.render({
				elem: '#end_time',
				type: 'datetime',
				max: nowTime,
				done: function(value, date){
					if($.trim(value) == ''){
						var curDate = new Date();
						date = {'date': curDate.getDate(), 'month': curDate.getMonth()+1, 'year': curDate.getFullYear()};
					}
					start.config.max = date;
					start.config.max.month = date.month -1;
				}
			});
			//表格
			var ins1=table.render({
				elem: '#demo'
				,height: 300
				,width:760
				,limit:5
				,limits:[5,10,15,20]
				,url: '/school/rencaiinfoquery' //数据接口
				,page: true //开启分页
				,even:true
				,cols: [[ //表头
					{field: 'phone', title: '电话/账号', width: 150,height:100}
					,{field: 'name', title: '姓名', width:150,height:100}
					,{field: 'zy', title: '专业', width:150,height:100}
					,{field: 'jzstate', title: '就业情况', width: 150,height:100}
					,{field:'opera', width:150, title: '操作',align:'center', toolbar: '#toolbar'}
					,{field: 'mmFace', title: '政治面貌', width: 50,hide:true}
					,{field: 'birthday', title: '出生日期', width: 50,hide:true}
					,{field: 'byschool', title: '学校', width: 50,hide:true}
					,{field: 'xl', title: '学历', width: 50,hide:true}
					,{field: 'jzdResidence', title: '住址', width: 50,hide:true}
					,{field: 'zsCertificate', title: '技能证书', width: 50,hide:true}
					,{field: 'pjEvaluation', title: '自我评价', width: 50,hide:true}
				]]
				,done: function (res, curr, count) {
					exportData=res.data;
				}
				,id:'UserTable'
			});
			$("#daochu").click(function(res,curr,count){
				table.exportFile(ins1.config.id,exportData, 'xls');
			});
			//搜索
			$("#query_pa").click(function () {
				var a=$("#start_time").val();
				var b=$("#end_time").val();
				var times=$("#start_time").val()+"to"+$("#end_time").val();
				if(a!=""&&a!=null||b!=""&&b!=null){
					if(a==""||a==null||b==""||b==null){
						alert("日期格式未填写完整");
						return;
					}
				}
				table.reload('UserTable',{
					url:'/school/rencaiinfoquery'
					,where: { //设定异步数据接口的额外参数，任意设
						name: $('#name').val(),
						time:times,
						zy:$('#zy').val()
					}
					,page: {
						curr: 1 //重新从第 1 页开始
					}
				});
			});
			//查看简历
			table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
					,layEvent = obj.event; //获得 lay-event 对应的值
				$("#hide1").val(data.name);
				$("#hide2").val(data.byschool);
				$("#hide3").val(data.birthday);
				$("#hide4").val(data.zy);
				$("#hide5").val(data.mmFace);
				$("#hide6").val(data.xl);
				$("#hide7").val(data.phone);
				$("#hide8").val(data.jzdResidence);
				$("#hide9").val(data.zsCertificate);
				$("#hide10").val(data.pjEvaluation);

				$("#usename").val(data.name);
				$("#birth").val(data.birthday);
				$("#zhuanye").val(data.zy);
				$("#mm").val(data.mmFace);
				$("#xl").val(data.xl);
				$("#address").val(data.jzdResidence);
				$("#jn").val(data.zsCertificate);
				$("#pp").val(data.pjEvaluation);

				$("#usename1").val(data.name);
				$("#birth1").val(data.birthday);
				$("#zhuanye1").val(data.zy);
				$("#mm1").val(data.mmFace);
				$("#xl1").val(data.xl);
				$("#address1").val(data.jzdResidence);
				$("#jn1").val(data.zsCertificate);
				$("#pp1").val(data.pjEvaluation);
				$.ajax(
					{
						type:"POST",
						url:"/school/exgz",
						dataType:"text",
						data:{
							account:data.account
						},
						success:function (msg) {
							var arr = JSON.parse(msg);
							// alert(arr.experiences[0].zyMajor);
							$("#ex").children().empty();
							$("#gz").children().empty();
							if(arr.experiences.length!=0){
								for (var i = 0; i < arr.experiences.length; i++) {
									$("#ex").append("<tr><td>"+arr.experiences[i].sxSchooltime+"</td><td>"+arr.experiences[i].school+"</td><td>"+arr.experiences[i].zyMajor+"</td></tr>");
								}
							}else{
								$("#ex").append("<tr><td>无</td><td>无</td><td>无</td></tr>");
							}
							if(arr.undergos.length!=0){
								for (var i = 0; i < arr.undergos.length; i++) {
									$("#gz").append("<tr><td>"+arr.undergos[i].ksTime+"</td><td>"+arr.undergos[i].jzUnit+"</td><td>"+arr.undergos[i].zwPosition+"</td></tr>");
								}
							}else{
								$("#gz").append("<tr><td>无</td><td>无</td><td>无</td></tr>");
							}
							layui.form.render('table');
						},
						error:function (msg) {
							alert("系统忙，请稍等");
						}
					}
				);
				// 查看简历
				if(layEvent === 'able'){

					layer.open({

						type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

						title:"个人简历(简略)",// title - 标题

						content:$("#mydiv"),// content - 内容

						skin:'layui-layer-molv',// skin - 样式类名

						area:['1000px','400px'],// area - 宽高

						offset:'auto',// offset - 坐标

						icon:1,//只对type=0的有效 icon - 图标。信息框和加载层的私有参数


						btnAlign: 'c',//按钮居中对齐

						shadeClose:true,
						// time:5000,//time - 自动关闭所需毫秒

						anim:5,//anim - 弹出动画 渐显

						resize:false,//resize - 是否允许拉伸

						maxmin:false, //是否显示最大化和最小化的按钮 对type=1 type=2有效

						success:function () {

						}

					})
				}

				if(layEvent === 'able1'){

					layer.open({

						type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

						title:"个人简历修改",// title - 标题

						content:$("#mydiv1"),// content - 内容

						skin:'layui-layer-molv',// skin - 样式类名

						area:['1000px','400px'],// area - 宽高

						offset:'auto',// offset - 坐标

						icon:1,//只对type=0的有效 icon - 图标。信息框和加载层的私有参数


						btnAlign: 'c',//按钮居中对齐

						// time:5000,//time - 自动关闭所需毫秒

						anim:5,//anim - 弹出动画 渐显

						resize:false,//resize - 是否允许拉伸

						maxmin:false, //是否显示最大化和最小化的按钮 对type=1 type=2有效

						btn: ['修改','关闭'],
						btn1: function(){
							layer.confirm('确认修改该生信息吗?', {
									btn: ['是', '否'], btn1: function (index) {
											layer.close(index);
									$.ajax(
										{
											type:"POST",
											url:"/school/cguserinfo",
											dataType:"text",
											data:{
												username:$("#usename").val(),
												school:$("#school").val(),
												birth:$("#birth").val(),
												zhuanye:$("#zhuanye").val(),
												mm:$("#mm").val(),
												xl:$("#xl").val(),
												address:$("#address").val(),
												jn:$("#jn").val(),
												pp:$("#pp").val()
											},
											success:function (msg) {

											},
											error:function (msg) {
												alert("系统忙，请稍等");
											}
										}
									);
									}
								}
							)
						},
						success:function () {

						}

					})
				}
			});
			//导入人才面板
			$("#daoru").click(function () {
				layer.open({

					type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

					title:"人才批量导入",// title - 标题

					content:$("#daorumb"),// content - 内容

					skin:'layui-layer-molv',// skin - 样式类名

					area:['700px','200px'],// area - 宽高

					offset:'auto',// offset - 坐标

					icon:1,//只对type=0的有效 icon - 图标。信息框和加载层的私有参数


					btnAlign: 'c',//按钮居中对齐

					shadeClose:true,
					// time:10000,//time - 自动关闭所需毫秒

					anim:5,//anim - 弹出动画 渐显

					resize:false,//resize - 是否允许拉伸

					maxmin:false, //是否显示最大化和最小化的按钮 对type=1 type=2有效

					success:function () {

					}

				})
			});



		});

	</script>
	<script>

		function downloadTemp(){
			window.location="/schoolS/cunchu/简历模板.xls";
			// window.open("/schoolS/cunchu/简历模板.xls");
			// $.ajax(
			// 	{
			// 		type:"POST",
			// 		url:"/school/xiazaimoban",
			// 		dataType:"text",
			// 		success:function (msg) {
			// 			alert("模板已经下载到C盘")
			// 		},
			// 		error:function (msg) {
			// 			alert("系统忙，请稍等");
			// 		}
			// 	}
			// );
		}
		$('#bb').click(
			function () {
				var f=$("#filename").val();
				if (f!=null&&f!="") {
					var a = document.getElementById("btn");
					a.click();
				}else{
					alert("您还未选择要提交的excel文件");
				}
			});
		$('#query_shuaxin').click(function () {
			$(".layui-laypage-btn")[0].click();
		});
	</script>
	<script>
		layui.use(['form'], function () {
			var $ = layui.$; //Jquery,
			var form = layui.form;//表单
			form.on('checkbox(a1)', function(data){
				if (data.elem.checked) {
					$("#usename").attr("disabled", false )
				}else {
					$("#usename").val($("#usename1").val());
					$("#usename").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a2)', function(data){
				if (data.elem.checked) {
					$("#birth").attr("disabled", false )
				}else {
					$("#birth").val($("#birth1").val());
					$("#birth").attr("disabled", "disabled" )
				}

			});
			form.on('checkbox(a3)', function(data){
				if (data.elem.checked) {
					$("#address").attr("disabled", false )
				}else {
					$("#address").val($("#address1").val());
					$("#address").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a4)', function(data){
				if (data.elem.checked) {
					$("#zhuanye").attr("disabled", false )
				}else {
					$("#zhuanye").val($("#zhuanye1").val());
					$("#zhuanye").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a5)', function(data){
				if (data.elem.checked) {
					$("#mm").attr("disabled", false )
				}else {
					$("#mm").val($("#mm1").val());
					$("#mm").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a6)', function(data){
				if (data.elem.checked) {
					$("#xl").attr("disabled", false )
				}else {
					$("#xl").val($("#xl1").val());
					$("#xl").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a7)', function(data){
				if (data.elem.checked) {
					$("#jn").attr("disabled", false )
				}else {
					$("#jn").val($("#jn1").val());
					$("#jn").attr("disabled", "disabled" )
				}
			});
			form.on('checkbox(a8)', function(data){
				if (data.elem.checked) {
					$("#pp").attr("disabled", false )
				}else {
					$("#pp").val($("#pp1").val());
					$("#pp").attr("disabled", "disabled" )
				}
			});
		});


	</script>



</body>
</html>