<%--<%@ page import="org.springframework.util.ResourceUtils" %>&lt;%&ndash;--%>
<%-- Created by IntelliJ IDEA.
 User: 86135
 Date: 2020/2/16
 Time: 15:39
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String cssPath = application.getContextPath()+"/techS/css/";
	String jsPath = application.getContextPath()+"/techS/js/";
	String path = application.getContextPath();
	String othPath =application.getContextPath()+"/techS/other/";
//	String pathS = ResourceUtils.getURL("classpath:").getPath();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>tab切换</title>
	<link href=<%=cssPath+"style.css"%> rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src=<%=jsPath+"jquery.min.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"jquery.SuperSlide.2.1.1.js"%>></script>
</head>
<body>

<div class="floor-course">
	<div class="floor-content">
		<div class="floor-side">
			<h3>
				<a href="#">技术·专区</a>
			</h3>
			<a href="#" class="floor-side-link">
				<img src=<%=othPath+"head-fl.jpg"%> alt="">
			</a>
		</div>
		<div class="floor-side-right">
			<div class="hd floor-side-list">
				<ul>
					<!-- 输出发展方向 -->
					<c:forEach items="${dl}" var="node">

						<c:if test="${node.deid == 1}">
							<li class="on">${node.type}</li>
						</c:if>
						<c:if test="${node.deid != 1}">
							<li>${node.type}</li>
						</c:if>
					</c:forEach>

				</ul>
				<a href="#" class="slide-more">更多>></a>
			</div>
			<div class="bd floor-side-body">
				<c:forEach items="${getMap}" var="node">
					<ul>
					<c:forEach items="${node.value}" var="cl">
						<li>
							<a href="#">
								<div class="image-ti">
									<img src="${'/techS/other/'.concat(cl.ckPicture)}" alt="">
								</div>
								<p class="slide-title">${cl.kcName}</p>
								<p class="slide-body">
                                        <span class="slide-body-nub">
                                            <i class="slide-body-nub-icon"></i>
                                           ${cl.gmcsPurchase}

                                        </span>
									<span class="slide-body-nup">
                                            <i class="slide-body-nup-icon"></i>
                                           ${cl.cxcsConsult}

                                        </span>
									<span class="slide-body-price">
											<c:if test=" ${cl.jgPrice == '免费'}">
												免费
											</c:if>
											<c:if test="${cl.jgPrice != '免费'}">
												¥${cl.jgPrice}
											</c:if>
										</span>
								</p>
							</a>
						</li>
					</c:forEach>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(".floor-side-right").slide({
		effect: "fade",
		autoPlay: false,
		trigger: "mouseover",
		delayTime: 700
	});
</script>

</body>
</html>
