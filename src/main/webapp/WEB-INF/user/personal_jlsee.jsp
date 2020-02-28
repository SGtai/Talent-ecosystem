<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-27
  Time: 20:07
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
					<font>[28421947]</font>
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
	<div class="perRightcon">
		<div class="seeTitle">
			<div class="seeTitle1">
				<input name="" type="text" class="txt" value="" placeholder="请输入此份简历的名字"/>
				<input name="" type="button" class="btn" value="修改"/>
			</div>
			<div class="seeTitle2">
				<a href="/jump/user/personal_jlyulan">预览</a>
				<a href="/jump/user/personal_jl">返回简历列表</a>
			</div>
			<div class="seeTitle3">
				<a href="">英文简历</a>
			</div>
		</div>
		<div class="JlBoxCon">
			<h1><span>基本信息</span></h1>
			<div class="JlBoxLeft">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>姓    名：</div>
					<div class="inputtxt">
						<input name="name" type="text" class="txt1"/>
						<span class="check1"></span>
						<span class="ycname">隐藏姓名</span>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>性    别：</div>
					<div class="layui-input-inline">
						<select name="sex" lay-filter="sex">
							<option value=""></option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
				</div>
				<div class="clear"></div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>出生年月：</div>
					<div class="layui-input-inline">
						<input id="birthday" name="birthday" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>国籍：</div>
					<div class="inputtxt">
						<input name="gjNationality" type="text" class="txt" placeholder="群众/团员/党员"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>政治面貌：</div>
					<div class="inputtxt">
						<input name="mmFace" type="text" class="txt" placeholder="群众/团员/党员"/>
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
				<div class="jldiv">
					<div class="nametxt"><span>*</span>邮  箱：</div>
					<div class="inputtxt">
						<input name="yxMailbox" type="text" class="txt2" placeholder="群众/团员/党员"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>民  族：</div>
					<div class="inputtxt">
						<input name="mmFace" type="text" class="txt" placeholder="群众/团员/党员"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>居住地：</div>
					<div class="inputtxt">
						<input name="jzdResidence" type="text" class="txt4" placeholder="请填写您的现居住地"/>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="JlBoxRight">
				<img src="<%=imagesPath+"per1.jpg"%>" width="80" height="100" />
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="yixiang">
		<div class="JlBoxCon">
			<h1><span>求职意向</span><a href="" class="update">修改</a></h1>
			<div class="JlBoxLeft">
					<div class="layui-form-item jldiv">
						<div class="nametxt"><span>*</span>期望工作性质：</div>
						<div class="layui-input-inline inputtxt">
							<select name="workstate" lay-filter="workstate">
								<option value=""></option>
								<option value="全职">全职</option>
								<option value="兼职">兼职</option>
								<option value="实习">实习</option>
							</select>
						</div>
					</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望月薪：</div>
					<div class="inputtxt">
						<input name="monthlyPay" type="text" class="txt2"/>
						<span class="check1"></span>
<%--						<span class="ycname">可面议</span>--%>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望工作地点：</div>
					<div class="inputtxt">
						<input name="workPlace" type="text" class="txt4"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望职位类别：</div>
					<div class="inputtxt">
						<input name="intentionWork" type="text" class="txt4"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>其他要求：</div>
					<div class="inputtxt">
						<input name="other" type="text" class="txt2" value="无"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="javascript:void(0)" class="save" onclick="yixiang()">保存</a>
				</div>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="jiaoyu">
		<div class="JlBoxCon">
			<h1><span>教育背景</span></h1>
			<div class="JlBoxLeft">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>学校名称：</div>
					<div class="inputtxt">
						<input name="school" type="text" class="txt3"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>就学时间：</div>
					<div class="inputtxt">
						<input name="sxSchooltime" type="text" class="txt2"/>
					</div>
				</div>

				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>专业名称：</div>
					<div class="inputtxt">
						<input name="zyMajor" type="text" class="txt3"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt">学习经历：</div>
					<div class="inputtxt">
						<textarea name="rongyu" cols="" rows="" placeholder="可以填写您所学专业包括什么课程，取得的成绩与荣誉以及您的毕业设计等等"></textarea>
						<br /><span>最多可输入400汉字。</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="" class="save">保存</a>
				</div>
			</div>
			<div class="JlBoxRight">
				<a href="" class="del">删除</a>
			</div>
			<div class="clear"></div>
			<div class="addcomeon">
				<a href="">继续添加教育背景</a>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="gongzuo">
		<div class="JlBoxCon">
			<h1><span>工作经历</span></h1>
			<div class="jobjingli">
				<input name="" type="radio" value="" />
				<span>我有工作经验</span>
				<input name="" type="radio" value="" />
				<span>我没有工作经验</span>
			</div>
			<div class="clear"></div>
			<div class="JlBoxLeft" style="width:710px">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>企业名称：</div>
					<div class="inputtxt">
						<input name="jzUnit" type="text" class="txt3"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>职位名称：</div>
					<div class="inputtxt">
						<input name="zwPosition" type="text" class="txt3"/>
					</div>
				</div>
				<div class="clear"></div>

				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>工作时间：</div>
					<div class="inputtxt">
						<input name="ksTime" type="text" class="txt6"/><span class="zhi">至</span><input name="" type="text" class="txt6"/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>工作描述：</div>
					<div class="inputtxt">
						<textarea name="gzContent" cols="" rows="" placeholder="主要填写自己从事工作的岗位职责，在工作中能力的体现，以及自己取得过哪些成绩。"></textarea>
						<br /><span>最多可输入200汉字。</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jobmore">
					<div class="jobmoreicon">填写更详细的工作经历</div>
					<div class="qitaBox" style=" display:none">
						<div class="divbox">
							<div class="nametxt">企业性质：</div>
							<div class="inputdiv">
								<input name="" type="text" class="txt01"/>
							</div>
						</div>
						<div class="divbox">
							<div class="nametxt">所在部门：</div>
							<div class="inputdiv">
								<input name="" type="text" class="txt02"/>
							</div>
						</div>
						<div class="divbox">
							<div class="nametxt">上级职务：</div>
							<div class="inputdiv">
								<input name="" type="text" class="txt02"/>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="" class="save">保存</a>
				</div>
			</div>
			<div class="JlBoxRight" style="width:100px">
				<a href="" class="del">删除</a>
			</div>
			<div class="clear"></div>
			<div class="addcomeon">
				<a href="">继续添加工作经历</a>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="zhengshu">
		<div class="JlBoxCon">
			<h1><span>证书</span></h1>
			<div class="JlBoxLeft">
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt">证书说明：</div>
					<div class="inputtxt">
						<textarea name="zsCertificate" cols="" rows="" placeholder="请填写您在何时何地获得的何种证书"></textarea>
						<br /><span>最多可输入400个字</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="" class="save">保存</a>
				</div>
			</div>
			<div class="JlBoxRight">
				<a href="" class="del">删除</a>
			</div>
		</div>
			<div class="JlBoxCon">
				<h1><span>自我评价</span></h1>
				<div class="JlBoxLeft">
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt">内容：</div>
						<div class="inputtxt">
							<textarea name="pjEvaluation" cols="" rows="" placeholder="请简短的进行自我介绍"></textarea>
							<br /><span>最多可输入400个字</span>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<a href="" class="save">保存</a>
					</div>
				</div>
				<div class="JlBoxRight">
					<a href="" class="del">删除</a>
				</div>
			</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<div class="JlBoxCon">
			<h1><span>附件简历</span></h1>
			<div class="wordSub">
				<p>可以上传word文件或者图片类型的简历，图片支持jpg/gif/png/jpeg格式大小3M以内</p>
				<div class="wordUp">
					<span></span>
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
<script type="text/javascript" src=<%=jsPath+"personal.js"%>></script>
<script type="text/javascript" src=<%=jsPath+"personal_jl.js"%>></script>
</body>
</html>
