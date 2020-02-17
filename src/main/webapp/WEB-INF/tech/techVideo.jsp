<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/17
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String othPath =application.getContextPath()+"/techS/other/";
	String videoPath =application.getContextPath()+"/techS/other/video";
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>视频播放</title>
	<link rel="stylesheet" type="text/css" href=<%=cssPath+"video.css"%> />
	<script src=<%=jsPath+"jquery.min.js"%> type="text/javascript" charset="utf-8"></script>
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
							<!-- <source src="movie.ogg" type="video/ogg"> -->
							<source src="${'/techS/other/video/'.concat(path)}" type="${'video/'.concat(suffix)}">
							<!-- <source src="movie.webm" type="video/webm"> -->
							<object data="${'/techS/other/video/'.concat(path)}" width="320" height="240">
								<embed width="320" height="240" src="${'/techS/other/video/'.concat(name)}${'.swf'}">
							</object>
						</video>
					</div>
					<div class="information-right" style="height:440px;width:640px;overflow:auto">

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