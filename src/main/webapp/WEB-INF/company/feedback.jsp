<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/28
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<html>
<head>
	<title>反馈情况查看</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>>
	<link href ="favicon.ico" rel="shortcut icon">
	<style>
		.layui-table-cell{
			height:25px;
			line-height:25px;
		}
	</style>
</head>
<body>
<input id="qyid" type="hidden" value="${sessionScope.Qyinfo.qyid}" />
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
	<h1  style="background-color: #95877c;font-weight:bold;text-align:center">反馈情况</h1>
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">反馈情况：</label>
			<div class="layui-input-inline">
				<select name="paid" id="paid" lay-filter="choosePosition"  >
					<option value="0" >请选择状态</option>
					<option  value="12">等待回复</option>
					<option  value="13">接受面试</option>
					<option  value="14">已应聘</option>
				</select>
			</div>
		</div>

		<div class="layui-inline">
			<button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
		</div>
	</div>
</form>
<table id="demo" lay-filter="test"></table>

<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>

<script type="text/html" id="barDemo">
	<button lay-event="detail" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i
			class="layui-icon">&#xe63c;</i>
		查看简历
	</button>
	<button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		应聘
	</button>
</script>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery','table'], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;

		//第一个实例
		table.render({
			elem: '#demo'
			, height: 280
			, url: "/company/feedback" //数据接口
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				{field: 'jlId', title: 'jlId', width: 80,hide: true}
				, {field: 'yhId', title: 'yhId', width:80,hide: true}
				, {field: 'cxrzId', title: 'cxrzId', width:80,hide: true}
				, {field: 'zpxxid', title: 'zpxxid', width:80,hide: true}
				, {field: 'paid', title: 'paid', width:80}
				// , {field: 'type', title: '应聘行业', width: 150}
				// , {field: 'postion', title: '应聘岗位', width: 200}
				, {field: 'yhname', title: '名字', width: 150}
				, {field: 'byschool', title: '毕业院校', width: 200}
				, {field: 'xl', title: '学历', width: 120, sort: true}
				, {field: 'zy', title: '专业', width: 170}
				, {field: 'ckTime', title: '操作时间', width: 200, sort: true}
				, {field: 'feedback', title: '反馈情况', width: 150, sort: true}
				, {fixed: 'right', width: 320, align: 'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			, id: 'table1'
		});

		form.on('submit(search)', function (data) {
			var paid=$('#paid').val();
			alert(paid);
			table.reload('table1', {
				url: "/company/feedback"
				, where: { //设定异步数据接口的额外参数，任意设
					paid: paid
				}
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			//查看简历
			if(layEvent === 'detail'){
				window.location.href="/company/yulan?jlid="+data.jlId
			}
			//应聘
			else if(layEvent === 'update'){
				if(data.feedback==='等待回复'){
					layer.msg('尚未完成面试无法应聘');
					return false;
				}else if(data.feedback==='已应聘'){
					layer.msg('已应聘');
					return false;
				}else {
					var cxrzId=data.cxrzId;
					var zpxxid=data.zpxxid;
					$.ajax({
						type:"POST",
						url:"/company/yingpin",
						dataType:"text",
						data:{cxrzId:cxrzId,zpxxid:zpxxid},
						//从servlet接收的数据
						success:function (msg) {
							if (msg ==='success') {
								alert("应聘成功！");
								$(".layui-laypage-btn")[0].click();
								//招聘人数加1

							} else {
								layer.msg("应聘失败,已招满!")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});
				}
			} else if(layEvent === 'delete'){

				if(data.jobinfoState==='发布中'){
					layer.msg('发布中无法删除状态');
					return false;
				}else {
					$.ajax({
						type:"POST",
						url:"/company/deleteJobinfo",
						dataType:"text",
						data:{zpxxid:data.zpxxid},
						//从servlet接收的数据
						success:function (msg) {
							if (msg ==='success') {
								layer.msg('删除成功');
								$(".layui-laypage-btn")[0].click();
							} else {
								layer.msg("修改失败！")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});

				}


			}
		});

	});
</script>
</body>
</html>