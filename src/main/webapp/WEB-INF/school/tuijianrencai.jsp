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
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">推荐</a>
</script>
<script type="text/html" id="toolbar1">
	<input type="checkbox"  checked class="layui-icon-radio">
</script>
<div id="di">
	<form class="layui-form">
		<h1 style="margin-left: 45%">推荐人才</h1>

		<div style="margin-left: 15%;margin-top: 1%">
			<div class="layui-form-item">
				<div class="layui-inline" style="margin-left: 3%">
					<label class="layui-form-label">行业：</label>
					<div class="layui-input-inline">
						<input name="name" id="hy" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline" style="margin-left: -5%">
					<label class="layui-form-label">岗位 ：</label>
					<div class="layui-input-inline">
						<input name="zy" id="gw" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa" type="button">搜索</button>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_shuaxin" type="button">刷新</button>
				</div>
			</div>
		</div>
	</form>
</div>
	<input type="hidden" id="xxzpid">
<div id="mydiv" style="display: none ; padding: 10px;margin-left: 10%">
	<form class="layui-form">
		<h1 style="margin-left: 30%;margin-top: 1%">人才信息推荐</h1>

		<div style="margin-left: 1%;margin-top: 1%">
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
					<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa1" type="button">搜索</button>

				</div>
				<div class="layui-inline">
					<button style="margin-left: 20%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_shuaxin1" type="button">刷新</button>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 20%" class="layui-btn layui-btn-normal layui-btn-radius" id="tj" type="button">推荐</button>
				</div>
			</div>
		</div>
	</form>
	<div style="margin-left: 0%;margin-top: -2%"><table id="demo1" lay-filter="table_pa1"></table></div>
</div>
	<div style="margin-left: 20%;margin-top: -2%"><table id="demo" lay-filter="table_pa"></table></div>
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

			//表格1
			var ins1=table.render({
				elem: '#demo'
				,height: 300
				,width:760
				,limit:5
				,limits:[5,10,15,20]
				,url: '/school/rgxg' //数据接口
				,page: true //开启分页
				,even:true
				,cols: [[ //表头
					{field: 'type', title: '行业', width:150,height:100}
					,{field: 'qyName', title: '企业名称', width:150,height:100}
					,{field: 'postion', title: '岗位', width:150,height:100}
					,{field: 'time', title: '发布时间', width: 150,height:100}
					,{field:'opera', width:150, title: '推荐',align:'center', toolbar: '#toolbar'}
					,{field: 'zpxxid', title: '企业招聘的id', width: 150,height:100,hide:true}
				]]
				,id:'UserTable'
			});
			//表格2
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
			//表格2
			table.render({
				elem: '#demo1'
				,height: 300
				,width:760
				,limit:5
				,limits:[5,10,15,20]
				,url: '/school/rencaiinfoquery' //数据接口
				,page: true //开启分页
				,even:true
				,cols: [[ //表头
					{field: 'phone', title: '手机号', width:150,height:100}
					,{field: 'name', title: '姓名', width:150,height:100}
					,{field: 'zy', title: '专业', width:150,height:100}
					,{field: 'jzstate', title: '就业情况', width: 150,height:100}
					,{field:'opera', width:150, title: '是否推荐',align:'center', toolbar: '#toolbar1'}
					,{field: 'mmFace', title: '政治面貌', width: 50,hide:true}
					,{field: 'birthday', title: '出生日期', width: 50,hide:true}
					,{field: 'byschool', title: '学校', width: 50,hide:true}
					,{field: 'xl', title: '学历', width: 50,hide:true}
					,{field: 'jzdResidence', title: '住址', width: 50,hide:true}
					,{field: 'zsCertificate', title: '技能证书', width: 50,hide:true}
					,{field: 'pjEvaluation', title: '自我评价', width: 50,hide:true}
					,{field: 'yhId', title: '用户id', width: 50,hide:true}
				]]
				,id:'UserTable1'
			});
			//搜索1
			$("#query_pa").click(function () {
				table.reload('UserTable',{
					url:'/school/rgxg'
					,where: { //设定异步数据接口的额外参数，任意设
						position: $("#gw").val(),
						type:$("#hy").val()
					}
					,page: {
						curr: 1 //重新从第 1 页开始
					}
				});
			});
			//搜索2
			$("#query_pa1").click(function () {
				var a=$("#start_time").val();
				var b=$("#end_time").val();
				var times=$("#start_time").val()+"to"+$("#end_time").val();
				if(a!=""&&a!=null||b!=""&&b!=null){
					if(a==""||a==null||b==""||b==null){
						alert("日期格式未填写完整");
						return;
					}
				}
				table.reload('UserTable1',{
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
			//打开推荐人才
			table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
					,layEvent = obj.event; //获得 lay-event 对应的值
				$("#xxzpid").val(data.zpxxid);
				// 点击推荐
				if(layEvent === 'able'){
					layer.open({

						type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

						title:"推荐人才",// title - 标题

						content:$("#mydiv"),// content - 内容

						skin:'layui-layer-molv',// skin - 样式类名

						area:['1000px','600px'],// area - 宽高

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
			});



		});

	</script>
	<script>
		$('#query_shuaxin').click(function () {
			$(".layui-laypage-btn")[0].click();
		});
		$('#query_shuaxin1').click(function () {
			$(".layui-laypage-btn")[0].click();
		});
		$("#tj").click(function () {
			alert("推荐成功");
		});
	</script>




</body>
</html>