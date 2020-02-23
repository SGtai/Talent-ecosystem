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
function back() {

}
