// 注册1
function reg1() {
		var acc=document.getElementById("scAccount").value;
		var pass=document.getElementById("password1").value;
		var nextpass=document.getElementById("password2").value;
		if(acc.length<6||pass.length<6||acc.length>12||pass.length>12){
			alert("注册的账户、密码不能低于6位，高于12位")
		}else{
			if(pass===nextpass){
				$.ajax(
					{
						type:"POST",
						url:"/school/reg1",
						dataType:"text",
						data:{scAccount:acc,password:pass},
						success:function (msg) {
							if(msg==="0"){
								alert("注册失败，该账号已经存在");
							}else if(msg==="1"){
								$("#scAccount").val("");
								$("#password1").val("");
								$("#password2").val("");
								var a=document.createElement("a");
								a.href="/jump/school/reg2";
								a.click();
							}
						},
						error:function (msg) {
							alert("系统忙，请稍等");
						}
					}
				);
			}else{
				alert("尊敬的用户，您两次输入密码不一致，请重新输入");

			}
		}

	$("#password1").val("");
	$("#password2").val("");



}
function reg2() {
	var scName1=document.getElementById("scName").value;
	var scdata1=document.getElementById("scdata").value;
	var scAddress1=document.getElementById("scAddress").value;
	var scfdMan1=document.getElementById("scfdMan").value;
	var kaibanMoney1=document.getElementById("kaibanMoney").value;
	var jubanDanwei1=document.getElementById("jubanDanwei").value;
	var xinyongDaima1=document.getElementById("xinyongDaima").value;
	var scAbout1=document.getElementById("scAbout").value;
	var scPhone1=document.getElementById("scPhone").value;

	//金钱来源
	var jinqianly="";
	var s1=$("#s1");
	var s2=$("#s2");
	var s3=$("#s3");
	var s4=$("#s4");
	var s5=$("#s5");
	if(s1.is(':checked')){
		jinqianly=jinqianly.concat(s1.val()+"/");
	}
	if(s2.is(':checked')){
		jinqianly=jinqianly.concat(s2.val()+"/");
	}
	if(s3.is(':checked')){
		jinqianly=jinqianly.concat(s3.val()+"/");
	}
	if(s4.is(':checked')){
		jinqianly=jinqianly.concat(s4.val()+"/");
	}
	if(s5.is(':checked')){
		jinqianly=jinqianly.concat(s5.val());
	}
	if(
		scName1.length===0||
		scdata1.length===0||
		scAddress1.length===0||
		scfdMan1.length===0||
		kaibanMoney1.length===0||
		jubanDanwei1.length===0||
		xinyongDaima1.length===0||
		scAbout1.length===0||
		scPhone1===0||
		jinqianly.length===0
	){
		alert("尊敬的用户您还未填写完整");
	}else{
		//判断联系方式
		var regBox = {
			regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,   //....邮箱
			regName : /^[a-z0-9_-]{3,16}$/,//....用户名
			regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//....手机
			regTel : /^0[\d]{2,3}-[\d]{7,8}$/ //....电话
		};
		var mflag = regBox.regMobile.test(scPhone1);
		var tflag = regBox.regTel.test(scPhone1);
		if(mflag||tflag)
		{
			//判断是否为社会有效码
			var patrn = /^[0-9A-Z]+$/;
			//18位校验及大写校验
			if ((xinyongDaima1.length != 18) || (patrn.test(xinyongDaima1) == false))
			{
				alert("不是有效的社会信用代码");
			}else {
				var Ancode;//统一社会信用代码的每一个值
				var Ancodevalue;//统一社会信用代码每一个值的权重
				var total = 0;
				var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子
				var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';//不用I、O、S、V、Z
				for (var i = 0; i < xinyongDaima1.length - 1; i++) {
					Ancode = xinyongDaima1.substring(i, i + 1);
					Ancodevalue = str.indexOf(Ancode);
					total = total + Ancodevalue * weightedfactors[i];       //权重与加权因子相乘之和
				}
				var logiccheckcode = 31 - total % 31;
				if (logiccheckcode == 31) {
					logiccheckcode = 0;
				}
				var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";
				var Array_Str = Str.split(',');
				logiccheckcode = Array_Str[logiccheckcode];
				var checkcode = xinyongDaima1.substring(17, 18);
				if (logiccheckcode != checkcode) {
					alert("不是有效的社会信用代码");

				} else {
						$("#jinqianly").val(jinqianly);
						var a=document.createElement("btn");
						a.click();
				}
			}
		}
		else{
			alert("手机或者电话有误！");
			$("#scPhone").val("");
		}
	}







}
function regupload() {
	$("#upload").click();
}
function back() {

}
