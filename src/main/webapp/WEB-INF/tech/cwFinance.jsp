<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/27
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = application.getContextPath()+"/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String layuiPath =application.getContextPath()+"/layui/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>table模块快速使用</title>
	<link rel="stylesheet" href="<%=layuiPath+"css/layui.css"%>" media="all">

</head>
<body>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -8%;margin-left: 21%;font-size: 17px;">订单名称</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: -8%;position: absolute;width: 12%;">
		<input type="text" id="title" name="title" required  lay-verify="required" placeholder="请输入文档标题" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 21%;font-size: 17px;">价格</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="text"  id="price1" name="price1" required  lay-verify="required" placeholder="请输入最低价" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 40%;font-size: 17px;">至</label>
	<div class="layui-input-block" style="margin-left: 49%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="text" id="price2" name="price2" required  lay-verify="required" placeholder="请输入最高价" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" >
	</div>
</div>
<button type="button" class="layui-btn" style="position: absolute;margin-top: -8%;margin-left: 88%;" id="cx">查询</button>
<label class="layui-form-label" style="margin-top: -8%;margin-left: 41%;font-size: 17px;">订单编号</label>
<div class="layui-input-block" style="width: 12%;position: absolute;margin-top: -8%;margin-left: 49%;">
	<input type="text" id="ddNumber" name="ddNumber" required  lay-verify="required" placeholder="请输入文档标题" autocomplete="off" class="layui-input" >
</div>
<label class="layui-form-label" style="margin-top: -8%;margin-left: 61%;font-size: 17px;width: 100px;">购买用户名</label>
<div class="layui-input-block" style="width: 12%;position: absolute;margin-top: -8%;margin-left: 72%;">
	<input type="text" id="yhName" name="yhName" required  lay-verify="required" placeholder="请输入文档标题" autocomplete="off" class="layui-input" >
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 57%;font-size: 17px;">日期</label>
	<div class="layui-input-block" style="margin-left: 66%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="date"  id="ddTime1" name="ddTime1" required  lay-verify="required" placeholder="请输入最低价" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 76%;font-size: 17px;">至</label>
	<div class="layui-input-block" style="margin-left: 85%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="date" id="ddTime2" name="ddTime2" required  lay-verify="required" placeholder="请输入最高价" autocomplete="off" class="layui-input" >
	</div>
</div>


<div style="margin-left: 3%;margin-top: 12%;">
	<table id="demo" lay-filter="test"></table>
</div>


<script src="<%=layuiPath+"layui.js"%>"></script>
<script src="<%=layuiPath+"layui.all.js"%>"></script>
<script type="text/javascript" src=<%=jsPath + "json2.js"%>></script>
<script src="<%=layuiPath+"lay/modules/layer.js"%>"></script>
<script src=<%=jsPath+"jquery-3.4.1.js"%>></script>
<script src=<%=jsPath+"util.js"%>></script>
<script type="text/html" id="toolbar2">
	<a class="layui-btn layui-btn-sm background-style" lay-event="info">删除订单</a>
</script>
<script>
	layui.use('table', function(){
		var table = layui.table;

		//第一个实例
		table.render({
			elem: '#demo'
			,height: 277
			,width: 1276
			,url: '<%=path+"finance.data"%>' //数据接口
			,limit:5
			,page: true //开启分页
			,cols: [[ //表头
				{field: 'cwId', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'kcName', title: '订单名称', width:90}
				,{field: 'msDescribe', title: '订单描述', width:137
				}
				,{field: 'ddNumber', title: '订单号', width: 287, sort: true}
				,{field: 'ddTime', title: '时间', width: 127, sort: true}
				,{field: 'jgPrice', title: '订单价格', width:137, sort: true}
				,{field: 'yhName', title: '购买用户', width:177, sort: true}
				,{field: 'jgPrice', title: '价格', width:100, sort: true}

				,{field: 'statusid', title: '操作', width: 140,toolbar: '#toolbar2'}
			]]
			,id:'workerTable'
		});
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			//查看详情
			if(layEvent === 'info'){
				layer.confirm('确定删除？',function (index)
				{
					$.ajax(
						{
							type:"POST",
							url:'<%=path+"deleteFinance"%>',
							dataType:"text",
							data:{cwId:data.cwId},
							success:function (msg) {
								if (msg==="success"){
									alert("删除成功");
									window.location.reload();
								} else{
									alert("删除失败");
								}
							},
							error:function (msg) {
								layer.alert(msg);
							}
						}
					);
					layer.close(index);
				});
			}
		});
		$("#cx").click(function () {
			table.reload('workerTable',{
				url:'<%=path+"finance.data"%>'
				,where: { //设定异步数据接口的额外参数，任意设
					title:$('#title').val(),
					price1: $('#price1').val(),
					price2: $('#price2').val(),
					ddNumber: $('#ddNumber').val(),
					yhName:$('#yhName').val(),
					ddTime1:$('#ddTime1').val(),
					ddTime2:$('#ddTime2').val()
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
			// Layui表格,刷新当前分页数据
			// $(".layui-laypage-btn").click()
		});
	});


</script>
</body>
</html>

