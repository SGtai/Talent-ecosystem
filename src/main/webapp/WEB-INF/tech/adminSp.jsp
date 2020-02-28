<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/22
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = application.getContextPath()+"/";
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String othPath =application.getContextPath()+"/techS/other/";
	String videoPath =application.getContextPath()+"/techS/other/video";
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
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 21%;font-size: 17px;">视频标题</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="text" id="title" name="title" required  lay-verify="required" placeholder="请输入章节标题" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 41%;font-size: 17px;">所属章节</label>
	<div class="layui-input-block" style="margin-left: 49%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="text" id="kcId" name="kcId" required  lay-verify="required" placeholder="请输入课程ID" autocomplete="off" class="layui-input" >
	</div>
</div>
<button type="button" class="layui-btn" style="position: absolute;margin-top: -4%;margin-left: 65%;" id="cx">查询</button>
<div style="margin-left: 12%;margin-top: 12%;">
	<table id="demo" lay-filter="test"></table>
</div>

<script src="<%=layuiPath+"layui.js"%>"></script>
<script src="<%=layuiPath+"layui.all.js"%>"></script>
<script type="text/javascript" src=<%=jsPath + "json2.js"%>></script>
<script src="<%=layuiPath+"lay/modules/layer.js"%>"></script>
<script src=<%=jsPath+"jquery-3.4.1.js"%>></script>
<script src=<%=jsPath+"util.js"%>></script>
<script type="text/html" id="chapter">
	<form class="layui-form" action="" onsubmit="return false" id="uploadFormS" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">视频文件</label>
			<div class="layui-input-inline">
				<input type="text" name="title" required  lay-verify="required" placeholder="格式.webm/.mp4/.ogg" readonly
				       id="tpS"    autocomplete="off" class="layui-input">
			</div>
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test1">👉选择视频</button>

			</div>
			<div class="layui-form-item" style="position: absolute;margin-left: 44%;margin-top: 45%;">
				<button class="layui-btn" lay-submit="" lay-filter="upload" id="myUploadS">上传并修改</button>
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">视频标题</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入视频标题" required  lay-verify="required" name="domTittle"
                      id="domTittleS" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">视频简介</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入视频简介" required  lay-verify="required" name="fileInfo"
                      id="fileInfoS" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-upload" hidden>
			<button type="button" class="layui-btn" id="test2" >开始上传</button>
		</div>
	</form>
	<img src=<%=othPath+"sc.png"%> alt="" style="position: absolute;margin-left: 41%;margin-top: -20%;" id="sc2">
</script>

<script type="text/html" id="toolbar2">
	<%--	{{# if(d.astate == 0){  }}--%>
	<a class="layui-btn layui-btn-sm background-style" lay-event="doctor">修改数据</a>
	<a class="layui-btn layui-btn-sm background-style" lay-event="info">删除</a>
	<%--	{{# }else if(d.astate == 1){             }}--%>
	<%--	<a class="layui-btn layui-btn-sm background-style" lay-event="info">查看详情</a>--%>
	<%--	<a class="layui-btn layui-btn-sm background-style" lay-event="doctor">查看咨询师</a>--%>
	<%--	{{# }else{             }}--%>
	<%--	数据错误--%>
	<%--	{{#      }      }}--%>
</script>

<script>
	layui.use('table', function(){
		var table = layui.table;
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 277
			,width: 1153
			,url: '<%=path+"video.data"%>' //数据接口
			,limit:5
			,page: true //开启分页
			,cols: [[ //表头
				{field: 'spId', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'spName', title: '视频标题', width:180}
				,{field: 'spDescribe', title: '视频描述', width:237
				}
				,{field: 'spPath', title: '视频路径名', width: 197, sort: true}
				,{field: 'zjId', title: '所属章节ID', width:167, sort: true}

				,{field: 'statusid', title: '操作', width: 277,toolbar: '#toolbar2'}
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
							url:'<%=path+"deleteSp"%>',
							dataType:"text",
							data:{spId:data.spId},
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
			if(layEvent === 'doctor'){
				layer.confirm('确定修改数据？',function (index)
				{
					layui.use(['layer', 'table', 'form'], function () {
						var $ = layui.$;
						var layer = layui.layer;
						var form = layui.form;
						layer.msg('修改章节信息');
						var myAssess = layer.open({
							type: 1,//嵌入网页
							content: $('#chapter').html(),
							area: ['600px', '430px'],
							title: '修改章节信息',
						});
						form.render();
						$("#sc2").hide();
						$(function () {
							layui.use('upload', function () {
								var $ = layui.jquery
									, upload = layui.upload;
//选完文件后不自动上传
								upload.render({
									elem: '#test1'
									, url: '<%=path+"upSpData"%>'
									, auto: false
									, accept: 'file' //普通文件
									//,multiple: true
									, bindAction: '#test2'
									, before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
										this.data = {
											id: data.spId,
											name: $("#domTittleS").val(),
											xx: $("#fileInfoS").val()
										}
									}
									, choose: function (obj) {
										var files = this.files = obj.pushFile();
										obj.preview(function (index, file, result) {
											if (isVoide(file.name)) {
												$("#tpS").val(file.name);
											}else{
												$("#tpS").val(file.name);
												alert("格式不对可能导致视频显示异常!!!");
											}

										})
									}
									, done: function (res) {
										if (res.code == 0) {
											$("#sc2").hide();
											$("#domTittleS").disabled="disabled";
											$("#fileInfoS").disabled="disabled";
											layer.close(index);
											alert("上传并修改成功!!!");
											window.location.reload();
										}else{
											alert("服务器异常");
											window.location.reload();
										}
									}
								});
							});
							layui.use('form', function () {
								var form = layui.form;
								form.on('submit(upload)', function (data) {
									$("#sc2").show();
									$('#test2').click();
								})
							})
						});

					});
					layer.close(index);
				});
			}
		});

		$("#cx").click(function () {
			table.reload('workerTable',{
				url:'<%=path+"video.data"%>'
				,where: { //设定异步数据接口的额外参数，任意设
					title:$('#title').val(),
					kcId: $('#kcId').val()
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
			// Layui表格,刷新当前分页数据
			// $(".layui-laypage-btn").click()
		});
	});
	function isRealNum(val){
		// isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除
		if(val === "" || val ==null){
			return false;
		}
		if(!isNaN(val)){
			return true;
		}else{
			return false;
		}
	}
	//图片文件的后缀名
	var imgExt = new Array(".png",".jpg",".jpeg",".bmp",".gif");

	//视频文件的后缀名
	var voideExt = new Array(".ogg",".mp4",".webm");
	//判断Array中是否包含某个值
	Array.prototype.contain = function(obj){
		for(var i=0; i<this.length; i++){
			if(this[i] === obj)
				return true;
		}
		return false;
	};

	//获取文件名后缀名
	String.prototype.extension = function(){
		var ext = null;
		var name = this.toLowerCase();
		var i = name.lastIndexOf(".");
		if(i > -1){
			var ext = name.substring(i);
		}
		return ext;
	}

	//判断是否图片文件
	function isImg(filename){
		var ext = filename.extension();
		if(imgExt.contain(ext)){
			return true;
		}
		return false;
	}

	//判断是否视频文件
	function isVoide(filename){
		var ext = filename.extension();
		if(voideExt.contain(ext)){
			return true;
		}
		return false;
	}
</script>
</body>
</html>
