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
					<input type="text" id="scName"  class="input w50" value="" name="scName" data-validate="required:请输入高校名称" maxlength="30"/>
					<div class="tips"></div>
				</div>
			</div>
	<div class="body-content">
			<div class="form-group">
				<div class="label">
					<label>法定代表人名称：</label>
				</div>
				<div class="field">
					<input type="text" id="scfdMan" class="input w50" value="" name="scfdMan" data-validate="required:请输入法定代表人名称" maxlength="20" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>高校logo：</label>
				</div>
				<div class="field">
					<input type="text" id="scpicture" readonly  name="file"  class="input w50"  style="width:25%; float:left;"   data-toggle="hover" data-place="right"  />
					<input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;" onclick="regupload()">
					<input type="hidden" id="hidden" value="no">
					<div class="tipss">图片尺寸：500*500</div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校简介：</label>
				</div>
				<div class="field">
					<textarea class="input" id="scAbout" name="scAbout" style=" height:90px;" maxlength="200"></textarea>
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校地址：</label>
				</div>
				<div class="field">
					<input type="text" id="scAddress" class="input" name="scAddress" value="" maxlength="30"/>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>经费来源：</label>
				</div>
				<div class="field" style="padding-top:8px;">
					国家、政府财政拨款 <input id="s1"  type="checkbox" value="国家、政府财政拨款" />
					收取学杂费 <input id="s2"  type="checkbox" value="收取学杂费"/>
					社会或个人赞助、捐助 <input id="s3"  type="checkbox" value="社会或个人赞助、捐助" />
					智力、技术有偿服务 <input id="s4"  type="checkbox" value="智力、技术有偿服务" />
					自办企业创取收入 <input id="s5"  type="checkbox" value="自办企业创取收入" />
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>开办资金：</label>
				</div>
				<div class="field">
					<input type="text" id="kaibanMoney" class="input w50" value=""  data-validate="required:请输入开办资金" onkeyup="this.value=this.value.replace(/\D/g,'')" />元(人民币)
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>举办单位：</label>
				</div>
				<div class="field">
					<input type="text" id="jubanDanwei" class="input w50" value=""  data-validate="required:请输入单位名称" maxlength="25" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>社会信用代码：</label>
				</div>
				<div class="field">
					<input type="text" id="xinyongDaima" class="input w50" value=""  data-validate="required:请输入社会信用代码" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>联系方式：</label>
				</div>
				<div class="field">
					<input type="text" id="scPhone" class="input w50"   data-validate="required:请输入联系方式" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>学校资料：</label>
				</div>
				<div class="field">
					<textarea  id="scdata" class="input" style="height:450px; border:1px solid #ddd;"></textarea>
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label></label>
				</div>
				<div class="field" style="margin-left: 45%">
					<button class="button bg-main icon-check-square-o" type="button"  onclick="reg2()"> 提交</button>
				</div>
			</div>
		</form>
	</div>
</div>

<form action="" class="layui-form" method="post">
	<input type="hidden" id="jinqianly">
	<input type="text" name="file"  required="" lay-verify="required" placeholder="文档名称" readonly="" id="filename" autocomplete="off" class="layui-input">
	<button type="button" class="layui-btn" style="position: absolute;visibility: hidden" id="upload"></button>
</form>
<script type="text/javascript" src=<%=jsPath+"jquery.js"%>></script>
<script type="text/javascript" src=<%=path+"jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"pintuer.js"%>></script>
<script src=<%=jsPath+"everything.js"%>></script>
<script src=<%=path+"layui.js"%>></script>
<script src=<%=path+"json2.js"%>></script>
<script>
	layui.use(['form','layer','jquery','upload'], function(){
		var upload = layui.upload;
		var form = layui.form;
		var $ = layui.jquery;
		var layer  = layui.layer;
	upload.render({
		elem: '#upload' //绑定元素
		,url: '/school/reg2' //上传接口
		,multiple:false //设置是否多文件上传
		,auto: false  //取消自动上传，并指定提交按钮进行上传
		,bindAction: '#btn' //这个绑定id为btn的按钮触发这个提交
		,accept: 'file' //允许上传的文件类型
		,before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
			this.data = {
				scName:document.getElementById("scName").value,
				scdata:document.getElementById("scdata").value,
				scAddress:document.getElementById("scAddress").value,
				scfdMan:document.getElementById("scfdMan").value,
				moneyLaiyuan:document.getElementById("jinqianly").value,
				kaibanMoney:document.getElementById("kaibanMoney").value,
				jubanDanwei:document.getElementById("jubanDanwei").value,
				xinyongDaima:document.getElementById("xinyongDaima").value,
				scAbout:document.getElementById("scAbout").value,
				scPhone:document.getElementById("scPhone").value
			}
		}
		,choose: function (obj) {
			var files = this.files = obj.pushFile();//需要上传的这个文档对象
			obj.preview(function (index, file, result) {
				$("#scpicture").val(file.name);
				$("#filename").val(file.name);
			})
		}
		,done: function(msg){
			if(msg==="0"){
				alert("注册失败,该账号已经被其他管理员注册了");
			}else if(msg==="-1"){
				alert("注册失败，手机号码已经被注册");
			}else if(msg==="-2"){
				alert("注册失败，社会信用代码已经被注册")
			}
			else if(msg==="1"){
				alert("注册成功");
				$("#scName").val("");
				$("#scdata").val("");
				$("#scAddress").val("");
				$("#scfdMan").val("");
				$("#kaibanMoney").val("");
				$("#jubanDanwei").val("");
				$("#xinyongDaima").val("");
				$("#scAbout").val("");
				$("#scPhone").val("");
				$("#s1").prop.checked("checked",false);
				$("#s2").prop.checked("checked",false);
				$("#s3").prop.checked("checked",false);
				$("#s4").prop.checked("checked",false);
				$("#s5").prop.checked("checked",false);
			}
		}
		,error: function(){
			//请求异常回调
		}
	});
	});
</script>
</body>

</html>