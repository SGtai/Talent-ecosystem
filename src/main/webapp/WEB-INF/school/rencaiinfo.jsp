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
						<input class="layui-input" id="test16" type="text" placeholder="开始 到 结束">
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

	<script>
		layui.use(['form','layer','jquery','table','laydate'], function() {
			var table = layui.table;
			var form = layui.form;
			var $ = layui.jquery;
			var layer = layui.layer;
			var laydate = layui.laydate;
			var times = "";
			laydate.render({
				elem: '#test16'
				, type: 'datetime'
				, range: 'to'
				, format: 'yyyy-MM-dd'
				, done: function (value, date) {
					times = value;
				}
			});
			// $('#date').val()+"to"+$('#date1').val();
			table.render({
				elem: '#demo'
				,height: 300
				,width:760
				,limit:5
				,limits:[5,10,15,20]
				,url: '/school/rencaiinfoquery' //数据接口
				,page: true //开启分页
				,even:true
				,cols: [[ //表头
					{field: 'account', title: '账号名', width:150,height:100}
					,{field: 'name', title: '姓名', width:150,height:100}
					,{field: 'zyMajor', title: '专业', width:150,height:100}
					,{field: 'jzstate', title: '就业情况', width: 150,height:100,templet:function (d) {
							if(d.jzstate==="0"){
								return "未就业"
							}
							if(d.jzstate==="1"){
								return "已就业"
							}

						}
					}
					,{field:'opera', width:150, title: '操作',align:'center', toolbar: '#toolbar'}
				]]
				,id:'UserTable'
			});
			$("#query_pa").click(function () {
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

			table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
					,layEvent = obj.event; //获得 lay-event 对应的值

				var account = data.account;
				var state = data.state;
				// 修改状态
				if(layEvent === 'able'){
					layer.confirm('确定要修改该用户状态吗',function (index)
					{
						$.ajax({
							type: 'post'
							, url: ''
							, dataType: 'text'
							, data: {account: account, state:state}
							, success: function (res) {
								// var result = res.toString();
								// if (result == 'true') {
								layer.msg('修改成功');
								// 	window.location.reload();
								// } else {
								// 	layer.msg('修改错误');
								// }
							}
							, error: function (msg) {
								alert("服务器正忙。。。。" + msg);
							}
						});

						layer.close(index);
					});
				}
				// 删除
				if(layEvent === 'delete'){
					layer.confirm('确定要删除该用户吗',function (index)
					{
						$.ajax({
							type: 'post'
							, url: ''
							, dataType: 'text'
							, data: {account: account, state:2}
							, success: function (res) {
								// var result = res.toString();
								// if (result == 'true') {
								layer.msg('修改成功');
								// 	window.location.reload();
								// } else {
								// 	layer.msg('修改错误');
								// }
							}
							, error: function (msg) {
								alert("服务器正忙。。。。" + msg);
							}
						});
						layer.close(index);
					})
				}

				// 重置密码,直接访问修改状态的方法，传入状态为8
				if(layEvent === 'repwd') {
					layer.confirm('确定要对此用户重置密码？',function (index)
					{
						$.ajax({
							type: 'post'
							, url: ''
							, dataType: 'text'
							, data: {account: account, state:8}
							, success: function (res) {
								// var result = res.toString();
								// if (result == 'true') {
								layer.msg('修改成功');
								// 	window.location.reload();
								// } else {
								// 	layer.msg('修改错误');
								// }
							}
							, error: function (msg) {
								alert("服务器正忙。。。。" + msg);
							}
						});
						layer.close(index);
					})



				}


			});




		});

	</script>





</body>
</html>
