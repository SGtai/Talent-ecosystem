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
						<c:if test="${yulan[0].sjPhone != null}">
							${yulan[0].sjPhone}
						</c:if></font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="/jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="/jump/user/personal_updatenum">修改手机</a></li>
							<li><a href="/jump/user/personal_renzheng">修改邮箱</a></li>
							<li><a href="/jump/user/index">退出</a></li>
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
		<div class="logo"><a href="index.html"><img src="<%=imagesPath+"logo_1.png"%>"/><img src="<%=imagesPath+"logo_2.png"%>"/></a></div>
		<div class="nav">
			<div class="navItem"><a href="/jump/user/index">首页</a></div>
			<div class="navItem"><a href="/jump/user/searchJob">职位搜索</a></div>
			<div class="navItem"><a href=/jump/user/"meetingJob">招聘会</a></div>
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
				<a href="/jump/user/personal_zwss" class="a3">职位搜索</a>
			</div>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_cai" class="a4">你的菜儿</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a class="a5">职位申请</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/jump/user/personal_sqzw">申请的职位</a></li>
				<li><a href="/jump/user/personal_mygz">我的关注</a></li>
			</ul>
			<div class="NavLeftBox twoNav">
				<a class="a6">企业邀约</a>
				<span class="up"></span>
			</div>
			<ul>
				<li><a href="/jump/user/personal_mainshi">面试通知</a></li>
				<li><a href="/jump/user/personal_yaoqing">应聘邀请</a></li>
				<li><a href="/jump/user/personal_whogz">谁在关注我</a></li>
				<li><a href="/jump/user/personal_goutong">在线沟通记录</a></li>
			</ul>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_zhanghu" class="a7">账户管理</a>
			</div>
			<div class="NavLeftBox">
				<a href="/jump/user/personal_help" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src="<%=imagesPath+"showqrcode.jpg"%>" />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon ">
		<div class="seeTitle">
			<div class="seeTitle2">
				<a href="/jump/user/personal_jlyulan">预览</a>
				<a href="/jump/user/personal_jl">返回简历列表</a>
			</div>
			<div class="seeTitle3">
				<a href="">英文简历</a>
			</div>
		</div>
		<form class="" id="userinfojl">
			<div class="JlBoxCon ">
				<h1><span>基本信息</span></h1>
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
								${yulan[0].jobintension[0].workstate}
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
		<div class="JlBoxCon">
			<h1><span>附件简历</span></h1>
			<div class="wordSub">
				<p>可以上传word文件或者图片类型的简历，图片支持jpg/gif/png/jpeg格式大小3M以内</p>
				<div class="wordUp">
					
					<input name="" type="button" value="浏览" class="liulan"/>
				</div>
				<input name="" type="button" value="上传" class="upchuan"/>
			</div>
		</div>
	</div>
</div>


<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="<%=imagesPath+"logo_foot.gif"%>" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>

<script type="text/javascript" src=<%=path+"layui/jquery-3.4.1.js"%>></script>
<script src=<%=path + "layui/layui.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal_jl.js"%>></script>
</body>
</html>
