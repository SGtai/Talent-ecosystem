<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/21
  Time: 10:57
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
	<title>Title</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>>
	<link href ="favicon.ico" rel="shortcut icon">
</head>
<body>
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">招聘行业：</label>
			<div class="layui-input-inline">
				<select name="position" id="position" lay-filter="choosePosition"  >
					<option value="">请选择行业</option>
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
					<option value="已下架">已下架</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
		</div>
	</div>
</form>
<table id="demo" lay-filter="test"></table>
<%--<script type="text/javascript" src=<%=jsPath+"backtable.js"%>></script>--%>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
	layui.use(['form', 'layer', 'jquery','table'], function(){
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 300
			,url: '<%=Path+"/company/searchJobinfoTable"%>' //数据接口
			,page: true //开启分页
			,limit:5
			,limits:[5,10,20,50,100]
			,cols: [[ //表头
				{field: 'type', title: '招聘行业', width:150}
				,{field: 'postion', title: '招聘岗位', width:200}
				,{field: 'zhaopinTime', title: '招聘时间', width:200}
				,{field: 'xueliRequire', title: '学历要求', width:100}
				,{field: 'age', title: '年龄范围(岁)', width:120}
				,{field: 'salary', title: '参考薪资(元)', width:150}
				,{field: 'xinzifuli', title: '薪资福利', width: 250}
				,{field: 'zpNum', title: '招聘人数', width: 120, sort: true}
				,{field: 'time', title: '发布时间', width: 200,sort: true}
				,{field: 'jobinfoState', title: '发布状态', width: 110}
				,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			,id:'table1'
		});

		form.on('submit(search)', function (data) {
			var myselect=document.getElementById("position");
			var index=myselect.selectedIndex;
			var type = myselect.options[index].text;
			var zwid = $('#zwid').val();
			var jobinfoState = $('#jobinfoState').val();
			table.reload('table1',{
				url:'<%=Path+"/company/searchJobinfoTable"%>'
				,where: { //设定异步数据接口的额外参数，任意设
					type:type,
					zwid:zwid,
					jobinfoState:jobinfoState
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});

		form.on('select(choosePosition)', function(data){
			var name = $('#zwid');

			name.empty();

			$.ajax(
				{
					type:"POST",
					url:"/company/chooseStation",
					dataType:"text",
					data:{poid:data.value},
					success:function (msg) {
						var gangwei = $('#zwid');
						gangwei.empty();
						var arr = JSON.parse(msg);
						gangwei.append("<option value=''>请选择岗位</option>");
						for (var i = 0; i < arr.length; i++) {
							gangwei.append("<option value='"+arr[i].stid+"'>"+arr[i].postion+"</option>");
						}
						layui.form.render('select')
					},
					error:function (msg) {
						alert(msg);
					}
				}
			);
		});

		//监听头工具栏事件
		table.on('toolbar(test)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id)
				,data = checkStatus.data; //获取选中的数据
			switch(obj.event){
				case 'add':
					layer.msg('添加');
					break;
				case 'update':
					if(data.length === 0){
						layer.msg('请选择一行');
					} else if(data.length > 1){
						layer.msg('只能同时编辑一个');
					} else {
						layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
					}
					break;
				case 'delete':
					if(data.length === 0){
						layer.msg('请选择一行');
					} else {
						layer.msg('删除');
					}
					break;
			};
		});

		//监听行工具事件
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'detail'){
				layer.msg('查看操作');
			} else if(layEvent === 'del'){
				layer.confirm('真的删除行么', function(index){

					var account =data.account;//data.XXX 后缀直接写需要取值的名称与表头给的field一致
					alert(account);
					$.ajax({
						type:"post",
						url:"<%=path+"/user/doDelete"%>",
						//预期服务器返回的数据类型;
						datatype:"text",
						//从该js会发出到服务器的数据
						data:{account:account},
						//从servlet接收的数据
						success:function (msg) {
							if (msg === 'success') {
								alert("删除成功！");
								window.location.reload();
							} else {
								layer.msg("删除失败！")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});
					layer.close(index);
				});
			} else if(layEvent === 'edit'){
				layer.msg('编辑操作');
			}
		});
	});
</script>
</body>
</html>