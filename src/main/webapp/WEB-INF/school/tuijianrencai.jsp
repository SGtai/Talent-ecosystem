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
		<h1 style="margin-left: 45%">推荐人才</h1>

		<div style="margin-left: 15%;margin-top: 1%">
			<div class="layui-form-item">
				<div class="layui-inline" style="margin-left: 3%">
					<label class="layui-form-label">行业：</label>
					<div class="layui-input-inline">
						<input name="name" id="name" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline" style="margin-left: -5%">
					<label class="layui-form-label">岗位 ：</label>
					<div class="layui-input-inline">
						<input name="zy" id="zy" class="layui-input" type="text" autocomplete="off">
					</div>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daochu" type="button">搜索</button>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daoru" type="button">刷新</button>
				</div>
			</div>
		</div>
	</form>
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

			//表格
			var ins1=table.render({
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
					,{field: 'zy', title: '专业', width:150,height:100}
					,{field: 'jzstate', title: '就业情况', width: 150,height:100}
					,{field:'opera', width:150, title: '操作',align:'center', toolbar: '#toolbar'}
					,{field: 'mmFace', title: '政治面貌', width: 50,style:'display:none;'}
					,{field: 'birthday', title: '出生日期', width: 50,style:'display:none;'}
					,{field: 'phone', title: '电话', width: 50,style:'display:none;'}
					,{field: 'byschool', title: '学校', width: 50,style:'display:none;'}
					,{field: 'xl', title: '学历', width: 50,style:'display:none;'}
					,{field: 'jzdResidence', title: '住址', width: 50,style:'display:none;'}
					,{field: 'zsCertificate', title: '技能证书', width: 50,style:'display:none;'}
					,{field: 'pjEvaluation', title: '自我评价', width: 50,style:'display:none;'}
				]]
				,done: function (res, curr, count) {
					exportData=res.data;
				}
				,id:'UserTable'
			});
			$("#daochu").click(function(){
				table.exportFile(ins1.config.id,exportData, 'xls');
			});
			//搜索
			$("#query_pa").click(function () {
				var a=$("#start_time").val();
				var b=$("#end_time").val();
				var times=$("#start_time").val()+"to"+$("#end_time").val();
				if(a!=""&&a!=null||b!=""&&b!=null){
					if(a==""||a==null||b==""||b==null){
						alert("日期格式未填写完整");
						return;
					}
				}
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
			//查看简历
			table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
					,layEvent = obj.event; //获得 lay-event 对应的值
				$("#hide1").val(data.name);
				$("#hide2").val(data.byschool);
				$("#hide3").val(data.birthday);
				$("#hide4").val(data.zy);
				$("#hide5").val(data.mmFace);
				$("#hide6").val(data.xl);
				$("#hide7").val(data.phone);
				$("#hide8").val(data.jzdResidence);
				$("#hide9").val(data.zsCertificate);
				$("#hide10").val(data.pjEvaluation);
				$.ajax(
					{
						type:"POST",
						url:"/school/exgz",
						dataType:"text",
						data:{
							account:data.account
						},
						success:function (msg) {
							var arr = JSON.parse(msg);
							// alert(arr.experiences[0].zyMajor);
							$("#ex").children().empty();
							$("#gz").children().empty();
							if(arr.experiences.length!=0){
								for (var i = 0; i < arr.experiences.length; i++) {
									$("#ex").append("<tr><td>"+arr.experiences[i].sxSchooltime+"</td><td>"+arr.experiences[i].school+"</td><td>"+arr.experiences[i].zyMajor+"</td></tr>");
								}
							}else{
								$("#ex").append("<tr><td>无</td><td>无</td><td>无</td></tr>");
							}
							if(arr.undergos.length!=0){
								for (var i = 0; i < arr.undergos.length; i++) {
									$("#gz").append("<tr><td>"+arr.undergos[i].ksTime+"</td><td>"+arr.undergos[i].jzUnit+"</td><td>"+arr.undergos[i].zwPosition+"</td></tr>");
								}
							}else{
								$("#gz").append("<tr><td>无</td><td>无</td><td>无</td></tr>");
							}
							layui.form.render('table');
						},
						error:function (msg) {
							alert("系统忙，请稍等");
						}
					}
				);
				// 查看简历
				if(layEvent === 'able'){
					layer.open({

						type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

						title:"个人简历(简略)",// title - 标题

						content:$("#mydiv"),// content - 内容

						skin:'layui-layer-molv',// skin - 样式类名

						area:['1000px','400px'],// area - 宽高

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
			//导入人才面板
			$("#daoru").click(function () {
				layer.open({

					type:1 , //设置类型 默认为0， 1：页面层  2：iframe层 type - 基本层类型

					title:"人才批量导入",// title - 标题

					content:$("#daorumb"),// content - 内容

					skin:'layui-layer-molv',// skin - 样式类名

					area:['700px','200px'],// area - 宽高

					offset:'auto',// offset - 坐标

					icon:1,//只对type=0的有效 icon - 图标。信息框和加载层的私有参数


					btnAlign: 'c',//按钮居中对齐

					shadeClose:true,
					// time:10000,//time - 自动关闭所需毫秒

					anim:5,//anim - 弹出动画 渐显

					resize:false,//resize - 是否允许拉伸

					maxmin:false, //是否显示最大化和最小化的按钮 对type=1 type=2有效

					success:function () {

					}

				})
			});



		});

	</script>
	<script>

		function downloadTemp(){
			window.location="/schoolS/cunchu/简历模板.xls";
			// window.open("/schoolS/cunchu/简历模板.xls");
			// $.ajax(
			// 	{
			// 		type:"POST",
			// 		url:"/school/xiazaimoban",
			// 		dataType:"text",
			// 		success:function (msg) {
			// 			alert("模板已经下载到C盘")
			// 		},
			// 		error:function (msg) {
			// 			alert("系统忙，请稍等");
			// 		}
			// 	}
			// );
		}
		$('#bb').click(
			function () {
				var f=$("#filename").val();
				if (f!=null&&f!="") {
					var a = document.getElementById("btn");
					a.click();
				}else{
					alert("您还未选择要提交的excel文件");
				}
			});
		$('#query_shuaxin').click(function () {
			$(".layui-laypage-btn")[0].click();
		});
	</script>




</body>
</html>