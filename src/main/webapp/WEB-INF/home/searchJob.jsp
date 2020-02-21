<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-19
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>职位搜索-高级搜索</title>
	<link type="text/css" rel="stylesheet" href="../static/homeS/css/searchJob.css" />
	<script type="text/javascript" src="../static/homeS/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../static/homeS/js/searchJob.js"></script>
</head>

<body>
<div class="topDiv">
	<div class="topL">
		<div class="logo">
			<img src="../static/homeS/images/LOGO.png" />
			<img src="../static/homeS/images/view_logo40.png" class="img1"/>
		</div>
		<img src="../static/homeS/images/spirit_40.png" />
	</div>
	<div class="topR">
		<div class="topR0 topR1"><a href="zhuceCompany.html">企业招聘</a></div>
		<div class="topR0 topR2"><a href="zhuce.html">注册</a></div>
		<div class="topR0 topR3"><a href="login.html">个人登录</a></div>
		<div class="topR0 topR4"><a href="javascript:void()">手机找工作</a></div>
		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul>
			<li><a href="index.html">首页</a></li>
			<li><a href="personal.html">个人中心</a></li>
			<li class="onmenu"><a href="searchJob.html">职位搜索</a></li>
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
			<input name="" type="text" placeholder="请填写关键词或选择职位" class="keyword"/>
			<span class="jiantou"></span>
		</div>
		<div class="sea1_2">
			<input name="" type="text" placeholder="广东省" class="addtxt"/>
		</div>
		<div class="sea1_3">
			<input name="" type="text" placeholder="请选择行业" class="hytxt"/>
		</div>
		<div class="sea1_4">
			<a href="javascript:void()">搜工作</a>
		</div>
		<div class="sea1_5">
			<span class="span1"><a href="javascript:void()">历史记录</a></span>
			<span class="span2"><a href="javascript:void()">职位分布图</a></span>
		</div>
	</div>
	<div class="search2">
		<div class="xzdiv">
			<div class="xzdivL">工作地点：</div>
			<div class="xzdivC">
				<span>广州市</span>
				<span>深圳市</span>
				<span>佛山市</span>
				<span>东莞市</span>
				<span>肇庆市</span>
				<span>珠海市</span>
				<span>江门市</span>
				<span>惠州市</span>
				<span>中山市</span>
				<span>阳江市</span>
				<span>湛江市</span>
				<span>河源市</span>
				<span>云浮市</span>
				<span>汕尾市</span>
				<span>茂名市</span>
				<span>汕头市</span>
				<span>清远市</span>
				<span>揭阳市</span>
			</div>
			<div class="xzdivB"><img src="../static/homeS/images/11.png" class="imgshow"/><img src="../static/homeS/images/10.png" class="imghidden"/></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv">
			<div class="xzdivL">职位类别：</div>
			<div class="xzdivC">
				<span>销售人员</span>
				<span>技工/普工</span>
				<span>行政/后勤</span>
				<span>生产制造/运营</span>
				<span>销售管理</span>
				<span>贸易/采购</span>
				<span>客服/技术支持</span>
				<span>IT产品/运营/设</span>
				<span>教育/培训</span>
				<span>影视/媒体</span>
				<span>软硬件开发/系统集</span>
				<span>餐饮/娱乐/旅游</span>
				<span>财务/审计/税务</span>
				<span>艺术设计</span>
				<span>市场/策划/公关</span>
				<span>销售行政/商务</span>
				<span>人力资源</span>
				<span>实习生/社工/科研</span>
				<span>证券/期货/投资</span>
				<span>质量/安全管理</span>
				<span>IT品质/运维/技</span>
				<span>经营管理</span>
				<span>翻译</span>
				<span>广告</span>
				<span>物流/交通/仓储</span>
				<span>汽车</span>
				<span>其他</span>
				<span>机械</span>
				<span>新闻/出版</span>
				<span>百货/零售</span>
				<span>保安/家政</span>
				<span>电子/半导体/电器</span>
				<span>通信</span>
				<span>保险</span>
				<span>法律</span>
				<span>化工</span>
				<span>房地产</span>
				<span>咨询</span>
				<span>物业管理</span>
				<span>电气/电力/能源</span>
				<span>服装/纺织品</span>
				<span>医院/医疗</span>
				<span>美容/健身</span>
				<span>环保</span>
				<span>农/林/牧/渔业</span>
				<span>IT管理</span>
			</div>
			<div class="xzdivB"><img src="../static/homeS/images/11.png" class="imgshow"/><img src="../static/homeS/images/10.png" class="imghidden"/></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv">
			<div class="xzdivL">月薪范围：</div>
			<div class="xzdivC">
				<span>1K-2K</span>
				<span>2K-3K</span>
				<span>3K-4K</span>
				<span>4K-5K</span>
				<span>5K-6K</span>
				<span>6K-8K</span>
				<span>8K-10K</span>
				<span>10K-15K</span>
				<span>15K-20K</span>
				<span>20K以上</span>
				<span>面议</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv hidden">
			<div class="xzdivL">学历要求：</div>
			<div class="xzdivC">
				<span>初中(134)</span>
				<span>高中、中技、中专(321)</span>
				<span>大专(442)</span>
				<span>本科(102)</span>
				<span>硕士(4)</span>
				<span>不限(138)</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv hidden">
			<div class="xzdivL">工作年限：</div>
			<div class="xzdivC">
				<span>不限(539)</span>
				<span>1~2年(365)</span>
				<span>3~5年(135)</span>
				<span>6~10年(19)</span>
				<span>10年以上(6)</span>
				<span>应届毕业生(77)</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv hidden">
			<div class="xzdivL">工作性质：</div>
			<div class="xzdivC">
				<span>全职(1056)</span>
				<span>兼职(53)</span>
				<span>实习(32)</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv hidden">
			<div class="xzdivL">企业规模：</div>
			<div class="xzdivC">
				<span>少于50人(384)</span>
				<span>50~100人(362)</span>
				<span>101~200人(160)</span>
				<span>201~500人(113)</span>
				<span>501~1000人(64)</span>
				<span>1000人以上(58)</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv">
			<div class="xzdivL">企业答复率：</div>
			<div class="xzdivC">
				<span>60%以上</span>
				<span>70%以上</span>
				<span>80%以上</span>
				<span>90%以上</span>
				<span>100%</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv">
			<div class="xzdivL">福利待遇：</div>
			<div class="xzdivC">
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>保险</span>
				</div>
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>公积金</span>
				</div>
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>奖金提成</span>
				</div>
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>双休</span>
				</div>
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>8小时工作制</span>
				</div>
				<div class="dydiv">
					<input name="" type="checkbox" value="" />
					<span>提供住宿</span>
				</div>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="search3">
		<span class="down">更多选项</span>
	</div>
</div>
<div class="clear"></div>
<div class="seachlist">
	<div class="listtop">
		<div class="tj1">
			<span class="list on">列表</span>
			<span class="zhaoyao">摘要</span>
		</div>
		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示在线 </span>
		</div>
		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示有环境照片 </span>
		</div>
		<div class="tj3">
			<span>共1141条  第1/39页</span>
		</div>
	</div>
	<div class="clear"></div>

	<table class="layui-table" lay-skin="nob" lay-even="searchJob" id="searchJob"></table>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="../static/homeS/images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>

