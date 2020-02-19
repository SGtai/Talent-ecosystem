<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/16
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String othPath =application.getContextPath()+"/techS/other/";
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>电商学院</title>
	<link rel="stylesheet" type="text/css" href=<%=cssPath+"video.css"%> />
	<script src=<%=jsPath+"jquery.min.js"%> type="text/javascript" charset="utf-8"></script>
</head>

<body>
<%
	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = df.format(d);
%>



<div class="bg-grey">
	<div class="content">
		<a href="#">
			<h2 class="title">${cc.kcName}</h2></a>
		<p class="subtitle">${cc.msDescribe}</p>
		<div class="tab-block information-tab">
			<div class="tab-buttons ">
				<h3 class="tab-button cur" data-tab="one" style="width: 100%;">${ct.zjName}</h3>
			</div>
			<div class="tabs">
				<div class="tab-item active" id="tab-one">
					<div class="information-tab">

						<div class="information-left">
							<a href="#">
								<img src="${'/techS/other/'.concat(ct.zjPicture)}" width="500" height="340" alt="恰同学少年 加油！！！">
							</a>
							<div class="left-bottom">
								<div class="article-time">
									[当前时间：<%=now %>]
								</div>
							</div>
						</div>
						<div class="information-right" style="height:340px;width:640px;overflow:auto">
							<c:forEach items="${video}" var="node">
								<div class="article-list">
									<a href="/techvideo?id=${node.zjId}&name=${node.spName}&path=${node.spPath}" class="article-link">
										<div class="article-head">
											<span class="article-number">${node.spId}</span>
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
</div>

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
</script>

</body>
</html>
