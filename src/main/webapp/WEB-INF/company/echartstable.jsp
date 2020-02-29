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

</head>
<body>
<button id="test2">Layer+Echarts构建弹出层折线图</button>
<div id="speedChart" style="display: none;">
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	<div id="speedChartMain" style="width: 650px; height:500px;"></div>
</div>
<div id="dfd">
	<span>Layer+Echarts构建弹出层折线图</span>
	<p>Layer+Echarts构建弹出层折线图</p>
</div>

<script src="/echarts.min.js"></script>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('speedChartMain'));
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('speedChartMain'));
	option = {
		title: {
			text: '南丁格尔玫瑰图',
			subtext: '纯属虚构',
			left: 'center'
		},
		tooltip: {
			trigger: 'item',
			formatter: '{a} <br/>{b} : {c} ({d}%)'
		},
		legend: {
			left: 'center',
			top: 'bottom',
			data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
		},
		toolbox: {
			show: true,
			feature: {
				mark: {show: true},
				dataView: {show: true, readOnly: false},
				magicType: {
					show: true,
					type: ['pie', 'funnel']
				},
				restore: {show: true},
				saveAsImage: {show: true}
			}
		},
		series: [
			{
				name: '面积模式',
				type: 'pie',
				radius: [70, 200],
				center: ['50%', '50%'],
				roseType: 'angle',
				data: [
					{value: 10, name: 'rose1'},
					{value: 5, name: 'rose2'},
					{value: 15, name: 'rose3'},
					{value: 25, name: 'rose4'},
					{value: 20, name: 'rose5'},
					{value: 35, name: 'rose6'},
					{value: 30, name: 'rose7'},
					{value: 40, name: 'rose8'}
				]
			}
		]
	};

	myChart.setOption(option);
	//弹出一个页面层
	layui.use(['form', 'layer', 'jquery','table','layedit', 'laydate'], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
		var layedit = layui.layedit;
		var laydate = layui.laydate;
		$('#test2').on('click', function () {
			layer.open({
				title: 'hello world',
				type: 1,
				shade: false,
				area: ['650px', '550px'],
				offset: '40px',
				shadeClose: false, //点击遮罩关闭
				content: $("#speedChart")
			});
		});
	})
</script>
</body>
</html>
