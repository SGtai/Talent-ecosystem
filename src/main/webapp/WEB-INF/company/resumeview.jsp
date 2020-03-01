<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/27
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	String path = application.getContextPath()+"/layui/";
	String Path =application.getContextPath();
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<html>
<head>
	<title>简历查询</title>
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
	<h1  style="background-color: #95877c;font-weight:bold;text-align:center">全部简历</h1>
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">招聘行业：</label>
			<div class="layui-input-inline">
				<select name="position" id="position" lay-filter="choosePosition"  >
					<option value="0" >请选择行业</option>
					<c:if test="${position!=null}">
						<c:forEach items="${position}" begin="0" var="i">
							<option  value="${i.poid}">${i.type}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">招聘岗位：</label>
			<div class="layui-input-block">
				<select name="zwid" id="zwid">
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<select name="jobinfoState" id="jobinfoState" lay-filter="" lay-search>
					<option value="">选择</option>
					<option value="发布中">发布中</option>
					<option value="待发布">待发布</option>
					<option value="已到期">已到期</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
		</div>
	</div>
</form>
<table id="demo" lay-filter="test"></table>
<h1  style="background-color: #95877c;font-weight:bold;text-align:center">投递我司简历</h1>
<h3  style="font-weight:bold;text-align:center;color: red">新增未查看简历：10份</h3>
<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
	<div class="layui-inline">
		<label class="layui-form-label">招聘行业：</label>
		<div class="layui-input-inline">
			<select name="position" id="position1" lay-filter="choosePosition"  >
				<option value="0" >请选择行业</option>
				<c:if test="${position!=null}">
					<c:forEach items="${position}" begin="0" var="i">
						<option  value="${i.poid}">${i.type}</option>
					</c:forEach>
				</c:if>
			</select>
		</div>
	</div>
	<div class="layui-inline">
		<label class="layui-form-label">招聘岗位：</label>
		<div class="layui-input-block">
			<select name="zwid" id="zwid1">
			</select>
		</div>
	</div>
</div>
</form>

<table id="demo1" lay-filter="test"></table>

<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>

<script type="text/html" id="barDemo">
	<button lay-event="detail" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i
			class="layui-icon">&#xe63c;</i>
		查看简历
	</button>
	<button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		面试邀请
	</button>
	<button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		导出简历
	</button>

</script>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery','table','layedit', 'laydate'], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
		var layedit = layui.layedit;
		var laydate = layui.laydate;

		// 设置最小可选的日期
		function minDate() {
			var now = new Date();
			return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		};
		//第一个实例
		table.render({
			elem: '#demo'
			, height: 280
			, url: "/user/yulan" //数据接口
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				//简历发布时间 姓名 年龄 性别 应聘行业 岗位 学历
				{field: 'zpxxid', title: 'ID', width: 80, hide: true}
				, {field: 'type', title: '招聘行业', width: 150}
				, {field: 'postion', title: '意向岗位', width: 200}
				, {field: 'zhaopinTime', title: '名字', width: 200}
				// ,{field: 'xueliRequire', title: '学历要求', width:100}
				// ,{field: 'age', title: '年龄范围(岁)', width:120}
				// ,{field: 'salary', title: '参考薪资(元)', width:150}
				// ,{field: 'xinzifuli', title: '薪资福利', width: 250}
				, {field: 'zpNum', title: '学历', width: 120, sort: true}
				, {field: 'time', title: '发布时间', width: 200, sort: true}
				// , {field: 'jobinfoState', title: '发布状态', width: 110}
				, {fixed: 'right', width: 320, align: 'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			, id: 'table1'
		});

		form.on('submit(search)', function (data) {
			var myselect = document.getElementById("position");
			var index = myselect.selectedIndex;
			var type = myselect.options[index].text;
			var zwid = $('#zwid2').val();
			var jobinfoState = $('#jobinfoState').val();
			table.reload('table1', {
				url: "/company/searchJobinfoTable"
				, where: { //设定异步数据接口的额外参数，任意设
					type: type,
					zwid: zwid,
					jobinfoState: jobinfoState
				}
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		//第二个实例
		table.render({
			elem: '#demo1'
			, height: 280
			, url: "/company/searchJobinfoTable" //数据接口
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				//简历发布时间 姓名 年龄 性别 应聘行业 岗位 学历
				{field: 'zpxxid', title: 'ID', width: 80, hide: true}
				, {field: 'type', title: '招聘行业', width: 150}
				, {field: 'postion', title: '招聘岗位', width: 200}
				, {field: 'zhaopinTime', title: '招聘时间', width: 200}
				// ,{field: 'xueliRequire', title: '学历要求', width:100}
				// ,{field: 'age', title: '年龄范围(岁)', width:120}
				// ,{field: 'salary', title: '参考薪资(元)', width:150}
				// ,{field: 'xinzifuli', title: '薪资福利', width: 250}
				, {field: 'zpNum', title: '招聘人数', width: 120, sort: true}
				, {field: 'time', title: '发布时间', width: 200, sort: true}
				, {field: 'jobinfoState', title: '发布状态', width: 110}
				, {fixed: 'right', width: 320, align: 'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			, id: 'table1'
		});

		form.on('submit(search)', function (data) {
			var myselect = document.getElementById("position");
			var index = myselect.selectedIndex;
			var type = myselect.options[index].text;
			var zwid = $('#zwid2').val();
			var jobinfoState = $('#jobinfoState').val();
			table.reload('table1', {
				url: "/company/searchJobinfoTable"
				, where: { //设定异步数据接口的额外参数，任意设
					type: type,
					zwid: zwid,
					jobinfoState: jobinfoState
				}
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
	});
</script>
</body>
</html>
