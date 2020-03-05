<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/29
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<%
	String path = application.getContextPath()+"/layui/";
	String Path =application.getContextPath();
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<html>
<head>
	<meta charset="utf-8">
	<title>ECharts</title>
	<link rel="stylesheet" href=<%=path+"css/layui.css"%>>
</head>
<body class="layui-layout-body">

<h2 class="layui-form-item" style="margin-left: 43%;margin-top: 3%">招聘信息统计</h2>
<div class="layui-form-item" style="margin-left: 15%;">
	<label class="layui-form-label" style="text-align: left">统计：</label>

	<div class="layui-input-inline" style="margin-left: 8%">
		<button onclick="week()" type="button" class="layui-btn layui-btn-radius"
		        id="week"><i class="layui-icon">&#xe615;</i>本周
		</button>
	</div>

	<div class="layui-input-inline" >
		<button type="button" class="layui-btn layui-btn-radius"
		        id="month"><i class="layui-icon">&#xe615;</i>本月
		</button>
	</div>

	<div class="layui-input-inline" >
		<button type="button" class="layui-btn layui-btn-radius"
		        id="half"><i class="layui-icon">&#xe615;</i>近半年
		</button>
	</div>

</div>

<div class="layui-form-item" style="margin-left: 55%">
	<label id="howlong" class="layui-form-label" style="text-align: left;width: 150px"></label>
	<label id="sum" class="layui-form-label" style="text-align: left;margin-left: -8%"></label>
</div>

<div id="echarts_div" style="width: 600px;height:400px;margin-left: 25%"></div>


<script src="/echarts.min.js"></script>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script type="text/javascript" >
	var nameArr = [];
	var valueArr = [];
	var obArr = [];

	$(function() {
		$.ajax({
			method : "POST",
			url : "/company/weekJobinfo",
			dataType : "text",
			// data:{role:0},
			success : function(msg) {
				var list = msg.split("://");
				var arr = JSON.parse(list[0]);
				$('#howlong').html('本周总新增招聘信息：');
				$('#sum').html(list[1]);
				for (var i = 0; i < arr.length; i++) {
					// 普通柱状图使用的数据
					nameArr.push(arr[i].name);
					valueArr.push(arr[i].count);
				}
				createEchars();// 创建普通柱状图

			},
			error : function() {
				alert("服务器正忙");
			}
		});
	});

	layui.use(['table', 'jquery', 'layer', 'form'], function () {
		var table = layui.table;
		var $ = layui.jquery;
		var layer = layui.layer;
		var form = layui.form;
		$("#week").click(function () {
			nameArr = [];
			valueArr = [];
			$.ajax({
				method : "POST",
				url : "/company/weekJobinfo",
				dataType : "text",
				// data:{role:0},
				success : function(msg) {
					var list = msg.split("://");
					var arr = JSON.parse(list[0]);
					$('#howlong').html('本周总新增招聘：');
					$('#sum').html(list[1]);
					for (var i = 0; i < arr.length; i++) {
						// 普通柱状图使用的数据
						nameArr.push(arr[i].name);
						valueArr.push(arr[i].count);
					}
					createEchars();// 创建普通柱状图

				},
				error : function() {
					alert("服务器正忙");
				}
			});
		});
		$("#month").click(function () {
			nameArr = [];
			valueArr = [];

			$.ajax({
				method : "POST",
				url : "/company/monthJobinfo",
				dataType : "text",
				data:{date:new Date().format('yyyy-MM-dd')},
				success : function(msg) {
					var list = msg.split("://");
					var arr = JSON.parse(list[0]);
					$('#howlong').html('本月总新增招聘：');
					$('#sum').html(list[1]);
					for (var i = 0; i < arr.length; i++) {
						// 普通柱状图使用的数据
						nameArr.push(arr[i].name);
						valueArr.push(arr[i].count);
					}
					createEchars();// 创建普通柱状图

				},
				error : function() {
					alert("服务器正忙");
				}
			});
		});
		$("#half").click(function () {
			nameArr = [];
			valueArr = [];
			$.ajax({
				method : "POST",
				url : "/company/halfJobinfo",
				dataType : "text",
				data:{role:0},
				success : function(msg) {

					var list = msg.split("://");
					var arr = JSON.parse(list[0]);
					$('#howlong').html('近半年总新增招聘：');
					$('#sum').html(list[1]);
					for (var i = 0; i < arr.length; i++) {
						// 普通柱状图使用的数据
						nameArr.push(arr[i].name);
						valueArr.push(arr[i].count);
					}
					createEchars();// 创建普通柱状图

				},
				error : function() {
					alert("服务器正忙");
				}
			});
		});



	});


	//普通柱状图
	function createEchars() {

		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('echarts_div'),'dark');//dark为暗黑主题 不要可以去掉

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '招聘信息发布新增量统计报表'
			},
			tooltip : {},
			legend : {
				data : [ '柱状数据表' ]
			},
			xAxis : {
				data : nameArr
			},
			yAxis : {},
			series : [ {
				name : '新增量',
				type : 'bar',
				data : valueArr
			} ],
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

	}


	// 重构Date对象下的时间格式
	Date.prototype.format = function (format) {
		var o = {
			"M+": this.getMonth() + 1,
			"d+": this.getDate(),
			"h+": this.getHours(),
			"m+": this.getMinutes(),
			"s+": this.getSeconds(),
			"q+": Math.floor((this.getMonth() + 3) / 3),
			"S": this.getMilliseconds()
		}
		if (/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
		}
		for (var k in o) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
			}
		}
		return format;
	}
</script>

</body>
</html>
