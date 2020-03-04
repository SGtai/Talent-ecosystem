<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-27
  Time: 11:35
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
							<li><a href="/jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="/jump/user/personal_updatenum">修改手机</a></li>
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
			<div class="NavLeftBox active">
				<a href="/jump/user/personal" class="a1">会员首页</a>
			</div>
			<div class="NavLeftBox">
				<a href="/user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="" class="a3">我的校友</a>
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
				<li><a href="/jump/user/personal_mainshi">面试通知</a></li>
				<li><a href="/jump/user/personal_yaoqing">应聘邀请</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_help" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">菜鸟人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<form id="jl1" class="layui-form">
	<div class="perRightcon layui-form">
		<div class="JlBoxTit">
			<div class="tit2"></div>
		</div>
		<div class="JlBoxCon layui-form">
			<h1><span>基本信息</span><div></div></h1>
			<div class="JlBoxLeft">
				<div class="jldiv layui-form">
					<div class="nametxt"><span>*</span>姓    名：</div>
					<div class="inputtxt">
						<input name="name" type="text" class="txt1"
						value=
							<c:if test="${sessionScope.user.name != null}">
									value="${sessionScope.user.name}"
							</c:if>
						/>
						<span class="check1"></span>
						<span class="ycname">隐藏姓名</span>
					</div>
					<div class="clear"></div>
				</div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>性    别：</div>
					<div class="layui-input-inline">
						<select name="sex" lay-filter="sex">
							<option value=""></option>
							<c:if test="${sessionScope.user.sex == null}">
								<option value="男">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${sessionScope.user.sex == '男'}">
								<option value="男" selected="">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${sessionScope.user.sex == '女'}">
								<option value="男">男</option>
								<option value="女" selected="">女</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>出生年月：</div>
					<div class="layui-input-inline">
						<input id="birthday" name="birthday" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"
						       value=
						       <c:if test="${sessionScope.user.birthday != null}">
								       value="${sessionScope.user.birthday}"
								</c:if>
						>
					</div>
				</div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>证件类型：</div>
					<div class="layui-input-inline">
						<select name="idCardType" lay-filter="idCardType">

							<c:if test="${sessionScope.user.idCardType == null}">
								<option value=""></option>
								<option value="0">中华人民共和国身份证</option>
								<option value="1">护照</option>
								<option value="2">回乡证</option>
								<option value="3">台胞证</option>
							</c:if>
							<c:if test="${sessionScope.user.idCardType == '0'}">
								<option value=""></option>
								<option value="0">中华人民共和国身份证</option>
								<option value="1">护照</option>
								<option value="2">回乡证</option>
								<option value="3">台胞证</option>
							</c:if>
							<c:if test="${sessionScope.user.idCardType == '1'}">
								<option value=""></option>
								<option value="0">中华人民共和国身份证</option>
								<option value="1" selected="">护照</option>
								<option value="2">回乡证</option>
								<option value="3">台胞证</option>
							</c:if>
							<c:if test="${sessionScope.user.idCardType == '2'}">
								<option value=""></option>
								<option value="0">中华人民共和国身份证</option>
								<option value="1">护照</option>
								<option value="2" selected="">回乡证</option>
								<option value="3">台胞证</option>
							</c:if>
							<c:if test="${sessionScope.user.idCardType == '3'}">
								<option value=""></option>
								<option value="0">中华人民共和国身份证</option>
								<option value="1">护照</option>
								<option value="2">回乡证</option>
								<option value="3" selected="">台胞证</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>证件号：</div>
					<div class="inputtxt">
						<input name="idCard" type="text" class="txt2" placeholder="请填写您的证件号"
								<c:if test="${sessionScope.user.idCard != null}">
									value="${sessionScope.user.idCard}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>

				<div class="jldiv">
					<div class="nametxt"><span>*</span>最高学历：</div>
					<div class="inputtxt">
						<input name="degree" type="text" class="txt2" placeholder="请填写您的最高学历"
								<c:if test="${sessionScope.user.degree != null}">
									value="${sessionScope.user.degree}"
								</c:if>
						/>
					</div>
				</div>

				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>手机号码：</div>
					<div class="inputtxt">
						<span class="phone">${sessionScope.user.phone}</span>
						<a href="/jump/user/personal_updatenum" class="updateph">修改手机号</a>
						<span class="check1"></span>
						<span class="ycname">接收短信面试通知</span>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="JlBoxRight">
				<img src="<%=imagesPath+"per1.jpg"%>" width="80" height="100" />
			</div>
		</div>
		<div class="clear"></div>
		<div class="JlBoxCon">
			<div class="JlBoxLeft">
				<div class="jldiv">
					<a href="javascript:void(0)" class="nextBtn" onclick="personal_jlupdate()">保存个人信息</a>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">菜鸟人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />菜鸟人才网版权所有 <a href="">闽ICP证0******9号</a><a href="#"></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：200-8**-****</p>
</div>

<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal_jl.js"%>></script>
<script>
	layui.use(['form', 'layedit', 'laydate'], function() {
		var form = layui.form
			, layer = layui.layer
			, layedit = layui.layedit
			, laydate = layui.laydate;

		laydate.render({
			elem: '#birthday'
		});
	});
</script>
</body>
</html>
