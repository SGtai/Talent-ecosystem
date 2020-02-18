<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/schoolS/css/";
	String jsPath = application.getContextPath()+"/schoolS/js/";
	String path = application.getContextPath()+"/layui/";
	String othPath =application.getContextPath()+"/schoolS/other/";
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>菜鸟网后台高校注册</title>
	<link rel="stylesheet" href=<%=cssPath+"pintuer.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"admin.css"%>>
	<link rel="stylesheet" href="<%=path+"css/layui.css"%>" media="all">
</head>
<body>
<div class="panel admin-panel">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>请填写完整注册内容</strong></div>
	<div class="body-content">
		<form method="post" class="form-x" action="">
			<div class="form-group">
				<div class="label">
					<label>高校名称：</label>
				</div>
				<div class="field">
					<input type="text" id="scName" maxlength="20"  class="input w50" value="" name="scName" data-validate="required:请输入高校名称" />
					<div class="tips"></div>
				</div>
			</div>
	<div class="body-content">
			<div class="form-group">
				<div class="label">
					<label>法定代表人名称：</label>
				</div>
				<div class="field">
					<input type="text" id="scfdMan" class="input w50" value="" name="scfdMan" data-validate="required:请输入法定代表人名称" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>高校logo：</label>
				</div>
				<div class="field">
					<input type="file" id="scpicture"  name="file" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
					<input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
					<div class="tipss">图片尺寸：500*500</div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校简介：</label>
				</div>
				<div class="field">
					<textarea class="input" id="scAbout" name="scAbout" style=" height:90px;"></textarea>
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校地址：</label>
				</div>
				<div class="field">
					<input type="text" id="scAddress" class="input" name="scAddress" value=""/>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>经费来源：</label>
				</div>
				<div class="field" style="padding-top:8px;">
					国家、政府财政拨款 <input id="s1"  type="checkbox" />
					收取学杂费 <input id="s2"  type="checkbox" />
					社会或个人赞助、捐助 <input id="s3"  type="checkbox" />
					智力/技术有偿服务，创取收入 <input id="s4"  type="checkbox" />
					自办企业创取收入 <input id="s5"  type="checkbox" />
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>开办资金：</label>
				</div>
				<div class="field">
					<input type="text" id="kaibanMoney" class="input w50" value="" name="kaibanMoney" data-validate="required:请输入开办资金" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>举办单位：</label>
				</div>
				<div class="field">
					<input type="text" id="jubanDanwei" class="input w50" value="" name="jubanDanwei" data-validate="required:请输入单位名称" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>社会信用代码：</label>
				</div>
				<div class="field">
					<input type="text" id="xinyongDaima" class="input w50" value="" name="xinyongDaima" data-validate="required:请输入社会信用代码" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>联系方式：</label>
				</div>
				<div class="field">
					<input type="text" id="scPhone" class="input w50" value="" name="scPhone" data-validate="required:请输入联系方式" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校资料：</label>
				</div>
				<div class="field">
					<textarea name="scdata" id="scdata" class="input" style="height:450px; border:1px solid #ddd;"></textarea>
					<div class="tips"></div>
				</div>
<%--				<if condition="$iscid eq 1">--%>
<%--					<div class="form-group">--%>
<%--						<div class="label">--%>
<%--							<label>高校初始状态设置：</label>--%>
<%--						</div>--%>
<%--						<div class="field">--%>
<%--							<select name="cid" class="input w50">--%>
<%--								<option value="">请选择分类</option>--%>
<%--								<option value="">启用</option>--%>
<%--								<option value="">禁用</option>--%>
<%--							</select>--%>
<%--							<div class="tips"></div>--%>
<%--						</div>--%>
<%--					</div>--%>
			<div class="form-group">
				<div class="label">
					<label></label>
				</div>
				<div class="field" style="margin-left: 45%">
					<button class="button bg-main icon-check-square-o" type="button" onclick="reg2()"> 提交</button>
				</div>
			</div>
		</form>
	</div>
</div>

	<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
	<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
	<script src=<%=jsPath+"everything.js"%>></script>
	<script src=<%=path+"layui.js"%>></script>
	<script src=<%=path+"json2.js"%>></script>
</body>
</html>