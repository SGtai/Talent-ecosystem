layui.use(['form','laydate'], function(){
	var form = layui.form
		,layer = layui.layer
		,laydate = layui.laydate;

	//日期
	laydate.render({
		elem: '#date'
	});
	laydate.render({
		elem: '#date1'
	});

	//监听提交
	form.on('submit(jobinfo)', function(data){
		$.ajax(
			{
				type:"POST",
				url:"/company/releaseJobinfo",
				dataType:"text",
				data:{
					qyid:$('#qyid').val(),
		//招聘起止时间
		continueTime:$('#date').val()+"至"+$('#date1').val(),
		//职位ID
		zwid:$('#zwid').val(),
		//联系人、电话、地址
		lxMan:$('#lxMan').val(),
		lxPhone:$('#lxPhone').val(),
		lxAddress:$('#lxAddress').val(),
		//学历要求
		xueliRequire:$('#xueliRequire').val(),
		//职业性质
		zhiyeType:$('#zhiyeType').val(),
		//工作经验
		gzExperience:$('#gzExperience').val(),
		//年龄及性别
		jibenRequire:"年龄"+$('#ageLow').val()+"至"+$('#ageHigh').val()+"，性别："+$("input[name='sex']:checked").val(),
		//工作市ID
		ctid:$('#ctid').val(),
		//填写详细地址
		gzAddress:$('#gzAddress').val(),
		//最低薪资
		salaryLow:$('#salaryLow').val(),
		//最高薪资
		salaryHigh:$('#salaryHigh').val(),
		//工作时间
		gztime:"工作时间："+$('#gztime1').val()+"小时/每天;休息日："+$('#gztime2').val()+"天/周;班次："+$('#gztime3').val(),
		//薪资福利
		welfar:$('#welfare').val(),
		//招聘人数
		zpNum:$('#zpNum').val(),
		//岗位职责
		jobDuty:$('#jobDuty').val()
				},
				success:function (msg) {
					if (msg==="success"){
						layer.alert('招聘信息发布成功!', function(index) {
							layer.close(index);
							window.location.href="/company/jobinfo"
						})
					} else{
						layer.alert("招聘信息发布失败", { icon: 1, offset: "auto", time:700 });
					}
				},
				error:function (msg) {
					alert(msg);
				}
			}
		);
		return false;
	});

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
				error:function (msg) {
					alert(msg);
				}
			}
		);
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
	//表单取值
	layui.$('#LAY-component-form-getval').on('click', function(){
		var data = form.val('example');
		alert(JSON.stringify(data));
	});

});

