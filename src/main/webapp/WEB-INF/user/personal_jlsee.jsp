<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<font>${sessionScope.user.phone}</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="<%=path%>jump/user/personal_updatepsd">修改密码</a></li>
							<li><a href="javascript:void(0)" onclick="tuichu2(<%=path%>)">退出</a></li>
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
			<div class="NavLeftBox">
				<a href="<%=path%>jump/user/personal_help" class="a8">帮助中心</a>
			</div>
		</div>

	</div>
	<div class="perRightcon layui-form">
		<div class="seeTitle">
			<div class="seeTitle2">
				<a href="<%=path%>user/gopersonaljl">返回简历列表</a>
			</div>
		</div>
		<form class="layui-form" id="userinfojl">
		<div class="JlBoxCon layui-form">
			<div class="layui-form-item">
				<div class="nametxt"><span>*</span>是否隐藏简历（off为不隐藏）：</div>
				<div class="layui-input-block">
					<input name="ycHide" type="checkbox" lay-skin="switch" lay-text="ON|OFF">
				</div>
			</div>
			<input hidden value="${jlId}" name="jlId" id="jlId">
			<h1><span>基本信息</span></h1>
			<div class="JlBoxLeft layui-form">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>简历 名称：</div>
					<div class="inputtxt">
						<input name="jlname" type="text" class="txt2"
							<c:if test="${upatelist[0].jlname != null}">
								value="${upatelist[0].jlname}"
							</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>姓    名：</div>
					<div class="inputtxt">
						<input name="yhname" type="text" class="txt1"
							<c:if test="${upatelist[0].yhname != null}">
								value="${upatelist[0].yhname}"
							</c:if>
						<c:if test="${userinfo.name != null}">
							value="${userinfo.name}"
						</c:if>
						/>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>性    别：</div>
					<div class="layui-input-inline">
						<select name="xbSex" lay-filter="sex">
							<option value=""></option>
							<c:if test="${userinfo.sex == null}">
								<option value="男">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${userinfo.sex == '男' or upatelist[0].xbSex == '男'}">
								<option value="男" selected="">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${userinfo.sex == '女' or upatelist[0].xbSex == '女'}">
								<option value="男">男</option>
								<option value="女" selected="">女</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="clear"></div>
				<div class="clear"></div>
				<div class="layui-form-item jldiv">
					<div class="nametxt"><span>*</span>出生年月：</div>
					<div class="layui-input-inline">
						<input id="csTime" name="csTime" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"
					       <c:if test="${userinfo.birthday != null}">
					            value= "${userinfo.birthday}"
						   </c:if>
								<c:if test="${upatelist[0].csTime != null}">
								       value="${upatelist[0].csTime}"
								</c:if>

									>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>最高学历：</div>
					<div class="inputtxt">
						<input name="xl" type="text" class="txt" placeholder="请输入您的学历"

									<c:if test="${upatelist[0].xl != null}">
										value="${upatelist[0].xl}"
									</c:if>

								<c:if test="${userinfo.degree != null}">
									value="${userinfo.degree}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>毕业学校：</div>
					<div class="inputtxt">
						<input name="byschool" type="text" class="txt" placeholder="请输入您的毕业学校"

									<c:if test="${upatelist[0].byschool != null}">
										value="${upatelist[0].byschool}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>毕业专业：</div>
					<div class="inputtxt">
						<input name="zy" type="text" class="txt" placeholder="请输入您的毕业专业"

									<c:if test="${upatelist[0].zy != null}">
										value="${upatelist[0].zy}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>国籍：</div>
					<div class="inputtxt">
						<input name="gjNationality" type="text" class="txt" placeholder="请输入您的国籍"

									<c:if test="${upatelist[0].gjNationality != null}">
										value="${upatelist[0].gjNationality}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>政治面貌：</div>
					<div class="inputtxt">
						<input name="mmFace" type="text" class="txt" placeholder="群众/团员/党员"

									<c:if test="${upatelist[0].mmFace != null}">
										value="${upatelist[0].mmFace}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>手机号码：</div>
					<div class="inputtxt">
						<span class="phone">
							 <c:if test="${sessionScope.user.phone != null}">
								 ${sessionScope.user.phone}
							 </c:if>
							</span>
						<a href="<%=path%>jump/user/personal_updatenum" class="updateph">修改手机号</a>
						<span class="check1"></span>
						<span class="ycname">接收短信面试通知</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>邮  箱：</div>
					<div class="inputtxt">
						<input name="yxMailbox" type="text" class="txt2" placeholder="请输入完整的邮箱地址"

									<c:if test="${upatelist[0].yxMailbox != null}">
										value="${upatelist[0].yxMailbox}"
									</c:if>


						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>民  族：</div>
					<div class="inputtxt">
						<input name="minzu" type="text" class="txt" placeholder="请输入您的民族"

									<c:if test="${upatelist[0].minzu != null}">
										value="${upatelist[0].minzu}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>居住地：</div>
					<div class="inputtxt">
						<input name="jzdResidence" type="text" class="txt3" placeholder="请填写您的现居住地"

									<c:if test="${upatelist[0].jzdResidence != null}">
										value="${upatelist[0].jzdResidence}"
									</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="jldiv">
				<a href="javascript:void(0)" class="save" onclick="userinfojl('<%=path%>')">保存</a>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="yixiang" class="layui-form">
		<div class="JlBoxCon layui-form">
			<input hidden value="${jzyxid}" name="jzyxid" >
			<h1><span>求职意向</span></h1>
			<div class="JlBoxLeft">
					<div class="layui-form-item jldiv">
						<div class="nametxt"><span>*</span>期望工作性质：</div>
						<div class="layui-input-inline inputtxt">
							<select name="workstate" lay-filter="workstate">
								<option value=""></option>

									<c:if test="${upatelist[0].jobintension[0].workstate == '全职'}">
										<option value="全职" selected="">全职</option>
										<option value="兼职">兼职</option>
										<option value="实习">实习</option>
									</c:if>
									<c:if test="${upatelist[0].jobintension[0].workstate == '兼职'}">
										<option value="全职">全职</option>
										<option value="兼职" selected="">兼职</option>
										<option value="实习">实习</option>
									</c:if>
									<c:if test="${upatelist[0].jobintension[0].workstate == '实习'}">
										<option value="全职">全职</option>
										<option value="兼职">兼职</option>
										<option value="实习" selected="">实习</option>
									</c:if>

								<c:if test="${upatelist[0].jobintension[0].workstate == null}">
									<option value="全职">全职</option>
									<option value="兼职">兼职</option>
									<option value="实习">实习</option>
								</c:if>

							</select>
						</div>
					</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望月薪：</div>
					<div class="inputtxt">
						<input name="monthlyPay" type="text" class="txt2"

							<c:if test="${upatelist[0].jobintension[0].monthlyPay != null}">
								value="${upatelist[0].jobintension[0].monthlyPay}"
							</c:if>

						/>

					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望工作地点：</div>
					<div class="inputtxt">
						<input name="workPlace" type="text" class="txt3"

								<c:if test="${upatelist[0].jobintension[0].workPlace != null}">
									value="${upatelist[0].jobintension[0].workPlace}"
								</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>期望职位类别：</div>
					<div class="inputtxt">
						<input name="intentionWork" type="text" class="txt2"

								<c:if test="${upatelist[0].jobintension[0].workstate != null}">
									value="${upatelist[0].jobintension[0].workstate}"
								</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>其他要求：</div>
					<div class="inputtxt">
						<input name="other" type="text" class="txt2"

								<c:if test="${upatelist[0].jobintension[0].other != null}">
									value="${upatelist[0].jobintension[0].other}"
								</c:if>

						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="javascript:void(0)" class="save" onclick="yixiang('<%=path%>')">保存</a>
				</div>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>

<c:if test="${upatelist[0].experienceList != null}">
	<c:forEach items="${upatelist[0].experienceList}" begin="0" var="i" varStatus="status">
		<div class="JlBoxCon" id="jiaoyudiv">
			<form id="jiaoyu" class="layui-form">
			<input hidden value="${i.jyid}" name="jyId">
			<h1><span>教育背景${status.index+1}</span></h1>
			<div class="JlBoxLeft">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>学校名称：</div>
					<div class="inputtxt">
						<input name="school" type="text" class="txt2"
						  <c:if test="${i.school != null}">
							  value="${i.school}"
						  </c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>就学时间：</div>
					<div class="inputtxt">
						<input name="sxSchooltime" type="text" class="txt2"
								<c:if test="${i.sxSchooltime != null}">
									value="${i.sxSchooltime}"
								</c:if>
						/>
					</div>
				</div>

				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>专业名称：</div>
					<div class="inputtxt">
						<input name="zyMajor" type="text" class="txt2"
								<c:if test="${i.zyMajor != null}">
									value="${i.zyMajor}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt">学习经历：</div>
					<div class="inputtxt">
						<textarea name="rongyu" cols="" rows="" placeholder="可以填写您所学专业包括什么课程，取得的成绩与荣誉以及您的毕业设计等等"><c:if test="${i.zyMajor != null}">${i.rongyu}</c:if></textarea>
						<br /><span>最多可输入400汉字。</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="javascript:void(0)" class="save" onclick="jiaoyu(this,'<%=path%>')">保存</a>
				</div>
			</div>
			<div class="JlBoxRight">
				<a href="" class="del">删除</a>
			</div>
			<div class="clear"></div>
			<div class="addcomeon">
				<a href="javascript:void(0)" onclick="morejiaoyu('<%=path%>')">继续添加教育背景</a>
			</div>
			</form>
		</div>
	</c:forEach>
</c:if>

		<c:if test="${upatelist[0].experienceList == null}">
				<div class="JlBoxCon" id="jiaoyudiv">
					<form id="jiaoyu" class="layui-form">
						<input hidden value="${jyid}" name="jyId">
						<h1><span>教育背景</span></h1>
						<div class="JlBoxLeft">
							<div class="jldiv">
								<div class="nametxt"><span>*</span>学校名称：</div>
								<div class="inputtxt">
									<input name="school" type="text" class="txt2"/>
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
								<a href="javascript:void(0)" class="save" onclick="jiaoyu(this,'<%=path%>')">保存</a>
							</div>
						</div>
						<div class="JlBoxRight">
							<a href="" class="del">删除</a>
						</div>
						<div class="clear"></div>
						<div class="addcomeon">
							<a href="javascript:void(0)" onclick="morejiaoyu('<%=path%>')">继续添加教育背景</a>
						</div>
					</form>
					<div class="clear"></div>
					<div class="lineddiv"></div>
				</div>
		</c:if>

<c:if test="${upatelist[0].undergoList != null}">
	<c:forEach items="${upatelist[0].undergoList}" begin="0" var="i" varStatus="status">
		<div class="JlBoxCon" id="gongzuodiv">
			<form id="gongzuo" class="layui-form">
			<input hidden value="${i.gzjlId}" name="gzjlId">
			<h1><span>工作经历${status.index+1}</span></h1>

			<div class="clear"></div>
			<div class="JlBoxLeft" style="width:710px">
				<div class="jldiv">
					<div class="nametxt"><span>*</span>企业名称：</div>
					<div class="inputtxt">
						<input name="jzUnit" type="text" class="txt3"
								<c:if test="${i.jzUnit != null}">
									value="${i.jzUnit}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>职位名称：</div>
					<div class="inputtxt">
						<input name="zwPosition" type="text" class="txt3"
								<c:if test="${i.zwPosition != null}">
									value="${i.zwPosition}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>

				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>工作时间：</div>
					<div class="inputtxt">
						<input name="ksTime" type="text" class="txt3" placeholder="年/月——年/月"
								<c:if test="${i.ksTime != null}">
									value="${i.ksTime}"
								</c:if>
						/>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt"><span>*</span>工作描述：</div>
					<div class="inputtxt">
						<textarea name="gzContent" cols="" rows="" placeholder="主要填写自己从事工作的岗位职责，在工作中能力的体现，以及自己取得过哪些成绩。"><c:if test="${i.gzContent != null}">${i.gzContent}</c:if>
						</textarea>
						<br /><span>最多可输入200汉字。</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="javascript:void(0)" class="save" onclick="gongzuo(this,'<%=path%>')">保存</a>
				</div>
			</div>
			<div class="JlBoxRight" style="width:100px">
				<a href="" class="del">删除</a>
			</div>
			<div class="clear"></div>
			<div class="addcomeon">
				<a href="javascript:void(0)" onclick="moregongzuo('<%=path%>')">继续添加工作经历</a>
			</div>
			</form>
		</div>

		<div class="clear"></div>
		<div class="lineddiv"></div>
	</c:forEach>
</c:if>

		<c:if test="${upatelist[0].undergoList == null}">
				<div class="JlBoxCon" id="gongzuodiv">
					<form id="gongzuo" class="layui-form">
						<input hidden value="${gzjlId}" name="gzjlId">
						<h1><span>工作经历</span></h1>

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
									<input name="ksTime" type="text" class="txt3" placeholder="年/月——年/月"/>
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
							<div class="jldiv">
								<a href="javascript:void(0)" class="save" onclick="gongzuo(this,'<%=path%>')">保存</a>
							</div>
						</div>
						<div class="JlBoxRight" style="width:100px">
							<a href="" class="del">删除</a>
						</div>
						<div class="clear"></div>
						<div class="addcomeon">
							<a href="javascript:void(0)" onclick="moregongzuo('<%=path%>')">继续添加工作经历</a>
						</div>
					</form>
				</div>

				<div class="clear"></div>
				<div class="lineddiv"></div>
		</c:if>


		<form id="zhengshu" class="layui-form">
			<input hidden value="${jlId}" name="jlId">
		<div class="JlBoxCon">
			<h1><span>证书</span></h1>
			<div class="JlBoxLeft">
				<div class="clear"></div>
				<div class="jldiv">
					<div class="nametxt">证书说明：</div>
					<div class="inputtxt">
						<textarea name="zsCertificate" cols="" rows="" placeholder="请填写您在何时何地获得的何种证书"><c:if test="${upatelist[0].zsCertificate != null}">${upatelist[0].zsCertificate}</c:if>
						</textarea>
						<br /><span>最多可输入400个字</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="jldiv">
					<a href="javascript:void(0)" class="save" onclick="zhengshu('<%=path%>')">保存</a>
				</div>
			</div>
			<div class="JlBoxRight">
				<a href="" class="del">删除</a>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div class="lineddiv"></div>
		<form id="pingjia">
			<div class="JlBoxCon">
				<input hidden value="${jlId}" name="jlId">
				<h1><span>自我评价</span></h1>
				<div class="JlBoxLeft">
					<div class="clear"></div>
					<div class="jldiv">
						<div class="nametxt">内容：</div>
						<div class="inputtxt">
							<textarea name="pjEvaluation" cols="" rows="" placeholder="请简短的进行自我介绍"><c:if test="${upatelist[0].pjEvaluation != null}">${upatelist[0].pjEvaluation}</c:if></textarea>
							<br /><span>最多可输入400个字</span>
						</div>
					</div>
					<div class="clear"></div>
					<div class="jldiv">
						<a href="javascript:void(0)" class="save" onclick="pingjia('<%=path%>')">保存</a>
					</div>
				</div>
				<div class="JlBoxRight">
					<a href="" class="del">删除</a>
				</div>
				</div>
		</form>
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
<script>
	layui.use('form', function () {
		var form = layui.form;
		form.render();
	});
</script>

</body>
</html>
