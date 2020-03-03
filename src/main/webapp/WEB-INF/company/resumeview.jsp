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
				<select name="gwid" id="zwid">
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
		面试邀请
	</button>
	<button lay-event="" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		导出简历
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
			, url: "/company/searchResume" //数据接口
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				//简历发布时间 姓名 年龄 性别 应聘行业 岗位 学历
				{field: 'jlId', title: 'jlId', width: 80,hide: true}
				, {field: 'yhId', title: 'yhId', width:80,hide: true}
				, {field: 'type', title: '意向行业', width: 150}
				, {field: 'postion', title: '意向岗位', width: 200}
				, {field: 'yhname', title: '名字', width: 200}
				, {field: 'xl', title: '学历', width: 120, sort: true}
				, {field: 'scTime', title: '发布时间', width: 200, sort: true}
				, {fixed: 'right', width: 320, align: 'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			, id: 'table1'
		});

		form.on('submit(search)', function (data) {
			var myselect = document.getElementById("position");
			var index = myselect.selectedIndex;
			var type = myselect.options[index].text;
			var postion = $('#zwid').val();
			table.reload('table1', {
				url: "/company/searchResume"
				, where: { //设定异步数据接口的额外参数，任意设
					type: type,
					postion: postion
				}
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		//查询岗位
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
							gangwei.append("<option value='"+arr[i].postion+"'>"+arr[i].postion+"</option>");
						}
						layui.form.render('select')
					},
					error:function () {
					}
				}
			);
		});
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			//查看简历
			if(layEvent === 'detail'){
				window.location.href="/company/yulan?jlid="+data.jlId
			}
			//邀请面试
			else if(layEvent === 'update'){
				var jlId=data.jlId;
				$.ajax({
					type:"POST",
					url:"/company/selectQuery",
					dataType:"text",
					data:{jlId:jlId},
					//从servlet接收的数据
					success:function (msg) {
						if (msg ==='success') {
							alert("面试邀请成功！");
							$(".layui-laypage-btn")[0].click();
						} else {
							layer.msg("面试邀请失败！该简历已投递过我司")
						}
					}
					,error:function () {
						alert("服务器正忙.....");
					}
				});
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
