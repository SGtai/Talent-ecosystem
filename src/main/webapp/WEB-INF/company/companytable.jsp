<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/21
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = application.getContextPath()+"/layui/";
	String Path =application.getContextPath();
	String jsPath = application.getContextPath()+"/companys/js/";
%>
<html>
<head>
	<title>Title</title>
	<link type="text/css" rel="stylesheet" href=<%=path+"css/layui.css"%>>
	<link href ="favicon.ico" rel="shortcut icon">
</head>

<body>


<script type="text/html" id="barDemo">
	<button lay-event="detail" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i
			class="layui-icon">&#xe63c;</i>
		查看/修改
	</button>
	<button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
		发布/下架
	</button>
	<button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
		<i class="layui-icon">&#xe640;</i>删除
	</button>
</script>

<input id="qyid" type="hidden" value="${sessionScope.Qyinfo.qyid}" />
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">招聘行业：</label>
			<div class="layui-input-inline">
				<select name="position2" id="position" lay-filter="choosePosition"  >
					<option value="0" >请选择行业</option>
					<c:if test="${position!=null}">
						<c:forEach items="${position}" begin="0" var="i">
							<option  value="${i.poid}">${i.type}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">招聘岗位：</label>
			<div class="layui-input-block">
				<select name="zwid" id="zwid2">
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<select name="jobinfoState" id="jobinfoState" lay-filter="" lay-search>
					<option value="">选择</option>
					<option value="发布中">发布中</option>
					<option value="待发布">待发布</option>
					<option value="已到期">已到期</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
		</div>
	</div>
</form>
<table id="demo" lay-filter="test"></table>

<%--查看招聘信息表--%>
<script type="text/html" id="jobinfo">
	<form class="layui-form" action="">
		<input id="zpxxid" name="zpxxid" class="layui-input"  type="hidden" >
		<div class="layui-form-item" style="background-color: #95877c;width: 720px">
			<h3><label class="layui-form-label" style="width: 80px;text-align: left">招聘职位:</label></h3>
			<div class="layui-input-inline">
				<select name="position"  id="position2" lay-filter="choosePosition2" lay-verify="required" >
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
				<input name="beginTime" id="beginTime"  class="layui-input"  type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
			</div>
			<label name="" class="layui-form-label" style="text-align: center">至</label>
			<div class="layui-input-inline">
				<input name="endTime" id="endTime" class="layui-input"  type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系人：</label>
			<div class="layui-input-inline" >
				<input name="lxMan"  id="lxMan" class="layui-input" type="text" autocomplete="off" lay-verify="lxMan" value="${request.getSession()}">

			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系电话：</label>
				<div class="layui-input-inline">
					<input name="lxPhone" id="lxPhone" class="layui-input" type="text" autocomplete="off" lay-verify="number" value="${sessionScope.ojbk}">
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
						<option value="不限">不限</option>
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
				<input name="sex" title="男" type="radio" value="男">
				<input name="sex" title="女" type="radio" value="女">
				<input name="sex" title="不限" type="radio" value="不限">
			</div>
		</div>
		<div class="layui-form-item" >
			<label class="layui-form-label" >工作地点：</label>
			<div class="layui-input-inline">
				<select name="prid" id="province" lay-filter="chooseProvince" lay-verify="required">
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
					<select name="dayTime" id="dayTime" lay-verify="required">
						<option value="">请选择每日上班时长</option>
						<option value="7">7小时</option>
						<option value="8">8小时</option>
						<option value="9">9小时</option>
						<option value="10">10小时</option>
						<option value="11">11小时</option>
						<option value="12">12小时</option>
						<option value="全天">全天</option>
					</select>
				</div>
				<div class="layui-input-inline" >
					<select name="weekTime" id="weekTime" lay-verify="required">
						<option value="">请选择每周休息时间</option>
						<option value="单休">单休</option>
						<option value="双休">双休</option>
						<option value="大小周">大小周</option>
						<option value="无休">无休</option>
					</select>
				</div>
				<div class="layui-input-inline" >
					<select name="workTime" id="workTime" lay-verify="required">
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
				<label class="layui-form-label"  style="background-color:#95877c;width:690px;text-align: left">岗位职责：</label>
			</h3>
			<br><br><br>
			<div class="layui-input-line">
				<textarea name="jobDuty" id="jobDuty"  lay-verify="required" style="width: 600px;margin: 0 auto;float: none;" class="layui-textarea" placeholder="请输入内容"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" type="submit" lay-filter="jobinfo" lay-submit="">修改</button>
				<button class="layui-btn layui-btn-primary" type="reset">重置</button>
			</div>
		</div>
	</form>
</script>

<script src=<%=path + "jquery-3.4.1.js"%> ></script>
<script src=<%=path + "layui.js"%>></script>
<script src="<%=path+"json2.js"%>"></script>
<%--<script src="<%=jsPath+"companytable.js"%>"></script>--%>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="detail" >查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery','table','layedit', 'laydate'], function(){
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
	    var layedit = layui.layedit;
		var laydate = layui.laydate;

		// 设置最小可选的日期
		function minDate(){
			var now = new Date();
			return now.getFullYear()+"-" + (now.getMonth()+1) + "-" + now.getDate();
		};
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 280
			,url: "/company/searchJobinfoTable" //数据接口
			,page: true //开启分页
			,limit:5
			,limits:[5,10,20,50,100]
			,cols: [[ //表头
				{field: 'zpxxid', title: 'ID', width: 80,hide:true}
				,{field: 'type', title: '招聘行业', width:150}
				,{field: 'postion', title: '招聘岗位', width:200}
				,{field: 'zhaopinTime', title: '招聘时间', width:200}
				// ,{field: 'xueliRequire', title: '学历要求', width:100}
				// ,{field: 'age', title: '年龄范围(岁)', width:120}
				// ,{field: 'salary', title: '参考薪资(元)', width:150}
				// ,{field: 'xinzifuli', title: '薪资福利', width: 250}
				,{field: 'zpNum', title: '招聘人数', width: 120, sort: true}
				,{field: 'time', title: '发布时间', width: 200,sort: true}
				,{field: 'jobinfoState', title: '发布状态', width: 110}
				,{fixed: 'right', width: 320, align:'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			,id:'table1'
		});

		form.on('submit(search)', function (data) {
			var myselect=document.getElementById("position");
			var index=myselect.selectedIndex;
			var type = myselect.options[index].text;
			var zwid = $('#zwid2').val();
			var jobinfoState = $('#jobinfoState').val();
			table.reload('table1',{
				url:"/company/searchJobinfoTable"
				,where: { //设定异步数据接口的额外参数，任意设
					type:type,
					zwid:zwid,
					jobinfoState:jobinfoState
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		//查询岗位
		form.on('select(choosePosition)', function(data){
			var name = $('#zwid2');
			name.empty();
			$.ajax(
				{
					type:"POST",
					url:"/company/chooseStation",
					dataType:"text",
					data:{poid:data.value},
					success:function (msg) {
						var gangwei = $('#zwid2');
						gangwei.empty();
						var arr = JSON.parse(msg);
						gangwei.append("<option value=''>请选择岗位</option>");
						for (var i = 0; i < arr.length; i++) {
							gangwei.append("<option value='"+arr[i].stid+"'>"+arr[i].postion+"</option>");
						}
						layui.form.render('select')
					},
					error:function () {
					}
				}
			);
		});
		//弹窗内的岗位选择
		form.on('select(choosePosition2)', function(data){
			var name = $('#zwid');
			name.empty();
			$.ajax(
				{
					type:"POST",
					url:"/company/chooseStation",
					dataType:"text",
					data:{poid:data.value},
					success:function (msg) {
						var gangwei = $('#zwid');
						gangwei.empty();
						var arr = JSON.parse(msg);
						gangwei.append("<option value=''>请选择岗位</option>");
						for (var i = 0; i < arr.length; i++) {
							gangwei.append("<option value='"+arr[i].stid+"'>"+arr[i].postion+"</option>");
						}
						layui.form.render('select')
					},
					error:function () {
					}
				}
			);
		});
		//二级联动城市信息
		form.on('select(chooseProvince)', function(data){
			var name = $('#ctid');

			name.empty();

			name.append('<option value="">请选择区域</option>');
			$.ajax(
				{
					type:"POST",
					url:"/company/chooseCity",
					dataType:"text",
					data:{prid:data.value},
					success:function (msg) {
						var city = $('#ctid');
						city.empty();
						var arr = JSON.parse(msg);
						city.append("<option value=''>请选择城市</option>");
						for (var i = 0; i < arr.length; i++) {
							city.append("<option value='"+arr[i].ctid+"'>"+arr[i].name+"</option>");
						}
						layui.form.render('select')
					},
					error:function () {

					}
				}
			);
		});

		//监听3个按钮，查看/修改，发布/下架，删除
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			//查看及修改
			if(layEvent === 'detail'){

				var qyid=$('#qyid').val();
				$.ajax(
					{
						type:"POST",
						url:"/company/searchJobinfo",
						dataType:"json",
						data:{zpxxid:data.zpxxid,qyid:qyid},
						success:function (msg) {

                            //打开查看页面
							var index=layer.open({
                                type: 1,
                                content: $('#jobinfo').html(),
                                area: ['740px','550px'],
                                title: '招聘信息',
                                btn:['取消'],
                                anim: 1,//0-6的动画形式，-1不开启
                                offset: '40px',
                                success:function () {
	                                var zpxxid=$("#zpxxid").val(msg[0].zpxxid);
	                                //日期
	                                laydate.render({
		                                elem: '#beginTime'
		                                ,min:minDate()
		                                ,value:msg[0].beginTime//回显日期

                                     });
	                                laydate.render({
		                                elem: '#endTime'
		                                ,min:minDate()
		                                ,value:msg[0].endTime//回显日期
	                                });

	                                var poid=msg[0].poid;
	                                var prid=msg[0].prid;

									//行业及岗位二级联动回显
	                                //行业回显
	                                $("#position2").each(function () {
		                                // this代表的是<option></option>，对option再进行遍历
		                                $(this).children("option").each(function () {
			                                // 判断需要对那个选项进行回显
			                                if (this.value ==poid) {
				                                // 进行回显
				                                $(this).attr("selected", "selected");
				                                //二级岗位回显
				                                $.ajax(
					                                {
						                                type:"POST",
						                                url:"/company/chooseStation",
						                                dataType:"text",
						                                data:{poid:poid},
						                                success:function (msg2) {
							                                var gangwei = $('#zwid');
							                                gangwei.empty();
							                                var arr = JSON.parse(msg2);
							                                gangwei.append("<option value=''>请选择岗位</option>");
							                                for (var i = 0; i < arr.length; i++) {
								                                gangwei.append("<option value='"+arr[i].stid+"'>"+arr[i].postion+"</option>");
							                                }
							                                $("#zwid").each(function () {
								                                // this代表的是<option></option>，对option再进行遍历
								                                $(this).children("option").each(function () {
									                                // 判断需要对那个选项进行回显
									                                if (this.value ==msg[0].zwid) {
										                                // 进行回显
										                                $(this).attr("selected", "selected");
									                                }
								                                });
							                                });
							                                layui.form.render('select');

						                                },
						                                error:function () {
						                                }
					                                }
				                                );

			                                }
		                                });
	                                });
									//还差性别及城市省份ID回显
	                                $("#province").each(function () {
		                                // this代表的是<option></option>，对option再进行遍历
		                                $(this).children("option").each(function () {
			                                // 判断需要对那个选项进行回显
			                                if (this.value ==prid) {
				                                // 进行回显
				                                $(this).attr("selected", "selected");
				                                $.ajax(
					                                {
						                                type:"POST",
						                                url:"/company/chooseCity",
						                                dataType:"text",
						                                data:{prid:prid},
						                                success:function (msg2) {
							                                var city = $('#ctid');
							                                city.empty();
							                                var arr = JSON.parse(msg2);
							                                city.append("<option value=''>请选择城市</option>");
							                                for (var i = 0; i < arr.length; i++) {
								                                city.append("<option value='"+arr[i].ctid+"'>"+arr[i].name+"</option>");
							                                }
							                                $("#ctid").each(function () {
							                                    // this代表的是<option></option>，对option再进行遍历
							                                    $(this).children("option").each(function () {
							                                        // 判断需要对那个选项进行回显
							                                        if (this.value ==msg[0].ctid) {
							                                            // 进行回显
							                                            $(this).attr("selected", "selected");
							                                        }
							                                    });
							                                });
							                                layui.form.render('select')
						                                },
						                                error:function (msg) {
							                                alert(msg);
						                                }
					                                }
				                                );
			                                }
		                                });
	                                });
	                                //数据回显方法
                                    searchJob(msg[0]);
                                    form.render();

                                }

                            });
							//修改招聘表提交
							form.on('submit(jobinfo)', function(data){

								if($('#beginTime').val()>$('#endTime').val()){
									layer.alert("招聘日期终止日期小于起止日期！", { icon: 1, offset: "auto", time:1500 });
									return false;
								}else if ($('#ageLow').val()>$('#ageHigh').val()){
									layer.alert("年龄范围填写错误！", { icon: 1, offset: "auto", time:1500 });
									return false;
								}else if ($('#ageLow').val()<16||$('#ageHigh').val()>60){
									layer.alert("超过法定劳动适龄年龄！", { icon: 1, offset: "auto", time:1500 });
									return false;
								}else if($('#salaryLow').val()>$('#salaryHigh').val()){
									layer.alert("薪资范围填写错误！", { icon: 1, offset: "auto", time:1500 });
									return false;
								}else{
									// 发布招聘信息
									$.ajax(
										{
											type:"POST",
											url:"/company/updateJobinfo",
											dataType:"text",
											data:data.field,
											success:function (msg) {
												if (msg==="success"){
													layer.alert('招聘信息修改成功!', function(index) {
														layer.closeAll();
														$(".layui-laypage-btn")[0].click();
													})
												} else{
													layer.alert("招聘信息修改失败", { icon: 1, offset: "auto", time:1500 });
												}
											},
											error:function (msg) {
												alert(msg);
											}
										}
									);
									return false;
								}

							});
						},
						error:function () {
							alert("服务器正忙.....");
						}
					}
				);
			}
			//删除
			else if(layEvent === 'update'){
					var jobinfoState;
					if(data.jobinfoState==='发布中'){
						jobinfoState='待发布'
					}else if(data.jobinfoState==='待发布'){
						jobinfoState='发布中'
					}else {
						jobinfoState='已到期';
						layer.msg('已到期无法更改状态');
					}

					$.ajax({
						type:"POST",
						url:"/company/updateJobinfoState",
						dataType:"text",
						data:{zpxxid:data.zpxxid,jobinfoState:jobinfoState},
						//从servlet接收的数据
						success:function (msg) {
							if (msg ==='success') {
								// alert("状态修改成功！");
								$(".layui-laypage-btn")[0].click();
							} else {
								layer.msg("修改失败！")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});
			} else if(layEvent === 'delete'){
				if(data.jobinfoState==='发布中'){
					layer.msg('发布中无法删除状态');
					return false;
				}else {
					$.ajax({
						type:"POST",
						url:"/company/deleteJobinfo",
						dataType:"text",
						data:{zpxxid:data.zpxxid},
						//从servlet接收的数据
						success:function (msg) {
							if (msg ==='success') {
								layer.msg('删除成功');
								$(".layui-laypage-btn")[0].click();
							} else {
								layer.msg("修改失败！")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});

				}


			}
		});

	});


	//回显数据插入
	function searchJob(param) {

		var lxMan=$('#lxMan');
		var lxPhone=$('#lxPhone');
		var lxAddress=$('#lxAddress');
		var xueliRequire=$('#xueliRequire');
		var zhiyeType=$('#zhiyeType');
		var gzExperience=$('#gzExperience');
		var ageLow=$('#ageLow');
		var ageHigh=$('#ageHigh');
		var gzAddress=$('#gzAddress');
		var salaryLow=$('#salaryLow');
		var salaryHigh=$('#salaryHigh');
		var dayTime=$('#dayTime');
		var weekTime=$('#weekTime');
		var workTime=$('#workTime');
		var welfare=$('#welfare');
		var zpNum=$('#zpNum');
		var jobDuty=$('#jobDuty');

		lxMan.empty();
		lxPhone.empty();
		lxAddress.empty();
		lxMan.val(param.lxMan);
		lxPhone.val(param.lxPhone);
		lxAddress.val(param.lxAddress);

		xueliRequire.find("option[value='"+param.xueliRequire+"']").attr("selected",'selected');
		zhiyeType.find("option[value='"+param.zhiyeType+"']").attr("selected",'selected');
		gzExperience.find("option[value='"+param.gzExperience+"']").attr("selected",'selected');

		ageLow.empty();
		ageHigh.empty();
		ageLow.val(param.ageLow);
		ageHigh.val(param.ageHigh);

		$("input[type=radio][name='sex'][value='"+param.sex+"']").attr("checked",'checked');
		//上班地点回显
		gzAddress.empty();
		gzAddress.val(param.gzAddress);

		salaryLow.empty();
		salaryHigh.empty();
		salaryLow.val(param.salaryLow);
		salaryHigh.val(param.salaryHigh);

		//上班时间回显
		dayTime.find("option[value='"+param.dayTime+"']").attr("selected",'selected');
		weekTime.find("option[value='"+param.weekTime+"']").attr("selected",'selected');
		workTime.find("option[value='"+param.workTime+"']").attr("selected",'selected');
		//福利回显
		$("input[name=baoxian][value="+param.baoxian+"]").attr("checked","checked");
		$("input[name=gjijin][value="+param.gjijin+"]").attr("checked","checked");
		$("input[name=jiangjin][value="+param.jiangjin+"]").attr("checked","checked");
		$("input[name=zhusu][value="+param.zhusu+"]").attr("checked","checked");

		welfare.empty();
		welfare.val(param.welfare);
		//招聘人数
		zpNum.empty();
		zpNum.val(param.zpNum);
		//岗位职责
		jobDuty.empty();
		jobDuty.text(param.jobDuty);
	}

</script>
</body>
</html>