function reg1() {
		var acc=document.getElementById("scAccount").value;
		var pass=document.getElementById("password").value;
		$.ajax(
			{
				type:"POST",
				url:"/school/reg1",
				dataType:"text",
				data:{scAccount:acc,password:pass},
				success:function (msg) {
					// var m=JSON.parse(msg);
					if(msg==="0"){
						alert("注册失败，该账号已经存在");
					}else if(msg==="1"){
						alert("注册成功");
					}
				},
				error:function (msg) {

				}
			}
		);




}