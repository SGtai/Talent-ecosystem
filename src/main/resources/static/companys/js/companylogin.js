/**
 * 注册功能判断
 */
layui.use(['form', 'layer'], function(){
	var form = layui.form
		,layer = layui.layer;

	//监听提交
	form.on('submit(demo1)', function(data){
		var qy1=$('#qy1').val();
		var qy2=$('#qy2').val();
		var qy3=$('#qy3').val();
		var qy4=$('#qy4').val();
		var qy5=$('#qy5').val();
		var password=document.getElementById("password").value;
		var password2=document.getElementById("password2").value;

		if(qy1==="success"&&qy2==="success"&&qy3==="success"&&qy4==="success"&&qy5==="success"){
			if(password===password2){
				$.ajax(
					{
						type:"POST",
						url:"/company/doReg",
						dataType:"text",
						data:data.field,
						success:function (msg) {
							if (msg==="success"){
								layer.alert("注册成功", { icon: 1, offset: "auto", time:1000 });
							} else{
								layer.alert("注册失败，请重新注册！", { icon: 1, offset: "auto", time:1000 });
							}
						},
						error:function (msg) {
							layer.alert(msg);
						}
					}
				);
			}else {
				layer.alert('两次密码输入不一致', { icon: 1, offset: "auto", time:1000 });
			}
		}else {
			if(qy1!=="success"){
				layer.alert("请输入正确的账号", { icon: 1, offset: "auto", time:1000 });
			} else if(qy4!=="success"){
				layer.alert("不是有效的统一社会信用编码！", { icon: 1, offset: "auto", time:1000 });
			}else if(qy5!=="success"){
				layer.alert("请输入正确的公司名称", { icon: 1, offset: "auto", time:1000 });
			}
		}
		return false;
	});

});

/**
 * 判断账户栏
 * @param value
 */
function queryaccount(value) {

	if(value.length ==0){
		layer.alert("账号不能为空！", { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	}else if(value.length <6||value.length >20){
		layer.alert("账号不少得于6位或者超过20位", { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	}else if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		layer.alert('用户名不能有特殊字符', { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	}else if(/(^\_)|(\__)|(\_+$)/.test(value)){
		layer.alert('用户名首尾不能出现下划线\'_\'', { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	}else if(/^\d+\d+\d$/.test(value)){
		layer.alert('用户名不能全为数字', { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	}else if(/[\u4E00-\u9FA5]/g.test(value)){
		layer.alert('用户名不能存在中文', { icon: 1, offset: "auto", time:700 });
		$('#qy1').val("success2");
	} else{
		$.ajax(
			{
				type:"POST",
				url:"/company/doAccount",
				dataType:"text",
				data:{qyAccount:value},
				success:function (msg) {
					if (msg==="success"){
						layer.alert("账号可以注册", { icon: 1, offset: "auto", time:700 });
						$('#qy1').val("success");

					} else{
						layer.alert("该账号已存在", { icon: 1, offset: "auto", time:700 });
						$('#qy1').val("success2");
					}
				},
				error:function (msg) {
					alert(msg);
				}
			}
		);

	}
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

function qyName2(value) {
	if(/^[\u4e00-\u9fa5\(\)（）\da-zA-Z&]{2,50}$/gi.test(value)){
		$('#qy5').val("success");
	}else{
		layer.alert('请输入正确的公司名称', { icon: 1, offset: "auto", time:700 });
		$('#qy5').val("success2");
	}
}


/**
 * 验证统一机构代码证输入符合标准
 * @param Code
 * @returns {boolean}
 */
function verification (Code) {

	var patrn = /^[0-9A-Z]+$/;
	//18位校验及大写校验

	if ((Code.length != 18) || (patrn.test(Code) == false)) {
		layer.alert("不是有效的统一社会信用编码！", { icon: 1, offset: "auto", time:1000 });
		$('#qy4').val("success2");
		return false;

	}  else {
		var Ancode;//统一社会信用代码的每一个值
		var Ancodevalue;//统一社会信用代码每一个值的权重
		var total = 0;
		var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子
		var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';
		//不用I、O、S、V、Z
		for (var i = 0; i < Code.length - 1; i++) {
			Ancode = Code.substring(i, i + 1);
			Ancodevalue = str.indexOf(Ancode);
			total = total + Ancodevalue * weightedfactors[i];
			// 权重与加权因子相乘之和
		}
		var logiccheckcode = 31 - total % 31;
		if (logiccheckcode == 31) {
			logiccheckcode = 0;    }
		var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";
		var Array_Str = Str.split(',');
		logiccheckcode = Array_Str[logiccheckcode];
		var checkcode = Code.substring(17, 18);
		if (logiccheckcode != checkcode) {
			layer.alert("不是有效的统一社会信用编码！", { icon: 1, offset: "auto", time:500 });
			$('#qy4').val("success2");
			return false;
		}
		else{
			$('#qy4').val("success");

		}
	}
}

