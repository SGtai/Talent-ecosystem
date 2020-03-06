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

%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href=<%=cssPath+"personal.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<title>个人中心-我的简历</title>
</head>
<body>
<input hidden value="<%=path%>" id="path">
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
							<li><a href="<%=path%>jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="javascript:void(0)" onclick="tuichu2('<%=path%>')">退出</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="nav">
			<div class="navItem"><a href="<%=path%>">首页</a></div>
			<div class="navItem"><a href="<%=path%>jump/home/searchJob">职位搜索</a></div>
			<div class="navItem"><a href="<%=path%>techa">人才成长区</a></div>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href="<%=path%>jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox active">
				<a href="<%=path%>user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="<%=path%>jump/user/myschooll" class="a3">我的校友</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="<%=path%>user/shenqinglist">申请的职位</a></li>
				<li><a href="<%=path%>user/shoucanglist">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="<%=path%>user/mianshi">面试通知</a></li>
				<li><a href="<%=path%>user/yaoyue">应聘邀请</a></li>
			</ul>
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
							<div class="jlName"><a href="<%=path%>jump/user/personal_jlsee?jlid=${i.jlId}">${i.jlname}</a></div>
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
						<div class="jlpart3">中文完整度 20 分 [ <a href="<%=path%>user/gojlseeforupdate?jlid=${i.jlId}">修改</a>   <a href="<%=path%>user/yulan?jlid=${i.jlId}">预览</a>]</div>
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
						<a href="#" onclick="deletejl('<%=path%>')">
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
			<a href="#" onclick="creatjl('<%=path%>')">
				<input hidden id="jlcount" value="${jllist.size()}">
				<span>继续创建简历</span>
				<label>（还可创建${4-jllist.size()}份简历）</label>
			</a>
		</div>
		<div class="clear"></div>
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
