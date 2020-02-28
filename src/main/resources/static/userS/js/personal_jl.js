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

function yixiang() {
	
}