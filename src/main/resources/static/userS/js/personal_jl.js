function personal_jlupdate(){

	var s = $('#jl1').serialize();
	$.ajax({
		type: "POST",
		url: "/user/gerenInfo",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "success") {
				window.alert("个人资料完善成功");
			}
		}
	});
}

function userinfojl() {
	var s = $('#userinfojl').serialize();
	$.ajax({
		type: "POST",
		url: "/user/userInfojl",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}
function yixiang() {
	
}