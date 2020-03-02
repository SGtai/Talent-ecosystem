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
							<li><a href="personal_renzheng.html">修改邮箱</a></li>
							<li><a href="index.html">退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="Left">
				<a class="Mobile" href="">手机版</a>
			</div>
			<div class="Left">
				<div class="Weixin">微信
					<div id="WeixinPopup">
						<img src="<%=imagesPath+"showqrcode.jpg"%>" width="120" height="120">
						<p>扫一扫完成绑定<br>求职信息接收及时，<br>不再错过好工作！</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src="<%=imagesPath+"logo_1.png"%>"/><img src="<%=imagesPath+"logo_2.png"%>" /></a></div>
		<div class="nav">
			<div class="navItem"><a href="index.html">首页</a></div>
			<div class="navItem"><a href="searchJob.html">职位搜索</a></div>
			<div class="navItem"><a href="meetingJob.html">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="jobnews.html">就业资讯</a></li>
							<li><a href="download.html">文档下载</a></li>
							<li><a href="helpJob.html">求职互助</a></li>
						</ul>
					</div>
				</div>
			</div>
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
				<a href="/jump/user/personal_jl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_zwss.html" class="a3">职位搜索</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_cai.html" class="a4">你的菜儿</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="personal_sqzw.html">申请的职位</a></li>
				<li><a href="personal_mygz.html">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="personal_mainshi.html">面试通知</a></li>
				<li><a href="personal_yaoqing.html">应聘邀请</a></li>
				<li><a href="personal_whogz.html">谁在关注我</a></li>
				<li><a href="personal_goutong.html">在线沟通记录</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="personal_zhanghu.html" class="a7">账户管理</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
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
							<div class="jlName"><a href="/jump/user/personal_jlsee">${i.jlname}</a></div>
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
						<div class="jlpart3">中文完整度 20 分 [ <a href="/jump/user/personal_jlsee">修改</a>   <a href="/user/yulan?jlid=29">预览</a>   <a href="">下载</a> ]</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<div class="red">0</div>
							<div class="tdname">被浏览</div>
						</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<div class="statusjl on"></div>
							<div class="tdname">姓名已公开</div>
						</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<div class="statusjl on"></div>
							<div class="tdname">简历已公开</div>
						</div>
					</td>
					<td rowspan="2">
						<div class="jlpart4">
							<div class="delicon"></div>
							<div class="tdname">删除</div>
						</div>
					</td>
				</tr>

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
			<a href="/user/gojl">
				<span>继续创建简历</span>
				<label>（还可创建2份简历）</label>
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
	<p><a href="">**人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>


<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
</body>
</html>
