<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String appPath = application.getContextPath()+"/";
	String  cssPath = application.getContextPath()+ "/back/css/";
	String  jsPath = application.getContextPath()+ "/back/js/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文件上传系统后台</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=appPath+"layui/css/layui.css"%>" media="all">
	<link rel="stylesheet" href=<%=cssPath+"userquery.css"%>>
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js"%> ></script>
	<script src=<%=appPath+"layui/layui.js"%>></script>
	<script src=<%=jsPath+"userquery.js"%>></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="table_pa"></table>
<script type="text/html" id="toolbar">
	{{# if(d.state == 0){  }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">禁用</a>
	{{# }else if(d.state == 1){             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">启用</a>
	{{# }else if(d.state == 2){             }}

	{{#      }      }}
</script>
<script type="text/html" id="toolbar1">
	{{# if(d.statusid == 2){  }}

	{{# }else{             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="delete">删除</a>
	{{#      }      }}
</script>
<script type="text/html" id="toolbar2">
	{{# if(d.statusid == 2){  }}

	{{# }else{             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="repwd">重置密码</a>
	{{#      }      }}
</script>
<div id="di">
	<form class="layui-form">
		<h2>后台用户管控</h2>
		<div class="layui-form-item" >
			<div class="layui-inline">
				<label class="layui-form-label">请选择范围</label>
				<div class="layui-input-inline">
					<input class="layui-input" id="test16" type="text" placeholder="开始 到 结束">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label" >用户名 ：</label>
				<div class="layui-input-inline">
					<input name="user_name" id="user_name" class="layui-input" type="text" autocomplete="off">
				</div>
			</div>

			<button class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa"  type="button">查询</button>
		</div>
	</form>
	<table id="demo" lay-filter="table_pa"></table><div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" lay-id="demo" style=" height:320px;width: 82%;"><div class="layui-table-box"><div class="layui-table-header"><table class="layui-table" cellspacing="0" cellpadding="0" border="0"><thead><tr><th data-field="username" data-key="1-0-0" class=""><div class="layui-table-cell laytable-cell-1-0-0"><span>用户名</span></div></th><th data-field="sex" data-key="1-0-1" class=""><div class="layui-table-cell laytable-cell-1-0-1"><span>注册时间</span></div></th><th data-field="city" data-key="1-0-2" class=""><div class="layui-table-cell laytable-cell-1-0-2"><span>积分</span></div></th><th data-field="sign" data-key="1-0-3" class=""><div class="layui-table-cell laytable-cell-1-0-3"><span>上传文档数</span></div></th><th data-field="experience" data-key="1-0-4" class=" layui-unselect"><div class="layui-table-cell laytable-cell-1-0-4"><span>下载文档数</span><span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc" title="升序"></i><i class="layui-edge layui-table-sort-desc" title="降序"></i></span></div></th><th data-field="score" data-key="1-0-5" class=""><div class="layui-table-cell laytable-cell-1-0-5"><span>用户状态</span></div></th></tr></thead></table></div><div class="layui-table-body layui-table-main" style="height: 230px;"><table class="layui-table" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table><div class="layui-none">数据接口请求异常：error</div></div></div><style>.laytable-cell-1-0-0{ width: 150px; }.laytable-cell-1-0-1{ width: 150px; }.laytable-cell-1-0-2{ width: 150px; }.laytable-cell-1-0-3{ width: 150px; }.laytable-cell-1-0-4{ width: 150px; }.laytable-cell-1-0-5{ width: 150px; }</style></div>
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
			table.render({
				elem: '#demo'
				,height: 300
				,width:1008
				,limit:5
				,limits:[5,10,15,20]
				,url: '<%=appPath+"admin/userquery.action"%>' //数据接口
				,page: true //开启分页
				,even:true
				,cols: [[ //表头
					{field: 'account', title: '用户名', width:90,height:100}
					,{field: 'regtime', title: '注册时间', width:250,height:100}
					,{field: 'allintegral', title: '积分', width:90,height:100}
					,{field: 'uploadtime', title: '上传文档数', width: 90,height:100}
					,{field: 'downloadtime', title: '下载文档数', width: 90,height:100}
					,{field: 'state', title: '用户状态', width: 90,height:100,templet:function (d) {
							if(d.state==="0"){
								return "启用"
							}
							if(d.state==="1"){
								return "禁用"
							}
							if(d.state==="2"){
								return "已删除"
							}
						}
					},
					{field:'opera', width:100, title: '操作',align:'center', toolbar: '#toolbar'}
					,{field:'delete', width:100, title: '删除',align:'center', toolbar: '#toolbar1'}
					,{field:'repwd', width:100, title: '重置密码',align:'center', toolbar: '#toolbar2'}

				]]
				,id:'UserTable'
			});
			$("#query_pa").click(function () {
				table.reload('UserTable',{
					url:'<%=appPath+"admin/userquery.action"%>'
					,where: { //设定异步数据接口的额外参数，任意设
						account: $('#user_name').val(),
						time:times
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
							, url: '<%=appPath+"admin/usercontrol.action"%>'
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
							, url: '<%=appPath+"admin/usercontrol.action"%>'
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
							, url: '<%=appPath+"admin/usercontrol.action"%>'
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
</div>
</body>
</html>
