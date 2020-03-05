<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/5
  Time: 19:12
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
	<title>Title</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>>
</head>
<body>
<h1  style="background-color: #95877c;font-weight:bold;text-align:center">完成应聘人员信息</h1>
<span>
	<button type="button" class="layui-btn layui-btn-primary layui-btn-radius" style="right: auto">
		<a href="javascript:history.back(-1)"><<返回</a>
	</button>
</span>
<table id="demo" lay-filter="test"></table>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script type="text/javascript">
	//获取window.location.href带参数的值
	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for(var i = 0; i < strs.length; i ++) {
				theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}
	console.log(GetRequest().zpxxid);

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
			, height: 300
			, url: "/company/finishJob" //数据接口
			, where:{zpxxid:GetRequest().zpxxid}
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				{field: 'jlId', title: 'jlId', width: 80,hide: true}
				, {field: 'yhId', title: 'yhId', width:80,hide: true}
				, {field: 'cxrzId', title: 'cxrzId', width:80,hide: true}
				, {field: 'zpxxid', title: 'zpxxid', width:80,hide: true}
				, {field: 'yhname', title: '名字', width: 80}
				, {field: 'sjPhone', title: '手机号', width: 150}
				, {field: 'yxMailbox', title: '邮箱', width: 150}
				, {field: 'byschool', title: '毕业院校', width: 200}
				, {field: 'zy', title: '专业', width: 150}
				, {field: 'xl', title: '学历', width:150}
				, {field: 'ckTime', title: '完成时间', width: 200, sort: true}
			]]
			//设置查询刷新的ID
			, id: 'table1'
		});

	});
</script>
</body>
</html>
