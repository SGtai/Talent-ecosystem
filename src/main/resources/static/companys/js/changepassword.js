var Path=$('#Path').val();

layui.use(['form', 'layer'], function(){
	var form = layui.form
		,layer = layui.layer;

	//监听提交
	form.on('submit(changepassword)', function(data){
		var qyAccount=$('#qyAccount').val();
		var qy2=$('#qy2').val();
		var qy3=$('#qy3').val();
		var qy4=$('#qy4').val();
		var password=document.getElementById("password").value;
		var password2=document.getElementById("password2").value;

		if(qy2==="success"&&qy3==="success"&&qy4==="success"){
			if(password===password2){
				$.ajax(
					{
						type:"POST",
						url:Path+"/company/changePassword",
						dataType:"text",
						data:{qyAccount:qyAccount,password:password},
						success:function (msg) {
							if (msg==="success"){
								layer.alert('密码修改成功!', function(index) {
									layer.close(index);
									location.reload();
								})
							} else{
								layer.alert("密码修改失败！", { icon: 1, offset: "auto", time:1000 });
							}
						},
						error:function (msg) {
							layer.alert(msg);
						}
					}
				);
			}else {
				layer.alert('新密码两次输入不一致', { icon: 1, offset: "auto", time:1000 });
			}
		}else {
			if(qy4!=="success"){
				layer.alert("原始密码错误！", { icon: 1, offset: "auto", time:1000 });
			}
		}
		return false;
	});

});

/**
 * 验证原始密码
 */
function verifyPwd(password) {
	var qyAccount=$('#qyAccount').val();
	$.ajax(
		{
			type:"POST",
			url:Path+"/company/verifyPwd",
			dataType:"text",
			data:{qyAccount:qyAccount,password:password},
			success:function (msg) {
				if (msg==="success"){
					$('#qy4').val("success");
				} else{
					layer.alert("原始密码错误！", { icon: 1, offset: "auto", time:1000 });
					$('#qy4').val("success2");
				}
			},
			error:function (msg) {
				layer.alert(msg);
			}
		}
	);
}


/**
 * 判断密码栏
 * @param value
 */
function passexist(value) {
	if(value.length ==0){
		layer.alert('密码不能为空', { icon: 1, offset: "auto", time:700 }) ;
		$('#qy2').val("success2");
	}else if(value.length <6||value.length >12){
		layer.alert('密码不少得于6位或者超过12位', { icon: 1, offset: "auto", time:700 });
		$('#qy2').val("success2");
	}else if(/^\d+\d+\d$/.test(value)){
		layer.alert('密码不能全为数字', { icon: 1, offset: "auto", time:700 });
		$('#qy2').val("success2");
	}else if(/[\u4E00-\u9FA5]/g.test(value)){
		layer.alert('密码不能存在中文', { icon: 1, offset: "auto", time:700 });
		$('#qy2').val("success2");
	}else {
		$('#qy2').val("success");
	}
}

/**
 * 判断确认密码栏
 * @param value
 */
function passexist2(value) {
	var password=document.getElementById("password").value;
	var password2=document.getElementById("password2").value;
	if(value.length ==0){
		layer.alert('确认密码栏不能为空', { icon: 1, offset: "auto", time:700 }) ;
		$('#qy3').val("success2");
	}else if(value.length <6||value.length >12){
		layer.alert('密码不少得于6位或者超过12位', { icon: 1, offset: "auto", time:700 });
		$('#qy3').val("success2");
	}else if(/^\d+\d+\d$/.test(value)){
		layer.alert('密码不能全为数字', { icon: 1, offset: "auto", time:700 });
		$('#qy3').val("success2");
	}else if(/[\u4E00-\u9FA5]/g.test(value)){
		layer.alert('密码不能存在中文', { icon: 1, offset: "auto", time:700 });
		$('#qy3').val("success2");
	}
	else{
		$('#qy3').val("success");
	}
}

function passexist3(value) {
	verifyPwd(value);
}

function sleep(n) {
	var start = new Date().getTime();
	 console.log('休眠前：' + start);
	 while (true) {
	 if (new Date().getTime() - start > n) {
	 	break;}
	 }
	console.log('休眠后：' + new Date().getTime());
	}
