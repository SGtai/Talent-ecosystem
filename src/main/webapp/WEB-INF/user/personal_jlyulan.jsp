<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-29
  Time: 10:56
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
					<font>
						[${sessionScope.user.phone}]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="/jump/user/personal_updatepsd">修改密码</a></li>
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
		<div class="nav">
			<div class="navItem"><a href="/user/index">首页</a></div>
			<div class="navItem"><a href="/jump/home/searchJob">职位搜索</a></div>
			<div class="navItem"><a href="/techa">人才成长区</a></div>
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
				<a href="/user/gopersonaljl" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href="/jump/user/myschooll" class="a3">我的校友</a>
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
				<li><a href="/user/mianshi">面试通知</a></li>
				<li><a href="/user/yaoyue">应聘邀请</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_help" class="a8">帮助中心</a>
			</div>
		</div>

	</div>
	<div class="perRightcon ">
		<div class="seeTitle">
			<div class="seeTitle2">
				<a href="/user/gopersonaljl">返回简历列表</a>
			</div>
		</div>
		<form class="" id="userinfojl">
			<div class="JlBoxCon ">
				<h1><span>基本信息</span></h1>
				<div class="JlBoxRight">
					<c:if test="${sessionScope.user.picture ==null or sessionScope.user.picture ==''}">
						<img src="<%=imagesPath+"per1.jpg"%>" width="80" height="100" />
					</c:if>
					<c:if test="${sessionScope.user.picture !=null and sessionScope.user.picture !=''}">
						<img src="<%=dbimgPath%>${sessionScope.user.picture}" width="80" height="100" />
					</c:if>
				</div>
				<div class="JlBoxLeft ">
					<div class="jldiv">
						<div class="nametxt1">简历名称：
							<c:if test="${yulan[0].jlname != null}">
								${yulan[0].jlname}
							</c:if>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">姓    名：
							<c:if test="${yulan[0].yhname != null}">
							${yulan[0].yhname}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">最高 学历：
							<c:if test="${yulan[0].yhname != null}">
								${yulan[0].xl}
							</c:if>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">性    别:
							<c:if test="${yulan[0].xbSex != null}">
								${yulan[0].xbSex}
							</c:if></div>
						<div class="nametxt1"></div>
						<div class="nametxt1">出生年月：
							<c:if test="${yulan[0].csTime != null}">
								${yulan[0].csTime}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">国籍：
							<c:if test="${yulan[0].gjNationality != null}">
								${yulan[0].gjNationality}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">政治面貌：
							<c:if test="${yulan[0].mmFace != null}">
								${yulan[0].mmFace}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">手机号码：
							<c:if test="${yulan[0].sjPhone != null}">
								${yulan[0].sjPhone}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">邮  箱：
							<c:if test="${yulan[0].yxMailbox != null}">
								${yulan[0].yxMailbox}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">民  族：
							<c:if test="${yulan[0].minzu != null}">
								${yulan[0].minzu}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">居住地：
							<c:if test="${yulan[0].jzdResidence != null}">
								${yulan[0].jzdResidence}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="yixiang" class="">
			<div class="JlBoxCon ">
				<h1><span>求职意向</span></h1>
				<div class="JlBoxLeft">
					<div class=" jldiv">
						<div class="nametxt1">期望工作性质：
							<c:if test="${yulan[0].jobintension[0].workstate != null}">
								${yulan[0].jobintension[0].workstate}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">期望月薪：
							<c:if test="${yulan[0].jobintension[0].monthlyPay != null}">
								${yulan[0].jobintension[0].monthlyPay}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">期望工作地点：
							<c:if test="${yulan[0].jobintension[0].workPlace != null}">
								${yulan[0].jobintension[0].workPlace}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">期望职位类别：
							<c:if test="${yulan[0].jobintension[0].workstate != null}">
								${yulan[0].jobintension[0].intentionWork}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">其他要求：
							<c:if test="${yulan[0].jobintension[0].other != null}">
								${yulan[0].jobintension[0].other}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>

				</div>
			</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>

		<c:if test="${yulan[0].experienceList != null}">
			<c:forEach items="${yulan[0].experienceList}" begin="0" var="i" varStatus="status">
				<div class="JlBoxCon" id="jiaoyudiv">
					<form id="jiaoyu" class="">
						<h1><span>教育背景${status.index+1}</span></h1>
						<div class="JlBoxLeft">
							<div class="jldiv">
								<div class="nametxt1">学校名称：
									<c:if test="${i.school != null}">
										${i.school}
									</c:if>
								</div>
								<div class="nametxt1"></div>
								<div class="nametxt1">就学时间：
									<c:if test="${i.sxSchooltime != null}">
										${i.sxSchooltime}
									</c:if>
								</div>
							</div>
							<div class="clear"></div>
							<div class="jldiv">
								<div class="nametxt1">专业名称：
									<c:if test="${i.zyMajor != null}">
										${i.zyMajor}
									</c:if>
								</div>
							</div>
							<div class="clear"></div>
							<div class="jldiv">
								<div class="nametxt1">学习经历：</div>
								<div class="inputtxt">
									<textarea name="rongyu" cols="" rows=""><c:if test="${i.rongyu != null}">${i.rongyu}</c:if></textarea>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="lineddiv"></div>
			</c:forEach>
		</c:if>


<c:if test="${yulan[0].undergoList != null}">
	<c:forEach items="${yulan[0].undergoList}" begin="0" var="i" varStatus="status">
		<div class="JlBoxCon" id="gongzuodiv">
			<form id="gongzuo" class="">
				<h1><span>工作经历${status.index+1}</span></h1>

				<div class="clear"></div>
				<div class="JlBoxLeft" style="width:710px">
					<div class="jldiv">
						<div class="nametxt1">企业名称：
							<c:if test="${i.jzUnit != null}">
								${i.jzUnit}
							</c:if>
						</div>
						<div class="nametxt1"></div>
						<div class="nametxt1">职位名称：
							<c:if test="${i.zwPosition != null}">
								${i.zwPosition}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">工作时间：
							<c:if test="${i.ksTime != null}">
								${i.ksTime}
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">工作描述：</div>
						<div class="inputtxt">
							<textarea name="gzContent" cols="" rows=""><c:if test="${i.gzContent != null}">${i.gzContent}</c:if></textarea>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</form>
		</div>

		<div class="clear"></div>
		<div class="lineddiv"></div>
	</c:forEach>
</c:if>
		<div class="JlBoxCon">
			<form id="zhengshu">
				<h1><span>证书</span></h1>
				<div class="JlBoxLeft">
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">证书说明：</div>
						<div class="inputtxt">
							<textarea name="zsCertificate" cols="" rows=""><c:if test="${yulan[0].zsCertificate != null}">${yulan[0].zsCertificate}</c:if></textarea>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</form>
		</div>

		<div class="clear"></div>
		<div class="lineddiv"></div>
		<div class="JlBoxCon">
			<form id="pingjia">
				<h1><span>自我评价</span></h1>
				<div class="JlBoxLeft">
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt1">内容：</div>
						<div class="inputtxt">
							<textarea name="pjEvaluation" cols="" rows=""><c:if test="${yulan[0].pjEvaluation != null}">${yulan[0].pjEvaluation}</c:if></textarea>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</form>
		</div>

		<div class="clear"></div>
		<div class="lineddiv"></div>
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
