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
	String layuiPath =application.getContextPath()+"/layui/";
//	String pathS = ResourceUtils.getURL("classpath:").getPath();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>tab切换</title>
	<link rel="stylesheet" href=<%=layuiPath+"css/layui.css" %>>
	<script src=<%=jsPath+"jquery.SuperSlide.2.1.1.js"%> type="text/javascript" charset="utf-8"></script>
	<link type="text/css" href=<%=cssPath+"styleS.css"%> rel="stylesheet" />
	<link href=<%=cssPath+"style.css"%> rel="stylesheet" type="text/css"/>
	<script src=<%=jsPath+"jquery.min.js"%> type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src=<%=jsPath+"jquery.min.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"jquery.SuperSlide.2.1.1.js"%>></script>
</head>
<body>
<div class="floor-course" style="height: 100%;">
	<div class="floor-content">
			<dl class="tab-rank" style="position: absolute;margin-top: 6.6%;margin-left: -4%;height: 100%;">
				<dt class="hd">
					<h3 class="on" style="
    width: 100%;"><a href="#">学习记录</a></h3>
				</dt>
				<dd class="bd">
					<ul class="ulList">
						<c:if test="${jl=='yes'}">
							<c:forEach items="${learningLogs}" var="node">
								<li >
									<span class="num">${node.jlId}</span>
									<div class="c">
										<div class="pubpic">
											<a href="/techvideo?id=${node.zjId}&name=${node.spName}&path=${node.spPath}&spId=${node.spId}&spDescribe=${node.spDescribe}">
												<img src="${'/techS/other/'.concat(node.zjPicture)}" /></a>
										</div>
										<div class="pubtitle">
											<a href="/techvideo?id=${node.zjId}&name=${node.spName}&path=${node.spPath}&spId=${node.spId}&spDescribe=${node.spDescribe}">
													${node.spName}:${node.spDescribe}
											</a>
											<p>${node.czTime}</p>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${jl=='no'}">
							<h>暂无学习记录</h>
						</c:if>
					</ul>
				</dd>
			</dl>
<%--		<div class="floor-side">--%>
<%--			<h3>--%>
<%--				<a href="#">技术·专区</a>--%>
<%--			</h3>--%>
<%--			<a href="#" class="floor-side-link">--%>
<%--				<img src=<%=othPath+"head-f.jpg"%> alt="">--%>
<%--			</a>--%>
<%--		</div>--%>
		<div class="floor-side-right">
			<div class="hd floor-side-list" >
				<ul>
					<li class="on">全部课程</li>
					<!-- 输出发展方向 -->
					<c:forEach items="${dl}" var="node">
							<li>${node.type}</li>
					</c:forEach>
					<li>我的课程</li>
				</ul>
<%--				<a href="#" class="slide-more">更多>></a>--%>
			</div>
			<form action="/techa" method="post"   accept-charset="UTF-8">
			<label class="layui-form-label" style="position: absolute;margin-left: 25%;width: 10%;">价格区间</label>
			<div class="layui-input-block" style="">
				<input type="text" name="lows" id="lows" oninput="value=value.replace(/[^\d]/g,'')"  placeholder="最低价" autocomplete="off" class="layui-input" style="position: absolute;width: 10%;margin-left: 30%;">
			</div>
			<div class="layui-input-block" style="">
				<label class="layui-form-label" style="position: absolute;margin-left: 38%;margin-top: -4.2%;">到</label>
				<input type="text" name="highs" id="highs" oninput="value=value.replace(/[^\d]/g,'')"  placeholder="最高价" autocomplete="off" class="layui-input" style="position: absolute;width: 10%;margin-left: 50%;margin-top: -4.2%;">
			</div>
			<div class="layui-input-block" style="">
				<input type="text" name="kcname" id="kcname"  placeholder="请输入课程名" autocomplete="off" class="layui-input" style="position: absolute;width: 20%;margin-left: 70%;margin-top: -8.5%;">
			</div>
			<button type="submit" class="layui-btn" style="position: absolute;margin-left: 98%;margin-top: -11.5%;" >查询</button>
			</form>
				<div class="bd floor-side-body" style="margin-top: -8%;">
				<c:forEach items="${getMap}" var="node">
					<ul>
					<c:forEach items="${node.value}" var="cl">
						<li>
							<a href="/techb?id=${cl.kcId}&name=${cl.kcName}&jg=${cl.jgPrice}&ms=${cl.msDescribe}">
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
                                           ${cl.plcsComment}

                                        </span>
									<span class="slide-body-price">
											<c:if test="${cl.jgPrice==0}">
												免费
											</c:if>
											<c:if test="${cl.jgPrice != 0}">
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
	<div id="rightArrow"><a href="javascript:;" title="在线客户"></a></div>
	<div id="floatDivBoxs">
		<div class="floatDtt">在线客服</div>
		<div class="floatShadow">
			<ul class="floatDqq">
				<li style="padding-left:0px;"><a target="_blank" href="tencent://message/?uin=981553511&Site=sc.chinaz.com&Menu=yes"><img src="/techS/other/qq.png" align="absmiddle">&nbsp;&nbsp;在线客服1号</a></li>
				<li style="padding-left:0px;"><a target="_blank" href="tencent://message/?uin=844893039&Site=sc.chinaz.com&Menu=yes"><img src="/techS/other/qq.png" align="absmiddle">&nbsp;&nbsp;在线客服2号</a></li>
				<li style="padding-left:0px;"><a target="_blank" href="tencent://message/?uin=315057742&Site=sc.chinaz.com&Menu=yes"><img src="/techS/other/qq.png" align="absmiddle">&nbsp;&nbsp;在线客服3号</a></li>
			</ul>
			<div class="floatDtxt">热线电话</div>
			<div class="floatDtel"><img src="/techS/other/online_phone.jpg" width="155" height="45" alt=""></div>
			<div style="text-align:center;padding:10PX 0 5px 0;background:#EBEBEB;"><img src="/techS/other/wap_ico.jpg"><br>微信公众账号</div>
		</div>
		<div class="floatDbg"></div>
	</div>
</div>

<script type="text/javascript">
	var flag=1;
	$('#rightArrow').click(function(){
		if(flag==1){
			$("#floatDivBoxs").animate({right: '-175px'},300);
			$(this).animate({right: '-5px'},300);
			$(this).css('background-position','-50px 0');
			flag=0;
		}else{
			$("#floatDivBoxs").animate({right: '0'},300);
			$(this).animate({right: '170px'},300);
			$(this).css('background-position','0px 0');
			flag=1;
		}
	});
</script>
<script type="text/javascript">
	jQuery(".floor-side-right").slide({
		effect: "fade",
		autoPlay: false,
		trigger: "mouseover",
		delayTime: 700
	});
	<%--var xx  ='${xx}' ;--%>
	<%--if (xx.length>0){--%>
	<%--	alert(xx);--%>
	<%--}--%>
</script>

<script type="text/javascript">
	jQuery(".tab-rank li").hover(function(){ jQuery(this).addClass("on").siblings().removeClass("on")},function(){ });
	jQuery(".tab-rank").slide({ titCell:"dt h3", mainCell:"dd",autoPlay:false,effect:"left",delayTime:300 });
</script>
</body>

</html>
