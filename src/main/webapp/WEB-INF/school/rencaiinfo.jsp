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
		<h1 style="margin-left: 40%">人才信息查询</h1>

		<div style="margin-left: 15%;margin-top: 1%">
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
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daochu" type="button">导出人才</button>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 0%" class="layui-btn layui-btn-normal layui-btn-radius" id="daoru" type="button">导入人才</button>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline" style="margin-left: 3%">
					<label class="layui-form-label">请选择范围</label>
					<div class="layui-input-inline">
						<input class="layui-input" id="test16" type="text" placeholder="开始 到 结束">
					</div>
				</div>
				<div class="layui-inline">
					<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa" type="button">搜索</button>

				</div>
				<div class="layui-inline">
					<button style="margin-left: 20%" class="layui-btn layui-btn-normal layui-btn-radius" id="query_shuaxin" type="button">刷新</button>
				</div>
			</div>
		</div>
	</form>
	<div style="margin-left: 20%;margin-top: -2%"><table id="demo" lay-filter="table_pa"></table></div>

	<%--人才简历--%>
	<div id="mydiv" style="display: none ; padding: 10px;margin-left: 10%">
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" id="hide1"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">学校名称</label>
			<div class="layui-input-inline">
				<input type="text" id="hide2"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">出生年月</label>
			<div class="layui-input-inline">
				<input type="text" id="hide3"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">专业</label>
			<div class="layui-input-inline">
				<input type="text" id="hide4"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">政治面貌</label>
			<div class="layui-input-inline">
				<input type="text" id="hide5"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">学历</label>
			<div class="layui-input-inline">
				<input type="text" id="hide6"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" id="hide7"  autocomplete="off" class="layui-input" disabled>
			</div>
			<label class="layui-form-label">住址</label>
			<div class="layui-input-inline">
				<input type="text" id="hide8"  autocomplete="off" class="layui-input" disabled>
			</div>
		</div>
		<img  src="WEB-INF/school/cunchu/mypic/图片1.png" alt="" style="width: 20%;height: 20%;margin-left: 70%;margin-top: -30%">
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">技能证书</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="hide9" class="layui-textarea" placeholder="请输入内容" maxlength="240" disabled></textarea>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: -15%">
			<label class="layui-form-label">自我评价</label>
			<div class="layui-input-inline" style="width: 79%;">
				<textarea name="scdata" id="hide10" class="layui-textarea" placeholder="请输入内容" maxlength="240" disabled></textarea>
			</div>
		</div>
	</div>
<%--	人才批量导入面板--%>
	<div id="daorumb" style="display: none ; padding: 10px;margin-left: 10%">

		<div class="layui-form-item">
			<label class="layui-form-label" style="margin-left: 15%">模板下载</label>
			<div class="layui-inline">
				<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" id="xiazaimb" type="button">下载模板</button>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="margin-left: 15%">批量上传</label>
			<div class="layui-inline">
				<button style="margin-left: 5%" class="layui-btn layui-btn-normal layui-btn-radius" id="xzwj" type="button">选择文件</button>
			</div>
		</div>
		<div>
			<div class="layui-inline" style="margin-left: 19%">
				<button type="button" class="layui-btn"  id="baocun">提交</button>
			</div>
			<div class="layui-inline" style="margin-left: 15%">
				<button type="button" class="layui-btn"  id="fanhui">返回</button>
			</div>
		</div>
	</div>
	<script>
		layui.use(['form','layer','jquery','table','laydate'], function() {
			var table = layui.table;
			var form = layui.form;
			var $ = layui.jquery;
			var layer = layui.layer;
			var laydate = layui.laydate;
			var times = "";
			//日期显示
			laydate.render({
				elem: '#test16'
				, type: 'datetime'
				, range: 'to'
				, format: 'yyyy-MM-dd'
				, done: function (value, date) {
					times = value;
				}
			});
			//表格
			table.render({
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
					,{field: 'zyMajor', title: '专业', width:150,height:100}
					,{field: 'jzstate', title: '就业情况', width: 150,height:100,templet:function (d) {
							if(d.jzstate==="0"){
								return "未就业"
							}
							if(d.jzstate==="1"){
								return "已就业"
							}

						}
					}
					,{field:'opera', width:150, title: '操作',align:'center', toolbar: '#toolbar'}
					,{field: 'mmFace', title: '政治面貌', width: 50,style:'display:none;'}
					,{field: 'birthday', title: '出生日期', width: 50,style:'display:none;'}
					,{field: 'phone', title: '电话', width: 50,style:'display:none;'}
					,{field: 'bySchool', title: '学校', width: 50,style:'display:none;'}
					,{field: 'xlEducation', title: '学历', width: 50,style:'display:none;'}
					,{field: 'jzdResidence', title: '住址', width: 50,style:'display:none;'}
					,{field: 'zsCertificate', title: '技能证书', width: 50,style:'display:none;'}
					,{field: 'pjEvaluation', title: '自我评价', width: 50,style:'display:none;'}
				]]
				,id:'UserTable'
			});
			//搜索
			$("#query_pa").click(function () {
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
				$("#hide2").val(data.bySchool);
				$("#hide3").val(data.birthday);
				$("#hide4").val(data.zyMajor);
				$("#hide5").val(data.mmFace);
				$("#hide6").val(data.xlEducation);
				$("#hide7").val(data.phone);
				$("#hide8").val(data.jzdResidence);
				$("#hide9").val(data.zsCertificate);
				$("#hide10").val(data.pjEvaluation);
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

					area:['450px','250px'],// area - 宽高

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





</body>
</html>
