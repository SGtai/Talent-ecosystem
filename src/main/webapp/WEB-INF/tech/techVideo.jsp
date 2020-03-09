<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/17
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	String path = application.getContextPath()+"/";
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String layuiPath =application.getContextPath()+"/layui/";
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>视频播放</title>
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href=<%=cssPath+"video.css"%> />
	<link rel="stylesheet" href=<%=layuiPath+"css/layui.css" %>>
	<script src=<%=jsPath+"jquery.min.js"%> type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src=<%=jsPath + "jquery-3.4.1.js"%>></script>
	<script type="text/javascript" src=<%=jsPath + "json2.js"%>></script>
	<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
	<script type="text/javascript" src=<%=jsPath + "util.js"%>></script>
</head>

<body>
<div class="content">
	<div class="tab-block information-tab" style="width: 100%;position: absolute;height: 80%;margin-left: -10%;">
		<div class="tab-buttons ">
			<h3 class="tab-button cur" data-tab="one" style="width: 100%;">${name}</h3>
		</div>
		<div class="tabs">
			<div class="tab-item active" id="tab-one">
				<div class="information-tab">

					<div class="information-left" style="width: 55%;height: 85%;position: absolute;">
						<video style="width: 100%;height: 100%;position: absolute;" muted="muted" controls autoplay  >
							<source type="${'video/'.concat(suffix)}" src=<%=path%>${'uploadS/other/video/'.concat(path)} >
							<object width="320" height="240" data=<%=path%>${'uploadS/other/video/'.concat(path)} >
								<embed width="320" height="240" src=<%=path%>${'uploadS/other/video/'.concat(name)}${'.swf'}>
							</object>
						</video>
					</div>
					<div class="information-right" style="height:440px;width:640px;overflow:auto">

						<c:forEach items="${video}" var="node">
							<a class="layui-btn layui-btn-xs mydown" href = "javascript:void(0);" onclick ="down('${node.spPath}')">下载视频${node.spName}</a>
							<div class="article-list">
								<a class="article-link" href=<%=path%>techvideo?id=${node.zjId}&name=${node.spName}&path=${node.spPath}&spId=${node.spId}&spDescribe=${node.spDescribe} >
									<div class="article-head">
										<span class="article-number">${node.sort}</span>
										<span class="article-title">${node.spName}</span>
									</div>
									<div class="article-content">
										<p>${node.spDescribe}</p>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<div class="layui-form-item layui-form-text" style="position: absolute;margin-top: 45%;margin-left: 25%;width: 1000px;">
	<div class="layui-input-inline" style="width: 60%;">
<%--		<input type="text"  name="pl"  placeholder="请输入评论"--%>
<%--		       id="pl"     class="layui-input" >--%>
		<textarea name="pl" id="pl" rows="10" cols="30" style="height:50%;width: 100%;" aria-label="editor" placeholder="请输入评论"></textarea>
	</div>
</div>
<div class="layui-form-item" style="position: absolute;margin-top: 55%;margin-left: 77%;">
	<button class="layui-btn" lay-submit="" lay-filter="upload" id="myUpload" onclick="release()">发布评论</button>
</div>
<div class="article-container" style="position: absolute;margin-top: 65%;margin-left: 20%;">
<h1>评论区</h1>
	<hr>
	<h2>${tips}</h2>
	<div class="comment" id="content">
		<c:forEach items="${com}" var="node">
			<div class="imgdiv">
				<img class="imgcss"  src=<%=path%>${'uploadS/images/'.concat(node.assess.yhPicture)}/>
			</div>
			<div class="conmment_details">
				<div style="float:left;">
<%--					<%String datetime1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format("${node.assess.plTime}"); %>--%>
<%--					<%=datetime1%>--%>
					<span class="comment_name">${node.assess.yhName} </span>     <span>
	<fmt:formatDate value="${node.assess.plTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>

</span>

				</div>
				<div class="del">
					<a  class="a_hover" href = "javascript:void(0);" onclick ="look(${node.assess.pjId})">查看回复</a>
					<a class="a_hover" href = "javascript:void(0);" onclick ="help(${node.assess.pjId},${node.assess.dzcs})">&nbsp;&nbsp;&nbsp;👍赞(${node.assess.dzcs})</a>
					<a class="a_hover" href = "javascript:void(0);" onclick ="eva(${node.assess.pjId},'${node.assess.yhName}')"> &nbsp;&nbsp;&nbsp;评价</a>
				</div>
				<div class="comment_content" >  ${node.assess.pjEvaluate}
				</div>
			</div>
			<div class="reply_listS" id="${node.assess.pjId}">   <!--style="display:none;"-->

				<c:forEach items="${node.aryR}" var="nodes">
					<c:if test="${nodes.dfId == user.yhid}">
						<div class="reply" >
							<img class="imgcss" style="width: 5%;height: 5%;" src=<%=path%>${'uploadS/images/'.concat(nodes.dfPicture)} />
							<span class="comment_name">${nodes.dfName}</span>回复<span class="comment_name">${nodes.dxName}</span> <span><fmt:formatDate value="${nodes.dfTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></span>：<span class="reply_content">${nodes.nrContent} </span>
						</div>
					</c:if>
					<c:if test="${nodes.dfId != user.yhid}">
						<div class="reply" >
							<img class="imgcss"  style="width: 5%;height: 5%;" src=<%=path%>${'uploadS/images/'.concat(nodes.dfPicture)} />
							<span class="comment_name">${nodes.dfName}</span>回复<span class="comment_name">${nodes.dxName}</span> <span><fmt:formatDate value="${nodes.dfTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></span>：<span class="reply_content">${nodes.nrContent} </span>
								<a  data-id="1" class="del_reply">
									<i class="icon layui-icon" >    <a class="a_hover" href = "javascript:void(0);" onclick ="eva(${node.assess.pjId},'${nodes.dfName}')">            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复</a></i>
								</a>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${empty node.aryR}"><h2 style="margin-left: 44%;color: crimson;">暂无回复</h2></c:if>
			</div>
			<hr>
		</c:forEach>


			</div>

			<hr>
<%--			<div class="comment_add_or_last" >--%>
<%--				点击加载更多评论--%>
<%--			</div>--%>
<%--			<hr>--%>
		</div>
	</div>
	</div>
<form action=<%=path+"techvideo"%> method="get" id="myForm">
	<input type="hidden" value="" name="nr" id="nr">
	<input type="hidden" value="${name}" name="name" id="name">
	<input type="hidden" value="${path}" name="path" id="path">
	<input type="hidden" value="${spId}" name="spId" id="spId">
	<input type="hidden" value="${id}" name="id" id="id">
	<input type="hidden" value="" name="pjId" id="pjId">
	<input type="hidden" value="" name="cs" id="cs">
	<input type="hidden" value="" name="dxName" id="dxName">
	<input type="hidden" value="" name="dfnr" id="dfnr">
	<input type="hidden" value="" name="fName" id="fName">
</form>
<script type="text/javascript">
	//tab切换
	$('.tab-button').click(function() {
		var tab = $(this).data('tab')
		$(this).addClass('cur').siblings('.tab-button').removeClass('cur');
		$('#tab-' + tab + '').addClass('active').siblings('.tab-item').removeClass('active');
	});
	//新闻列表切换
	$('.information-tab .article-list').hover(function() {
		$(this).addClass('current').siblings('.article-list').removeClass('current');
	}, function() {
		$(this).parent('.information-right').find('.article-list:first-of-type').addClass('current').siblings('.article-list').removeClass('current');
	});
	var ny  ='${notify}';
	if (ny.length>0){
		alert(ny);
	}
	<c:forEach items="${com}" var="node">
	$("#${node.assess.pjId}").hide();
	</c:forEach>
	//查看回复
	function look(name){
		if($("#"+name).is(':hidden')){
			$("#"+name).show();
			//如果隐藏时。。。
		}else{
			$("#"+name).hide();
			//如果显示时。。。
		}
	}
	function help(pjId,cs){
		$("#pjId").val(pjId);
		$("#cs").val(cs);
		$("#myForm").submit();
	}
	function release(){
		if ($("#pl").val().length==0){
			alert("你未输入评论");
		} else{
			alert("评论成功！！！");
			$("#fName").val("");
			$("#nr").val($("#pl").val());
			$("#myForm").submit();
		}
	}
	function eva(pjId,dxName){
		var pass = prompt("请输入评价内容","");
		if (pass!=null && pass!="")
		{
			$("#dfnr").val(pass);
			$("#pjId").val(pjId);
			$("#dxName").val(dxName);
			$("#cs").val("");
			$("#myForm").submit();
		}else if(pass==null) {

		}else{
			alert("你输入为空，请重新输入！");
		}
	}
	function down(fName){
		if (confirm('确认下载吗？？')) {
			$("#fName").val(fName);
			$("#myForm").submit();
		}
	}
	var warning = '${warning}';
	if (warning.length>0){
		alert(warning);
	}
</script>
</body>
</html>