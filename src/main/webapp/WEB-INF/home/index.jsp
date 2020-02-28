<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-17
  Time: 22:52
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
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<link type="text/css" rel="stylesheet" href=<%=cssPath+"style.css"%>>
	<link rel="stylesheet" href="<%=path+"layui/css/layui.css"%>" media="all">
	<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
	<script src=<%=path + "layui/layui.js"%>></script>
	<script type="text/javascript" src=<%=jsPath+"my.js"%>></script>
</head>

<body>
<script>
	<% if(request.getSession().getAttribute("jobInfolist") == null){%>
	$.ajax(
		{type:"POST",
			async:false,
			url:"/homeS/getTenHJob",
			dataType:"text",
			success:function (msg) {
				window.location.href=window.location;
			}});
	<% }%>
</script>
<div class="topDiv">
	<div class="mainWarp">
		<div class="topLeft">
<%--			<span>地区频道：</span>--%>
<%--			<a href=" ">广州</a>--%>
<%--			<a href=" ">深圳</a>--%>
<%--			<a href=" ">珠海</a>--%>
<%--			<a href=" ">汕头</a>--%>
<%--			<a href=" ">韶关</a>--%>
<%--			<a href=" ">河源</a>--%>
<%--			<a href=" ">广州</a>--%>
<%--			<a href=" ">深圳</a>--%>
<%--			<a href=" ">珠海</a>--%>
		</div>
		<div class="topRight">
			<span>好消息：</span>
			<a href=" ">好消息好消息好消息</a>
		</div>
	</div>
	<a href="/jump/admin/login">管理员入口</a>
</div>
<div class="loginDiv">
	<div class="loginL">
		<img src=<%=imagesPath+"LOGO.png"%>/>
		<img src=<%=imagesPath+"view_logo40.png"%> />
	</div>
	<div class="loginAddress">
		<div class="add1">
			<span class="span1">泉州</span>
			<span class="span2"></span>
		</div>
	</div>
	<form method="post" action="/homeS/jumpsearch">
	<div class="loginC">
		<input name="searchText" type="text" placeholder="请填写关键词或选择职位..."/>
		<a href=""><button type="submit" style="margin-left: 39px;width: 118px;height: 46px; background-color:transparent;border-style:none;" id="searchIndx" ></button></a>
	</div>
	</form>
	<div class="loginR">
		<img src=<%=imagesPath+"spirit_40.png"%>/>
	</div>
</div>
<div class="menuDiv">
	<a href="index.html" class="onnav">首页</a>
	<a href="/techa">人才成长区</a>
	<a href="/homeS/jumpsearch">职位搜索</a>
	<a href="/jump/school/login">高校专区</a>
	<a href=" " class="mobile">微信版</a>
</div>
<div class="BodyMain">
	<div class="mainTop">
		<div class="mainTopL">
			<ul>
				<div class="items">
					<div class="itemOne">
						<span class="itme7"><b></b><a href="/homeS/jumpsearch?type=1"> 技术</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme1"><b></b><a href="/homeS/jumpsearch?type=2"> 市场</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme2"><b></b><a href="/homeS/jumpsearch?type=3"> 人事</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme6"><b></b><a href="/homeS/jumpsearch?type=4"> 媒体</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme8"><b></b><a href="/homeS/jumpsearch?type=5"> 金融</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme9"><b></b><a href="/homeS/jumpsearch?type=6"> 医疗健康</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme3"><b></b><a href="/homeS/jumpsearch?type=7"> 供应链/物流</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme10"><b></b><a href="/homeS/jumpsearch?type=8"> 房地产/建筑</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme4"><b></b><a href="/homeS/jumpsearch?type=9"> 咨询/翻译/法律/教育</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme5"><b></b><a href="/homeS/jumpsearch?type=10"> 旅游></a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme12"><b></b><a href="/homeS/jumpsearch?type=11"> 服务业</a></span>
					</div>
				</div>
				<div class="items">
					<div class="itemOne">
						<span class="itme11"><b></b><a href="/homeS/jumpsearch?type=12"> 生产制造</a></span>
					</div>
				</div>
			</ul>
		</div>
		<div class="mainTopR">
			<div class="ads">
				<div class="floatL" id="left"></div>
				<div class="adBox0">
					<ul style="margin-left: 0px; overflow: hidden">
						<li>
							<a href=" "><div style="background:url(<%=imagesPath+"head-fl.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>
						</li>
						<li>
							<a href=" "><div style="background:url(<%=imagesPath+"2.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>
						</li>
						<li>
							<a href=" "><div style="background:url(<%=imagesPath+"3.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>
						</li>
					</ul>
				</div>
				<div class="floatR" id="right"></div>
				<div class="clear"> </div>
			</div>
			<div class="login">
<%--				当session域里面有user值，显示个人中心和退出--%>

					<div class="loginmain" id="userDiv"
							<c:if test="${sessionScope.user != null}">
                                style="display: block"
							</c:if>
							<c:if test="${sessionScope.user == null}">
								style="display: none"
							</c:if>
					>
						<div class="ContentA">
							<div class="qybox2">
								<P style="margin-top: 46px;font-size: 20px;">欢迎您，用户${sessionScope.user.phone}</P>
							</div>
							<div class="qybox0">
								<a href="/jump/user/personal">个人中心</a>
								<a href="javascript:tuichu()">退出</a>
							</div>
						</div>
						<div class="ContentB">
							<div class="qybox1">
								<a href="/jump/admin/login">企业入口</a>
								<a href=" ">企业注册</a>
							</div>
							<div class="qybox2">
								<p>注册后可<b>免费</b>升级为<b>普通会员</b><br>不花钱也能完成中低职位的招聘</p>
							</div>
							<div class="qybox3">
								<div class="l">企业服务热线<br><b>400-800-8*8*</b></div>
								<div class="r"></div>
							</div>
						</div>
						<div class="ContentC">
							<div class="qybox0">
								<a href="/jump/admin/login">管理员登录</a>
							</div>
						</div>
					</div>

	<%--				当session域里面没有，显登录--%>

			<div id="nouserDiv"
				<c:if test="${sessionScope.user == null}">
				    style="display: block"
				</c:if>
				<c:if test="${sessionScope.user != null}">
					style="display: none"
				</c:if>
			>

				<div class="erweima">
					<div class="close"></div>
					<div class="ewmimg"><img src=<%=imagesPath+"showqrcode.jpg"%> /></div>
					<div class="ewmtxt">使用微信扫描上方二维码登录</div>
				</div>
				<div class="logintop">
					<div class="loginC loginA select">
						<div class="smlogin"></div>
						<span>个人登录</span>
					</div>
					<div class="loginC loginB">
						<span>企业登录</span>
					</div>
				</div>
				<div class="loginmain">
					<div class="ContentA">
						<div class="qybox0">
							<a href="/jump/user/login">个人登录</a>
							<a href="/jump/user/reg">个人注册</a>
						</div>
						<div class="qybox2">
							<p>&nbsp;注册后可<b>直接</b>成为<b>普通会员</b><br>即刻可开始寻求您的中意职位</p>
						</div>
					</div>

					<div class="ContentB">
						<div class="qybox1">
							<a href="/jump/admin/login">企业入口</a>
							<a href=" ">企业注册</a>
						</div>
						<div class="qybox2">
							<p>注册后可<b>免费</b>升级为<b>普通会员</b><br>不花钱也能完成中低职位的招聘</p>
						</div>
						<div class="qybox3">
							<div class="l">企业服务热线<br><b>400-800-8*8*</b></div>
							<div class="r"></div>
						</div>
					</div>
					<div class="ContentC">
						<div class="qybox0">
							<a href="/jump/admin/login">管理员登录</a>
						</div>
					</div>
				</div>
					</div>

			</div>
			<div class="clear"></div>
			<div class="tabs">
				<ul id="tab">
					<li class="current">好消息</li>
					<!--                <li>就业资讯</li>-->
					<!--                <li>文档下载</li>-->
				</ul>
				<div id="content">
					<ul style="display:block;">
						<div class="zph">
							<div class="zph_1"><a href=" "><img src=<%=imagesPath+"haoxiaoxi.gif"%> /></a></div>
							<div class="zph_2">
								<div class="ContentMain">
									<p><span>岗位总数/本月新增:${sessionScope.gangweicount}/${sessionScope.gangweiNew}</span></p>
									<p><span>高校人数:${sessionScope.gaoxiaocount}</span></p>
									<p><span>求职人数:${sessionScope.usercount}</span></p>
									<p><span>就业人数:${sessionScope.qiuzhiSuccess}</span></p>
								</div>
							</div>
							<div class="zph_3">
								<div class="zptit"><a href=" ">12月20日公明三和兴人才市场周三综合招聘会</a></div>
								<div class="zptit"><a href=" ">12月21日公明三和兴人才市场周四综合招聘会</a></div>
								<div class="zptit"><a href=" ">12月21日龙岗三和隆人才市场周四现场招聘会</a></div>
								<div class="zptit"><a href=" ">12月21日龙华三和人才市场周四综合招聘会</a></div>
							</div>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon1">
		<c:if test="${sessionScope.advertList != null}">
			<c:forEach items="${sessionScope.advertList}" begin="0" var="i" varStatus="status">
				<c:if test="${status.index ==0 or status.index ==2 or status.index ==5}">
					<div class="imgbox1">
				</c:if>
				<c:if test="${status.index < 2}">
					<div class="box1"><img src=<%=imagesPath%>${i.advertPicture} height="71" width="546" /></div>
				</c:if>
				<c:if test="${status.index < 5 and status.index >1}">
					<div class="box2"><img src=<%=imagesPath%>${i.advertPicture} height="71" width="362" /></div>
				</c:if>
				<c:if test="${status.index < 10 and status.index >4}">
					<div class="box3"><img src=<%=imagesPath%>${i.advertPicture} height="71" width="178" /></div>
				</c:if>
				<c:if test="${status.index ==1 or status.index ==4 or status.index ==9}">
					</div>
					<div class="clear"></div>
				</c:if>
			</c:forEach>
		</c:if>
	</div>
	<div class="mainCon2">
		<div class="commontitdiv">
			<div class="title">高薪职位</div>
			<span>高薪就这么任性！</span>
		</div>
		<div class="clear"></div>
		<div class="highMoney">

			<c:if test="${sessionScope.jobInfolist != null}">
				<c:forEach items="${sessionScope.jobInfolist}" begin="0" var="i">
					<div class="divBox">
						<a href=""><img src=<%=imagesPath%>${i.qyPicture} width="84"/></a>
						<p class="tit"><a href="">${i.postion}</a></p>
						<p class="sub"><a href="">${i.qyName}</a></p>
						<p class="num"><span>${i.salaryLow}-${i.salaryHigh}</span></p>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="mainCon3">
		<div class="commontitdiv">
			<div class="title">推荐职位</div>
			<span class="line"></span>
		</div>

	</div>
	<div class="clear"></div>
	<div class="mainCon4">
		<ul>
			<c:if test="${sessionScope.compAndJobList != null}">
				<c:forEach items="${sessionScope.compAndJobList}" begin="0" var="i">
					<li>
						<img src=<%=imagesPath%>${i.qyPicture} width="62" height="62"/>
						<p><a href=" ">${i.qyName}</a></p>
					<c:if test="${i.list != null}">
						<c:forEach items="${i.list}" begin="0" var="j" varStatus="status">
<%--							第二次结束也就是第三次开始时换行--%>
							<c:if test="${status.index == 2}">
								<br>
							</c:if>
							<span><a href=" ">${j.postion}</a></span>
						</c:forEach>
					</c:if>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div class="clear"></div>

	<div class="clear"></div>
	<div class="mainCon6">
		<div class="commontitdiv">
			<div class="title">友情链接</div>
			<span class="line"></span>
		</div>
		<div class="clear"></div>
		<div class="contnt6">
			<ul>
				<li><a href=" ">火电招聘网</a></li>
				<li><a href=" ">校园招聘</a></li>
				<li><a href=" ">2018校园招聘</a></li>
				<li><a href=" ">打工网</a></li>
				<li><a href=" ">找工作</a></li>
				<li><a href=" ">黄山人才网</a></li>
				<li><a href=" ">南通人才网</a></li>
				<li><a href=" ">深圳人才网</a></li>
				<li><a href=" ">广州人才网</a></li>
				<li><a href=" ">信阳招聘网</a></li>
				<li><a href=" ">物流人才网</a></li>
				<li><a href=" ">医药招聘网</a></li>
				<li><a href=" ">黄山人才网</a></li>
				<li><a href=" ">南通人才网</a></li>
				<li><a href=" ">深圳人才网</a></li>
				<li><a href=" ">广州人才网</a></li>
				<li><a href=" ">信阳招聘网</a></li>
				<li><a href=" ">物流人才网</a></li>
				<li><a href=" ">医药招聘网</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="footerLine"></div>
<div class="footer">
	<div class="footertop">
		<div class="footl">
			<div class="footlbox">
				<p>菜鸟人才网</p>
				<a href=" ">关于我们</a>
				<a href=" ">视频学习</a>
				<a href=" ">联系我们</a>
				<a href=" ">网站声明</a>
			</div>
			<div class="footlbox">
				<p>个人求职</p>
				<a href=" ">查工资</a>
				<a href=" ">注册/登录 </a>
				<a href=" ">职位搜索</a>
				<a href=" ">兼职招聘</a>
				<a href=" ">手机找工作</a>
			</div>
			<div class="footlbox">
				<p>企业招聘</p>
				<a href=" ">注册/登录</a>
				<a href=" ">资费标准</a>
				<a href=" ">掌中招聘 </a>
			</div>
			<div class="footlbox">
				<p>资讯中心</p>
				<a href=" ">招聘会</a>
				<a href=" ">校园招聘</a>
				<a href=" ">就业资讯</a>
				<a href=" ">文档下载</a>
			</div>
			<div class="footlbox">
				<p>快速导航</p>
				<a href=" ">网站地图</a>
				<a href=" ">职位地图</a>
				<a href=" ">热门搜索</a>
				<a href=" ">专业搜索</a>
				<a href=" ">推广入口</a>
			</div>
		</div>
		<div class="footr">
			<div class="fr1">400-8**-****</div>
			<div class="fr2">每周一至周日 8:30-17:30</div>
			<div class="fr3">
				<span><img src=<%=imagesPath+"showqrcode.jpg"%> /><br />个人安卓客户端</span>
				<span><img src=<%=imagesPath+"showqrcode.jpg"%> /><br />企业安卓客户端</span>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
</body>
</html>

