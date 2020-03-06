<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/2
  Time: 13:36
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
	<title>投递我公司简历</title>
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
	<h1  style="background-color: #95877c;font-weight:bold;text-align:center">投递我公司简历</h1>
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
<input id="Path" type="hidden" value="<%=Path%>" />
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
	<button lay-event="delete" id="daochu" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		导出信息
	</button>

</script>
<script type="text/javascript">
	var Path=$('#Path').val();

	layui.use(['form', 'layer', 'jquery','table'], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;

		//第一个实例
		var ins1=table.render({
			elem: '#demo'
			, height: 280
			, url: Path+"/company/searchResumeCompany" //数据接口
			, page: true //开启分页
			, limit: 5
			, limits: [5, 10, 20, 50, 100]
			, cols: [[ //表头
				//简历发布时间 姓名 年龄 性别 应聘行业 岗位 学历
				{field: 'jlId', title: 'jlId', width: 80,hide: true}
				, {field: 'yhId', title: 'yhId', width:80,hide: true}
				, {field: 'cxrzId', title: 'cxrzId', width:80,hide: true}
				, {field: 'zpxxid', title: 'zpxxid', width:80,hide: true}
				, {field: 'type', title: '应聘行业', width: 100}
				, {field: 'postion', title: '应聘岗位', width: 100}
				, {field: 'yhname', title: '名字', width: 80}
				, {field: 'sjPhone', title: '手机号', width: 120}
				, {field: 'yxMailbox', title: '邮箱', width: 150}
				, {field: 'byschool', title: '毕业院校', width: 120}
				, {field: 'zy', title: '专业', width: 100}
				, {field: 'xl', title: '学历', width: 80, sort: true}
				, {field: 'ckTime', title: '投递时间', width: 200, sort: true}
				// , {field: 'jobinfoState', title: '发布状态', width: 110}
				, {fixed: 'right', width: 320, align: 'center', toolbar: '#barDemo'}
			]]
			,done: function (res, curr, count) {
				exportData=res.data;
			}
			//设置查询刷新的ID
			, id: 'table1'
		});
		form.on('submit(search)', function (data) {
			var myselect = document.getElementById("position");
			var index = myselect.selectedIndex;
			var type = myselect.options[index].text;
			var postion = $('#zwid').val();
			table.reload('table1', {
				url:Path+ "/company/searchResumeCompany"
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
					url:Path+"/company/chooseStation",
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
				window.location.href=Path+"/company/yulan?jlid="+data.jlId
			}
			//投递我公司简历邀请面试
			else if(layEvent === 'update'){
				var cxrzId=data.cxrzId;
				$.ajax({
					type:"POST",
					url:Path+"/company/updateQuery",
					dataType:"text",
					data:{cxrzId:cxrzId},
					success:function (msg) {
						if (msg ==='success') {
							alert("面试邀请成功！");
							$(".layui-laypage-btn")[0].click();
						} else {
							layer.msg("面试邀请失败！")
						}
					}
					,error:function () {
						alert("服务器正忙.....");
					}
				});
			} else if(layEvent === 'delete'){
				table.exportFile(ins1.config.id,exportData, 'xls');
			}
		});

	});
</script>
</body>
</html>
