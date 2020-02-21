<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/19
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath()+"/layui/";
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>发布招聘信息</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>  media="all">
	<style>
		body {
			width: 100%;
			height: 700px;
		}

		#layout {
			width: 720px;
			margin: auto;
			margin-top: 15px;
			border: #9F9F9F solid 1px;

		}
		/*.layui-form-label{*/
		/*	width: 120px;*/

		/*}*/
		/*.layui-input{*/
		/*	width: 250px;*/
		/*}*/
		/*#button1{*/
		/*	margin-left: 38%;*/
		/*}*/
	</style>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend style="margin: 0 auto;float: none;">招聘信息填写</legend>
</fieldset>
<div id="layout">


	<form class="layui-form" action="">
		<input id="qyid" type="hidden" value="${sessionScope.Qyinfo.qyid}" />
		<div class="layui-form-item" style="background-color: #95877c;width: 720px">
			<h3><label class="layui-form-label" style="width: 80px;text-align: left">招聘职位:</label></h3>
			<div class="layui-input-inline">
				<select name="position" lay-filter="choosePosition" lay-verify="required" >
					<option value="">请选择行业</option>
					<c:if test="${position!=null}">
						<c:forEach items="${position}" begin="0" var="i">
							<option value="${i.poid}">${i.type}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="zwid" id="zwid" lay-verify="required">
				</select>
			</div>
		</div>
		<div class="layui-form-item" >
			<label class="layui-form-label" >招聘单位：</label>
			<div class="layui-input-inline" >
				<label name="qyName" class="layui-form-label" style="width: 180px;text-align: left;" >${sessionScope.Qyinfo.qyName}</label>
			</div>
		</div>
		<div class="layui-form-item" >
			<label class="layui-form-label" >招聘日期：</label>
			<div class="layui-input-inline">
				<input name="beginTime" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
			</div>
			<label name="" class="layui-form-label" style="text-align: center">至</label>
			<div class="layui-input-inline">
				<input name="endTime" class="layui-input" id="date1" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系人：</label>
			<div class="layui-input-inline" >
				<input name="lxMan" id="lxMan" class="layui-input" type="text" autocomplete="off" lay-verify="lxMan" >
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系电话：</label>
				<div class="layui-input-inline">
					<input name="lxPhone" id="lxPhone" class="layui-input" type="text" autocomplete="off" lay-verify="number" >
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">通信地址：</label>
			<div class="layui-input-inline"  >
				<input name="lxAddress" id="lxAddress" style="width: 600px" class="layui-input" type="text" autocomplete="off"  lay-verify="lxAddress" >
			</div>
		</div>
		<div class="layui-form-item" style="background-color: #95877c;width:720px">
			<h3><label class="layui-form-label" style="width: 150px;text-align: left">职业基本信息:</label></h3>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">学历要求：</label>
				<div class="layui-input-inline">
					<select name="xueliRequire" id="xueliRequire" lay-verify="required">
						<option value="">请选择学历</option>
						<option value="博士">博士及以上</option>
						<option value="硕士">硕士</option>
						<option value="研究生">研究生</option>
						<option value="本科">本科</option>
						<option value="专科">专科</option>
						<option value="高中">高中、中技、中专</option>
						<option value="初中">初中</option>
						<option value="小学">小学</option>
						<option value="不限">不限</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">职业性质：</label>
				<div class="layui-input-inline">
					<select name="zhiyeType" id="zhiyeType" lay-verify="required">
						<option value="">请选择职业性质</option>
						<option value="全职">全职</option>
						<option value="兼职">兼职</option>
						<option value="实习">实习</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">工作经验：</label>
				<div class="layui-input-inline">
					<select name="gzExperience" id="gzExperience" lay-verify="required">
						<option value="">请选择工作经验</option>
						<option value="10年以上">10年以上</option>
						<option value="6~10年">6~10年</option>
						<option value="3~5年">3~5年</option>
						<option value="1~2年">1~2年</option>
						<option value="应届毕业生">应届毕业生</option>
					<option value="博士">博士及以上</option>
					<option value="硕士">硕士</option>
					<option value="研究生">研究生</option>
					<option value="本科">本科</option>
					<option value="专科">专科</option>
					<option value="高中">高中、中技、中专</option>
					<option value="初中">初中</option>
					<option value="小学">小学</option>
					<option value="实习">实习</option>
					<option value="6~10年">6~10年</option>
					<option value="3~5年">3~5年</option>
					<option value="1~2年">1~2年</option>
					<option value="应届毕业生">应届毕业生</option>
						<option value="不限">不限</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">年龄范围：</label>
			<div class="layui-input-inline" style="width: 100px;">
				<input name="ageLow" id="ageLow" class="layui-input" type="text" placeholder="最低年龄" autocomplete="off"  lay-verify="number">
			</div>
			<div class="layui-form-mid">-</div>
			<div class="layui-input-inline" style="width: 100px;">
				<input name="ageHigh" id="ageHigh" class="layui-input" type="text" placeholder="最高年龄" autocomplete="off" lay-verify="number">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别要求：</label>
			<div class="layui-input-block">
				<input name="sex" title="男" type="radio" checked="" value="男">
				<input name="sex" title="女" type="radio" value="女">
				<input name="sex" title="不限" type="radio" value="不限">
			</div>
		</div>
		<div class="layui-form-item" >
			<label class="layui-form-label" >工作地点：</label>
			<div class="layui-input-inline">
				<select name="" lay-filter="chooseProvince" lay-verify="required">
					<option value="">请选择省份</option>
					<c:if test="${province!=null}">
						<c:forEach items="${province}" begin="0" var="i">
							<option value="${i.prid}">${i.name}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="ctid" id="ctid" lay-verify="required">
					<%--				<option value="">请选择区域</option>--%>
				</select>
			</div>
			<div class="layui-input-inline" >
				<input name="gzAddress" id="gzAddress" style="width: 200px" class="layui-input" type="text" autocomplete="off" placeholder="详细地址" lay-verify="required" >
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">参考月薪：</label>

				<div class="layui-input-inline" style="width: 100px;">
					<input name="salaryLow" id="salaryLow" class="layui-input" type="text" placeholder="￥最低月薪" autocomplete="off" lay-verify="number">
				</div>
				<div class="layui-form-mid">-</div>
				<div class="layui-input-inline" style="width: 100px;">
					<input name="salaryHigh" id="salaryHigh" class="layui-input" type="text" placeholder="￥最高月薪" autocomplete="off" lay-verify="number">
				</div>
				<div class="layui-input-inline" >
					<label name="" style="width: 200px;text-align: left;color: #4E5465"  class="layui-form-label" >(如需面议该栏均填写"0")</label>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">上班时间：</label>

				<div class="layui-input-inline" >
					<select name="dayTime" id="gztime1" lay-verify="required">
						<option value="">请选择每日上班时长</option>
						<option value="7小时">7小时</option>
						<option value="8小时">8小时</option>
						<option value="9小时">9小时</option>
						<option value="10小时">10小时</option>
						<option value="11小时">11小时</option>
						<option value="12小时">12小时</option>
						<option value="全天">全天</option>
					</select>
				</div>
				<div class="layui-input-inline" >
					<select name="weekTime" id="gztime2" lay-verify="required">
						<option value="">请选择每周休息时间</option>
						<option value="单休">单休</option>
						<option value="双休">双休</option>
						<option value="大小周">大小周</option>
						<option value="无休">无休</option>
					</select>
				</div>
				<div class="layui-input-inline" >
					<select name="workTime" id="gztime3" lay-verify="required">
						<option value="">请选择上班班次</option>
						<option value="白班">白班</option>
						<option value="晚班">晚班</option>
						<option value="早班">早班</option>
						<option value="中班">中班</option>
						<option value="晚班">晚班</option>
						<option value="早晚班">早晚班</option>
						<option value="三班倒">三班倒</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">薪资福利：</label>
			<div class="layui-input-block">
				<input name="baoxian" title="五险" type="checkbox" value="五险">
				<input name="gjijin" title="公积金" type="checkbox" value="公积金">
				<input name="jiangjin" title="奖金提成" type="checkbox" value="奖金提成">
				<input name="zhusu" title="提供住宿" type="checkbox" value="提供住宿">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">其他福利：</label>

			<div class="layui-input-inline"  >
				<input name="welfare" id="welfare" style="width: 600px" class="layui-input" type="text" autocomplete="off"  lay-verify="required" placeholder="填写薪资福利">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">招聘人数：</label>
				<div class="layui-input-inline">
					<input name="zpNum" id="zpNum" class="layui-input" type="text" autocomplete="off" lay-verify="number" placeholder="增加招聘人数">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<h3>
				<label class="layui-form-label"  style="background-color: #95877c;width:690px;text-align: left">岗位职责：</label>
			</h3>
			<br><br><br>
			<div class="layui-input-line">
				<textarea id="jobDuty"  lay-verify="required" style="width: 600px;margin: 0 auto;float: none;" class="layui-textarea" placeholder="请输入内容"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" type="submit" lay-filter="jobinfo" lay-submit="">立即提交</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>
</div>
<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<script src="<%=jsPath+"jobinfo.js"%>"></script>

</body>
</html>