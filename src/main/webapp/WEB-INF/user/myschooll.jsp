<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-3-4
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-3-3
  Time: 19:46
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href=<%=cssPath+"personal.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<title>个人中心-申请的职位</title>
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
			<div class="navItem"><a href=<%=path%>>首页</a></div>
			<div class="navItem"><a href="<%=path%>jump/home/searchJob">职位搜索</a></div>
			<a href="/techa">人才成长区</a>
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
			<h1 class="fl">我的校友</h1>
		</div>
	</div>
</div>

	<div style="margin-left: 30%;margin-top: 5%"><table id="demo" lay-filter="table_pa"></table></div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">菜鸟人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />菜鸟人才网版权所有 <a href="">闽ICP证0******9号</a><a href="#"></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：200-8**-****</p>
</div>
<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script>
	layui.use(['form','layer','jquery','table','laydate','upload'], function() {
		var table = layui.table;
		var form = layui.form;
		var $ = layui.jquery;
		var layer = layui.layer;
		var laydate = layui.laydate;
		var upload = layui.upload;
		var nowTime = new Date().valueOf();
		var max = null;
		//日期显示
		var start = laydate.render({
			elem: '#start_time',
			type: 'datetime',
			max: nowTime,
			btns: ['clear', 'confirm'],
			done: function(value, date){
				endMax = end.config.max;
				end.config.min = date;
				end.config.min.month = date.month -1;
			}
		});
		var end = laydate.render({
			elem: '#end_time',
			type: 'datetime',
			max: nowTime,
			done: function(value, date){
				if($.trim(value) == ''){
					var curDate = new Date();
					date = {'date': curDate.getDate(), 'month': curDate.getMonth()+1, 'year': curDate.getFullYear()};
				}
				start.config.max = date;
				start.config.max.month = date.month -1;
			}
		});
		//表格
		var ins1=table.render({
			elem: '#demo'
			,height: 300
			,width:760
			,limit:5
			,limits:[20,30,40,50]
			,url: '<%=path+"school/myschool"%>' //数据接口
			,page: true //开启分页
			,even:true
			,cols: [[ //表头
				{field: 'phone', title: '电话', width: 150,height:100}
				,{field: 'name', title: '姓名', width:150,height:100}
				,{field: 'zy', title: '专业', width:150,height:100}
				,{field: 'xl', title: '学历', width: 5,width: 150}
				,{field: 'jzdResidence', title: '住址', width: 150}

			]]

			,id:'UserTable'
		});
	});

</script>

</body>
</html>


