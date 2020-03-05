<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/18
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String jsPath = application.getContextPath()+"/techS/js/";
	String layuiPath =application.getContextPath()+"/layui/";
%>
<html>
<head>
	<title>Title</title>

	<link rel="stylesheet" href=<%=layuiPath+"css/layui.css" %>>

</head>
<body style="height: 768px">

<form class="layui-form" action="" onsubmit="return false" id="uploadForm" method="post">
	<div class="layui-form-item">
	<label class="layui-form-label">类型选择</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="" id="selectType">
		<option value="" >请选择一个类型</option>
		<c:forEach items="${dl}" var="node">
			<option value=${node.deid}>${node.type}</option>
		</c:forEach>
	</select>
	</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">课程图片</label>
		<div class="layui-input-inline">
			<input type="text" name="title" required  lay-verify="required" placeholder="图片名称" readonly
			       id="tp"    autocomplete="off" class="layui-input">
		</div>
		<div class="layui-upload">
			<button type="button" class="layui-btn layui-btn-normal" id="test8">👉选择图片</button>

		</div>
		<div class="layui-form-item" style="position: absolute;margin-left: 30%;margin-top: -2.5%;">
			<button class="layui-btn" lay-submit="" lay-filter="upload" id="myUpload" style="margin-left: 50%;margin-top: -6%;">上传并保存</button>
		</div>
	</div>

	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">课程标题</label>
		<div class="layui-input-inline">
            <textarea placeholder="请输入课程标题" required  lay-verify="required" name="domTittle"
                      id="domTittle" class="layui-textarea" style="resize: none"></textarea>
		</div>
	</div>
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">课程简介</label>
		<div class="layui-input-inline">
            <textarea placeholder="请输入课程简介" required  lay-verify="required" name="fileInfo"
                      id="fileInfo" class="layui-textarea" style="resize: none"></textarea>
		</div>
	</div>
	<div class="layui-form-item layui-form-text" >
		<label class="layui-form-label">课程价格</label>
		<div class="layui-input-inline">
			<input type="text" required  lay-verify="required" name="title"  placeholder="请输入课程价格"
			       id="jg"     class="layui-input" oninput="value=value.replace(/[^\d]/g,'')">
		</div>
	</div>
	<div class="layui-upload" >
		<button type="button" class="layui-btn" id="tianjia" >添加章节</button>
	</div>


<%--	<div class="layui-form-item">--%>
<%--		<label class="layui-form-label">下载积分</label>--%>
<%--		<div class="layui-input-inline">--%>
<%--			<input type="text" name="downscore" required  lay-verify="required|number" placeholder="请输入下载积分"--%>
<%--			       id="downscore"    autocomplete="off" class="layui-input">--%>
<%--		</div>--%>
<%--	</div>--%>


	<div class="layui-upload" hidden>
		<button type="button" class="layui-btn" id="test9" >开始上传</button>
	</div>

	<img src="../../uploadS/other/sc.png"  alt="" style="position: absolute;margin-left: 41%;margin-top: -20%;" id="sc1">
</form>
</body>

<script type="text/html" id="chapter">
	<form class="layui-form" action="" onsubmit="return false" id="uploadFormS" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">章节图片</label>
			<div class="layui-input-inline">
				<input type="text" name="title" required  lay-verify="required" placeholder="图片名称" readonly
				       id="tpS"    autocomplete="off" class="layui-input">
			</div>
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test1">👉选择图片</button>

			</div>
			<div class="layui-form-item" style="position: absolute;margin-left: 75%;margin-top: -6.3%;">
				<button class="layui-btn" lay-submit="" lay-filter="upload" id="myUploadS">上传并保存</button>
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">章节标题</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入课程标题" required  lay-verify="required" name="domTittle"
                      id="domTittleS" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">章节简介</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入课程简介" required  lay-verify="required" name="fileInfo"
                      id="fileInfoS" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-upload" hidden>
			<button type="button" class="layui-btn" id="test2" >开始上传</button>
		</div>
		<div class="layui-upload" >
			<button type="button" class="layui-btn" id="voide" >添加视频</button>
		</div>
	</form>
	<img src="../../uploadS/other/sc.png" alt="" style="position: absolute;margin-left: 41%;margin-top: -20%;" id="sc2">
</script>

<script type="text/html" id="chapter2">
	<form class="layui-form" action="" onsubmit="return false" id="uploadFormS2" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">视频文件</label>
			<div class="layui-input-inline">
				<input type="text" name="title" required  lay-verify="required" placeholder="格式.webm/.mp4/.ogg" readonly
				       id="tpS2"    autocomplete="off" class="layui-input">
			</div>
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test12">👉选择视频</button>

			</div>
			<div class="layui-form-item" style="position: absolute;margin-left: 75%;margin-top: -6.3%;">
				<button class="layui-btn" lay-submit="" lay-filter="upload" id="myUploadS2">添加上传</button>
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">视频标题</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入视频标题" required  lay-verify="required" name="domTittle"
                      id="domTittleS2" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">视频简介</label>
			<div class="layui-input-inline">
            <textarea placeholder="请输入视频简介" required  lay-verify="required" name="fileInfo"
                      id="fileInfoS2" class="layui-textarea" style="resize: none"></textarea>
			</div>
		</div>
		<div class="layui-upload" hidden>
			<button type="button" class="layui-btn" id="test22" >开始上传</button>
		</div>
	</form>
	<img src="../../uploadS/other/sc.png" alt="" style="position: absolute;margin-left: 41%;margin-top: -20%;" id="sc3">
</script>
<script type="text/javascript" src=<%=jsPath + "jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath + "json2.js"%>></script>
<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath + "util.js"%>></script>
<script type="text/javascript" src=<%=jsPath + "upload.js"%>></script>
<script>
	var   kcid =null;
	var   zjId =null;
	var   spId =null;
</script>
</html>
