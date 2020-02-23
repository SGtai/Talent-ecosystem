layui.use(['form', 'layer', 'jquery','table'], function(){
	var table = layui.table;
	var layer = layui.layer;
	var form = layui.form;
	var $ = layui.jquery;
	//第一个实例
	table.render({
		elem: '#demo'
		,height: 300
		,url: "/company/searchJobinfoTable" //数据接口
		,page: true //开启分页
		,limit:5
		,limits:[5,10,20,50,100]
		,cols: [[ //表头
			{field: 'zpxxid', title: 'ID', width: 80,hide:true}
			,{field: 'type', title: '招聘行业', width:150}
			,{field: 'postion', title: '招聘岗位', width:200}
			,{field: 'zhaopinTime', title: '招聘时间', width:200}
			,{field: 'xueliRequire', title: '学历要求', width:100}
			,{field: 'age', title: '年龄范围(岁)', width:120}
			,{field: 'salary', title: '参考薪资(元)', width:150}
			,{field: 'xinzifuli', title: '薪资福利', width: 250}
			,{field: 'zpNum', title: '招聘人数', width: 120, sort: true}
			,{field: 'time', title: '发布时间', width: 200,sort: true}
			,{field: 'jobinfoState', title: '发布状态', width: 110}
			,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
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

	form.on('select(choosePosition)', function(data){
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
				error:function (msg) {
					alert(msg);
				}
			}
		);
	});

	//监听头工具栏事件
	table.on('toolbar(test)', function(obj){
		var checkStatus = table.checkStatus(obj.config.id)
			,data = checkStatus.data; //获取选中的数据
		switch(obj.event){
			case 'add':
				layer.msg('添加');
				break;
			case 'update':
				if(data.length === 0){
					layer.msg('请选择一行');
				} else if(data.length > 1){
					layer.msg('只能同时编辑一个');
				} else {
					layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
				}
				break;
			case 'delete':
				if(data.length === 0){
					layer.msg('请选择一行');
				} else {
					layer.msg('删除');
				}
				break;
		};
	});

	//监听行工具事件
	table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
			,layEvent = obj.event; //获得 lay-event 对应的值
		if(layEvent === 'detail'){
			var zpxxid=data.zpxxid;
			$.ajax(
				{
					type:"POST",
					url:"/company/searchJobinfo",
					dataType:"json",
					data:{zpxxid:zpxxid},
					success:function (msg) {
						//数据回显方法
						// searchJob(msg);
						// window.location.href=window.location;

						layer.open({
							type: 1,
							content: $('#jobinfo').html(),
							area: ['740px','550px'],
							title: '招聘信息',
							btn:['取消'],
							anim: 1,//0-6的动画形式，-1不开启
							offset: '40px',
							success:function () {
								form.render();
							}
						});
					},
					error:function () {
						alert("服务器正忙.....");
					}
				}
			);
			//打开查看页面

		} else if(layEvent === 'del'){
			layer.confirm('真的删除行么', function(index){

				var account =data.account;//data.XXX 后缀直接写需要取值的名称与表头给的field一致
				alert(account);
				$.ajax({
					type:"post",
					url:"",
					//预期服务器返回的数据类型;
					datatype:"text",
					//从该js会发出到服务器的数据
					data:{account:account},
					//从servlet接收的数据
					success:function (msg) {
						if (msg === 'success') {
							alert("删除成功！");
							window.location.reload();
						} else {
							layer.msg("删除失败！")
						}
					}
					,error:function () {
						alert("服务器正忙.....");
					}
				});
				layer.close(index);
			});
		} else if(layEvent === 'edit'){
			layer.msg('编辑操作');
		}
	});
	$('#register').click(function () {
		layer.open({
			type: 1,
			content: $('#registerface').html(),
			area: ['500px'],
			title: '前台注册页面',
			btn:['取消'],
			success:function () {
				form.render();
			}
		});
		//监听提交
		form.on('submit(reg)',function (data) {
			console.log(data.field);//获取提交的全部数据
			$.ajax(
				{
					type:"POST",
					url:basepath + "/user/doReg",
					dataType:"text",
					data:data.field,
					success:function (msg) {
						if (msg==="success"){
							alert("注册成功");
							console.log("success");
							window.location.href=basepath+"/jump/front/welcome";
						} else{
							alert("账号已存在");
							// console.log("登入失败，账号或者密码不正确");
						}
					},
					error:function (msg) {
						alert(msg);
					}
				}
			);
			return false;
		})

	});
});

function searchJob(param) {
	var position2=$('#position2');
	var zwid=$('#zwid');
	var beginTime=$('#beginTime');
	var endTime=$('#endTime');
	var lxMan=$('#lxMan');
	var lxPhone=$('#lxPhone');
	var lxAddress=$('#lxAddress');
	var xueliRequire=$('#xueliRequire');
	var zhiyeType=$('#zhiyeType');
	var gzExperience=$('#gzExperience');
	var ageLow=$('#ageLow');
	var ageHigh=$('#ageHigh');
	var sex;
	var province=$('#province');
	var ctid=$('#ctid');
	var gzAddress=$('#gzAddress');
	var salaryLow=$('#salaryLow');
	var salaryHigh=$('#salaryHigh');
	var dayTime=$('#dayTime');
	var weekTime=$('#weekTime');
	var workTime=$('#workTime');
	var welfare=$('#welfare');



	var zpNum=$('#zpNum');
	var jobDuty=$('#jobDuty');


	position2.empty();
	zwid.empty();
	beginTime.empty();
	endTime.empty();
	lxMan.empty();
	lxPhone.empty();
	lxAddress.empty();
	xueliRequire.empty();
	zhiyeType.empty();
	gzExperience.empty();
	ageLow.empty();
	ageHigh.empty();
	sex;
	province.empty();
	ctid.empty();
	gzAddress.empty();
	salaryLow.empty();
	salaryHigh.empty();
	dayTime.empty();
	weekTime.empty();
	workTime.empty();
	welfare.empty();


	zpNum.empty();
	jobDuty.empty();




	position2.val(param.position);
	zwid.val(param.zwid);
	beginTime.val();
	endTime.val();
	lxMan.val(param.lxMan);
	lxPhone.val(param.lxPhone);
	lxAddress.val(param.lxAddress);
	xueliRequire.val(param.xueliRequire);
	zhiyeType.val(param.zhiyeType);
	gzExperience.val(param.gzExperience);
	ageLow.val(param.ageLow);
	ageHigh.val(param.ageHigh);
	sex;
	province.val(param.poid);
	ctid.val(param.ctid);
	gzAddress.val(param.gzAddress);
	salaryLow.val(param.salaryLow);
	salaryHigh.val(param.salaryHigh);
	dayTime.val(param.dayTime);
	weekTime.val(param.weekTime);
	workTime.val(param.workTime);
	welfare.val(param.welfare);


	zpNum.val(param.zpNum);
	jobDuty.text(param.jobDuty);
}