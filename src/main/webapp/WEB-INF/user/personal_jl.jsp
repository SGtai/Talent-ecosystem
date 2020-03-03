<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-27
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String cssPath = application.getContextPath()+"/userS/css/";
	String jsPath = application.getContextPath()+"/userS/js/";
	String path = application.getContextPath()+"/";
	String imagesPath =application.getContextPath()+"/homeS/images/";
	String dbimgPath =application.getContextPath()+"/images/";
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href=<%=cssPath+"personal.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<title>个人中心-我的简历</title>
</head>
<body>
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
		<div class="Account">
			<div class="Left">
				<div class="Info">
					<font>[${sessionScope.user.phone}]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="personal_updatepsd.html">修改密码</a></li>
							<li><a href="personal_updatenum.html">修改手机</a></li>
							<li><a href="javascript:void(0)" onclick="tuichu2()">退出</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="/user/index"><img src="<%=imagesPath+"logo_1.png"%>"/><img src="<%=imagesPath+"logo_2.png"%>" /></a></div>
		<div class="nav">
			<div class="navItem"><a href="/user/index">首页</a></div>
			<div class="navItem"><a href="/jump/home/searchJob">职位搜索</a></div>
			<a href="/techa">人才成长区</a>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href="/jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox active">
				<a href="/user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/user/shenqinglist">申请的职位</a></li>
				<li><a href="/user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="personal_mainshi.html">面试通知</a></li>
				<li><a href="personal_yaoqing.html">应聘邀请</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">菜鸟人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">我的简历</h1>
			<div class="dqzt">
				<label>当前状态：</label>
				<span>目前处于离职状态，可即刻上岗</span>
				<span class="jticon"></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="jianliBox">
			<table width="100%" border="0" cellpadding="0" cellspacing="5">
				<tbody>
			<c:if test="${jllist != null}">
				<c:forEach items="${jllist}" begin="0" var="i" varStatus="status">
				<tr>
					<td colspan="5">
						<div class="jlpart1">
							<div class="jlName"><a href="/jump/user/personal_jlsee?jlid=${i.jlId}">${i.jlname}</a></div>
							<div class="jlDate">更新时间：${i.scTime}</div>
							<div class="jlFresh">更新</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="61%">
						<div class="jlpart2">
							<div class="Orange" style="width:40px;"></div>
						</div>
						<div class="jlpart3">中文完整度 20 分 [ <a href="/user/gojlseeforupdate?jlid=${i.jlId}">修改</a>   <a href="/user/yulan?jlid=${i.jlId}">预览</a>   <a href="">下载</a>]</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<div class="red">0</div>
							<div class="tdname">被浏览</div>
						</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<c:if test="${i.ycHide == 0}">
								<div class="statusjl on"></div>
							</c:if>
							<c:if test="${i.ycHide == 1}">
								<div class="statusjl"></div>
							</c:if>
							<div class="tdname">简历</div>
						</div>
					</td>
					<td rowspan="2">
						<input hidden value="${i.jlId}" id="jlid">
						<a href="#" onclick="deletejl()">
						<div class="jlpart4">
							<div class="delicon"></div>
							<div class="tdname">删除</div>
						</div>
						</a>
					</td>
				</tr>
					<tr></tr>

				<tr>
					<td colspan="5">
						<div class="divline"></div>
					</td>
				</tr>
				</c:forEach>
			</c:if>

			
				</tbody>
			</table>
		</div>
		<div class="clear"></div>
		<div class="addJl">
			<a href="#" onclick="creatjl()">
				<input hidden id="jlcount" value="${jllist.size()}">
				<span>继续创建简历</span>
				<label>（还可创建${4-jllist.size()}份简历）</label>
			</a>
		</div>
		<div class="clear"></div>
		<div class="commonTit">
			<h1 class="fl">屏蔽公司</h1>
			<span class="ShieldTip">不允许包含屏蔽关键词的企业主动查看我的简历</span>
		</div>
		<div class="PBcom">
			<div class="PBcomtit">
				<span class="sp1">公司名称关键词：</span>
				<input name="" type="text" />
				<span class="sp2">看一下有哪些企业</span>
				<span class="sp3">屏蔽该关键词</span>
			</div>
			<div class="PBcomcon">
				<ul>
					<li>
						<span>[山东] </span>
						<a href="company.html">·爱玛客服务产业（中国）有限公司莱芜分公司</a>
					</li>
					<li>
						<span>[河北] </span>
						<a href="company.html">·秦皇岛市恒正会计服务有限公司</a>
					</li>
					<li>
						<span>[广西] </span>
						<a href="company.html">·南宁市瑞高文化商务服务中心</a>
					</li>
					<li>
						<span>[上海] </span>
						<a href="company.html">·上海点瀚展览服务有限公司</a>
					</li>
					<li>
						<span>[江苏] </span>
						<a href="company.html">·重庆天骄爱生活服务股份有限公司镇江分公司</a>
					</li>
					<li>
						<span>[江苏] </span>
						<a href="company.html">·苏州精确万分商务服务有限公司</a>
					</li>
					<li>
						<span>[山东] </span>
						<a href="company.html">·山东镇洋物业服务有限公司</a>
					</li>
					<li>
						<span>[河北] </span>
						<a href="company.html">·秦皇岛市恒正会计服务有限公司</a>
					</li>
					<li>
						<span>[广西] </span>
						<a href="company.html">·南宁市瑞高文化商务服务中心</a>
					</li>
					<li>
						<span>[上海] </span>
						<a href="company.html">·上海点瀚展览服务有限公司</a>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="PBpage1">
				<span>共50条 第1/5页</span>
			</div>
			<div class="PBpage2">
				<span class="sp1">上一页</span>
				<span class="sp2 on">1</span>
				<span class="sp2">2</span>
				<span class="sp2">3</span>
				<span class="sp2">4</span>
				<span class="sp2">5</span>
				<span class="sp1">下一页</span>
			</div>
		</div>
	</div>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">菜鸟人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />菜鸟人才网版权所有 <a href="">闽ICP证0******9号</a><a href="#"></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：200-8**-****</p>
</div>


<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal_jl.js"%>></script>
</body>
</html>
