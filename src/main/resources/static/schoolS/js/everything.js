// 注册1
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
					alert(msg);
					// var m=JSON.parse(msg);
					if(msg==="0"){
						alert("注册失败，该账号已经存在");
					}else if(msg==="1"){
						alert("注册成功");
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
	var a=document.createElement("input");
	a.value="无";
	var b=a.value;
	$.ajax(
		{
			type:"POST",
			url:"/school/reg2",
			dataType:"text",
			data:{
				scName:scName1,
				scdata:scdata1,
				scAddress:scAddress1,
				scfdMan:scfdMan1,
				moneyLaiyuan:b,
				kaibanMoney:kaibanMoney1,
				jubanDanwei:jubanDanwei1,
				xinyongDaima:xinyongDaima1,
				scAbout:scAbout1,
				scPhone:scPhone1
			},
			success:function (msg) {
				// var m=JSON.parse(msg);
				if(msg==="0"){
					alert("注册失败,该账号已经被其他管理员注册了");
				}else if(msg==="1"){
					alert("注册成功");
				}
			},
			error:function (msg) {
				alert("系统忙，请稍等");
			}
		}
	);

}
function back() {

}
