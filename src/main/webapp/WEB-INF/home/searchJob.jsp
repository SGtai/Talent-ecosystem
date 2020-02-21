<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-19
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String cssPath = application.getContextPath()+"/homeS/css/";
	String jsPath = application.getContextPath()+"/homeS/js/";
	String path = application.getContextPath()+"/";
	String imagesPath =application.getContextPath()+"/homeS/images/";
	String dbimgPath =application.getContextPath()+"/images/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>职位搜索-高级搜索</title>
	<link type="text/css" rel="stylesheet" href=<%=cssPath+"searchJob.css"%>/>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<link type="text/css" rel="stylesheet" href=<%=cssPath+"jobTable.css"%>/>
</head>

<body>
<div class="topDiv">
	<div class="topL">
		<div class="logo">
			<img src=<%=imagesPath+"LOGO.png"%>/>
			<img src=<%=imagesPath+"view_logo40.png"%> class="img1"/>
		</div>
		<img src=<%=imagesPath+"spirit_40.png"%> />
	</div>
	<div class="topR">
		<div class="topR0 topR1" style=" background: url(<%=imagesPath+"4.png"%>) no-repeat;width: 55px;padding-left: 25px;cursor: pointer;"><a href="zhuceCompany.html">企业招聘</a></div>
		<div class="topR0 topR2"><a href="zhuce.html">注册</a></div>
		<div class="topR0 topR3" style="background: url(<%=imagesPath+"5.png"%>) no-repeat;width: 62px;padding-left: 25px;cursor: pointer;"><a href="login.html">个人登录</a></div>
		<div class="topR0 topR4" style="background: url(<%=imagesPath+"6.png"%>) no-repeat;width: 72px;padding-left: 25px;cursor: pointer; margin-right:20px"><a href="javascript:void()">手机找工作</a></div>
		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul>
			<li><a href="index.html">首页</a></li>
			<li><a href="personal.html">个人中心</a></li>
			<li class="onmenu"><a href="/jump/home/searchJob">职位搜索</a></li>
			<li><a href="meetingJob.html">招聘会</a></li>
			<li><a href="jobnews.html">就业资讯</a></li>
			<li><a href="download.html">文档下载</a></li>
			<li><a href="helpJob.html">求职互助</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="menuLittle">
	<div class="menuselect"><a href="searchJob.html" class="on">高级搜索</a></div>
	<div class="menuselect"><a href="searchJob_map.html">地图搜索</a></div>
	<div class="menuselect"><a href="searchJob_new.html">最新职位</a></div>
	<div class="menuselect"><a href="searchJob_hot.html">热门搜索</a></div>
	<div class="menuselect"><a href="searchJob_jianzhi.html">兼职招聘</a></div>
	<div class="clear"></div>
</div>
<div class="clear"></div>
<div class="searchDiv">
	<div class="search1">
		<div class="sea1_1">
			<input name="" type="text" placeholder="请填写关键词或选择职位" class="keyword" style="color: #898989;padding-left: 35px;background: url(<%=imagesPath+"7.png"%>) 8px 8px no-repeat;line-height: 33px;height: 33px;width: 275px;cursor: auto"/>
			<span class="jiantou" style="background: url(<%=imagesPath+"8.png"%>) 5px 13px no-repeat;width: 29px;height: 35px;float: right;"></span>
		</div>
		<div class="sea1_2">
			<input name="" type="text" placeholder="广东省" class="addtxt" style="background:url(<%=imagesPath+"8.png"%>) right 13px no-repeat; width:130px;height: 35px; padding-left:15px"/>
		</div>
		<div class="sea1_3">
			<input name="" type="text" placeholder="请选择行业" class="hytxt" style="background:url(<%=imagesPath+"8.png"%>)  right 13px no-repeat; width:203px;height: 35px; padding-left:15px"/>
		</div>
		<div class="sea1_4">
			<a href="javascript:void()">搜工作</a>
		</div>
	</div>

	<form class="layui-form">
			<div class="layui-inline">
				<div class="layui-form-item" pane="">
					<label class="layui-form-label">工作地点 ：</label>
					<div class="layui-input-inline">
						<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
							<option value="9">~</option>
							<option value="9">福州</option>
							<option value="0">泉州</option>
							<option value="1">漳州</option>
							<option value="2">厦门</option>
							<option value="3">温州</option>
							<option value="4">绍兴</option>
							<option value="4">宁波</option>
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">月薪范围 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="0">~</option>
						<option value="1">1K</option>
						<option value="3">3K</option>
						<option value="5">5K</option>
						<option value="6">6K</option>
						<option value="7">7K</option>
						<option value="8">8K</option>
						<option value="10">10K</option>
						<option value="15">15K</option>
						<option value="20">20K</option>
						<option value="21">面议</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="0">~</option>
						<option value="1">1K</option>
						<option value="3">3K</option>
						<option value="5">5K</option>
						<option value="6">6K</option>
						<option value="7">7K</option>
						<option value="8">8K</option>
						<option value="10">10K</option>
						<option value="15">15K</option>
						<option value="20">20K</option>
					</select>
				</div>

				<label class="layui-form-label">学历要求 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="9">~</option>
						<option value="0">小学</option>
						<option value="1">初中</option>
						<option value="2">高中、中技、中专</option>
						<option value="3">大专</option>
						<option value="4">本科</option>
						<option value="4">硕士</option>
						<option value="4">博士</option>
						<option value="4">不限</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">工作年限 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="9">~</option>
						<option value="0">不限</option>
						<option value="4">应届毕业生</option>
						<option value="1">1~2年</option>
						<option value="2">3~5年</option>
						<option value="3">6~10年</option>
						<option value="4">10年以上</option>
					</select>
				</div>

				<label class="layui-form-label">工作性质 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="9">~</option>
						<option value="0">全职</option>
						<option value="4">兼职</option>
						<option value="1">实习</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">企业规模 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="9">~</option>
						<option value="0">少于50人</option>
						<option value="4">50~100人</option>
						<option value="1">101~200人</option>
						<option value="2">201~500人</option>
						<option value="3">501~1000人</option>
						<option value="4">1000人以上</option>
					</select>
				</div>

				<label class="layui-form-label">企业答复率 ：</label>
				<div class="layui-input-inline">
					<select name="state" lay-search="" lay-verify="required" lay-filter="state" id="state">
						<option value="9">~</option>
						<option value="0">50%</option>
						<option value="4">60%</option>
						<option value="1">70%</option>
						<option value="2">80%</option>
						<option value="3">90%</option>
						<option value="4">100%</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item" >
				<label class="layui-form-label">福利待遇：</label>
				<div class="layui-input-block">
					<input name="like1[write]" title="保险" type="checkbox" checked="" lay-skin="primary">
					<input name="like1[read]" title="公积金" type="checkbox" lay-skin="primary">
					<input name="like1[game]" title="奖金提成"type="checkbox" lay-skin="primary">
					<input name="like1[me]" title="双休"  type="checkbox" lay-skin="primary">
					<input name="like1[ge]" title="八小时工作制"  type="checkbox" lay-skin="primary">
					<input name="like1[gam]" title="提供住宿"  type="checkbox" lay-skin="primary">
				</div>
			</div>
		<button class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">确定条件</button>

	</form>



</div>
<div class="clear"></div>
<div class="seachlist">
	<div class="listtop">

		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示在线 </span>
		</div>
		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示有环境照片 </span>
		</div>

	</div>
	<div class="clear"></div>

	<table class="layui-table" lay-skin="nob" lay-even="searchJob" id="searchJob"></table>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=imagesPath+"logo_foot.gif"%> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>

<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"searchJob.js"%>></script>
</body>
</html>

