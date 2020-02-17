<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/2/16
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String othPath =application.getContextPath()+"/techS/other/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>tab切换</title>
	<link href=<%=cssPath+"zjchapter.css"%> rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="case-container">
	<div class="case-index-title">
		<h2>${name}</h2>
		<a href="javascript:;">全部章节</a>
	</div>
	<div class="case-index-content">
		<ul class="clearfix">
			<c:forEach items="${ct}" var="node">
				<li class="case-example-item">
					<a href="/techc?id=${node.zjId}">
						<img src="${'/techS/other/'.concat(node.zjPicture)}" alt="" class="case-pad">
						<div class="case-item-info">
<%--							<div class="case-info-logo"><img src="images/logo-001.jpg" alt=""></div>--%>
							<div class="case-info-title">${node.zjName}</div>
							<div class="case-info-text">${node.msDescribe}</div>
						</div>

					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>
