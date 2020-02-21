layui.use(['form', 'layedit', 'laydate'], function(){
	var form = layui.form
		,layer = layui.layer
		,layedit = layui.layedit
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

		if($('#date').val()>$('#date1').val()){
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
			//发布招聘信息
			$.ajax(
				{
					type:"POST",
					url:"/company/releaseJobinfo",
					dataType:"text",
					data:data.field,
					success:function (msg) {
						if (msg==="success"){
							layer.alert('招聘信息发布成功!', function(index) {
								layer.close(index);
								window.location.href="/company/jobinfo"
							})
						} else{
							layer.alert("招聘信息发布失败", { icon: 1, offset: "auto", time:1500 });
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

	form.on('select(chooseProvince)', function(data){
		var name = $('#ctid');

		if($('#salaryLow').val()>$('#salaryHigh').val()){
			layer.alert("薪资范围填写错误！", { icon: 1, offset: "auto", time:1500 });
		}
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

	//自定义验证规则
	form.verify({
		lxMan: [
			/[\u4E00-\u9FA5]/,
				'只能输入中文！'
		],
		lxAddress:[
			/^[\u4E00-\u9FA5]+[\u4E00-\u9FA5A-Za-z0-9]{6,30}$/,
			'输入详细正确的地址，不少于6位不超过30位，不能包含特殊符号'
		]


	});

});

/**
 * 发布招聘信息的方法
 * @returns {boolean}
 */
function releaseJobinfos() {
	$.ajax(
		{
			type:"POST",
			url:"/company/releaseJobinfos",
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
					layer.alert("招聘信息发布失败", { icon: 1, offset: "auto", time:1500 });
				}
			},
			error:function (msg) {
				alert(msg);
			}
		}
	);
	return false;
}
