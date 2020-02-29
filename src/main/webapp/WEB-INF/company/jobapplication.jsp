<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/27
  Time: 20:26
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
	<title>求职情况查看</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>>
	<link href ="favicon.ico" rel="shortcut icon">
</head>
<body>
<input id="qyid" type="hidden" value="${sessionScope.Qyinfo.qyid}" />
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
	<h1  style="background-color: #95877c;font-weight:bold;text-align:center">招聘情况</h1>
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">招聘行业：</label>
			<div class="layui-input-inline">
				<select name="position2" id="position" lay-filter="choosePosition"  >
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
				<select name="zwid" id="zwid2">
				</select>
			</div>
		</div>
<%--		<div class="layui-inline">--%>
<%--			<label class="layui-form-label">发布状态:</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<select name="jobinfoState" id="jobinfoState" lay-filter="" lay-search>--%>
<%--					<option value="">选择</option>--%>
<%--					<option value="发布中">发布中</option>--%>
<%--					<option value="待发布">待发布</option>--%>
<%--					<option value="已到期">已到期</option>--%>
<%--				</select>--%>
<%--			</div>--%>
<%--		</div>--%>
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
		查看完成应聘人员信息
	</button>
</script>
<script type="text/html" id="jobapplication">
	待完善！
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
			, height: 300
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
				, {field: 'zpNumEnd', title: '完成应聘人数', width: 140, sort: true}
				, {field: 'schedule', title: '完成进度', width: 200,sort: true}
				, {field: 'schedule', title: '简历投递数量', width: 200,sort: true}
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
			table.reload('table1', {
				url: "/company/searchJobinfoTable"
				, where: { //设定异步数据接口的额外参数，任意设
					type: type,
					zwid: zwid
				}
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		//查询岗位
		form.on('select(choosePosition)', function(data){
			var name = $('#zwid2');
			name.empty();
			$.ajax(
				{
					type:"POST",
					url:"/company/chooseStation",
					dataType:"text",
					data:{poid:data.value},
					success:function (msg) {
						var gangwei = $('#zwid2');
						gangwei.empty();
						var arr = JSON.parse(msg);
						gangwei.append("<option value=''>请选择岗位</option>");
						for (var i = 0; i < arr.length; i++) {
							gangwei.append("<option value='"+arr[i].stid+"'>"+arr[i].postion+"</option>");
						}
						layui.form.render('select')
					},
					error:function () {
					}
				}
			);
		});
		table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值
			//查看及修改
			if (layEvent === 'detail') {
				//打开查看页面
				layer.open({
					type: 1,
					content: $('#jobapplication').html(),
					area: ['740px', '550px'],
					title: '招聘完成人员信息',
					btn: ['取消'],
					anim: 1,//0-6的动画形式，-1不开启
					offset: '40px',
					success: function () {
						form.render();
					}
				});
			}
		});
	});
</script>
</body>
</html>
