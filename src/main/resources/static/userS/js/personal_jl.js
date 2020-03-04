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
	var s = $('#yixiang').serialize();
	$.ajax({
		type: "POST",
		url: "/user/yixiang",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}
function jiaoyu(msg) {
	var formid = msg.parentNode.parentNode.parentNode.id;
	var s = $('#'+formid).serialize();
	$.ajax({
		type: "POST",
		url: "/user/jiaoyu",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}

function gongzuo(msg) {
	var formid = msg.parentNode.parentNode.parentNode.id;
	var s = $('#'+formid).serialize();
	$.ajax({
		type: "POST",
		url: "/user/gongzuo",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}

function zhengshu() {
	var s = $('#zhengshu').serialize();
	$.ajax({
		type: "POST",
		url: "/user/zhengshu",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}

function pingjia() {
	var s = $('#pingjia').serialize();
	$.ajax({
		type: "POST",
		url: "/user/pingjia",
		dataType: "text",
		data: s,
		success: function (msg) {
			if (msg == "true") {
				window.alert("保存成功");
			}
		}
	});
}

function morejiaoyu(){

	var jlid = $('#jlId').val();
	$.ajax({
		type: "POST",
		url: "/user/morejiaoyu",
		dataType: "text",
		data:{jlid:jlid},
		success: function (msg) {
			var s = "<form id=\""+"jiaoyu"+msg+"\" class=\"layui-form\">\n" +
				"\t\t\t<input hidden value=\""+msg+"\" name=\"jyId\">\n" +
				"\t\t\t<h1><span>教育背景</span></h1>\n" +
				"\t\t\t<div class=\"JlBoxLeft\">\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>学校名称：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"school\" type=\"text\" class=\"txt3\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>就学时间：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"sxSchooltime\" type=\"text\" class=\"txt2\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>专业名称：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"zyMajor\" type=\"text\" class=\"txt3\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\">学习经历：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<textarea name=\"rongyu\" cols=\"\" rows=\"\" placeholder=\"可以填写您所学专业包括什么课程，取得的成绩与荣誉以及您的毕业设计等等\"></textarea>\n" +
				"\t\t\t\t\t\t<br /><span>最多可输入400汉字。</span>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<a href=\"javascript:void(0)\" class=\"save\" onclick=\"jiaoyu(this)\">保存</a>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t<div class=\"JlBoxRight\">\n" +
				"\t\t\t\t<a href=\"\" class=\"del\">删除</a>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t<div class=\"addcomeon\">\n" +
				"\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"morejiaoyu()\">继续添加教育背景</a>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t</form>";
			$('#jiaoyudiv').append(s);
		}
	});


}

function moregongzuo(){

	var jlid = $('#jlId').val();
	$.ajax({
		type: "POST",
		url: "/user/moregongzuo",
		dataType: "text",
		data:{jlid:jlid},
		success: function (msg) {
			var s = "<form id=\""+"gongzuo"+msg+"\" class=\"layui-form\">\n" +
				"\t\t\t<input hidden value=\""+msg+"\" name=\"gzjlId\">\n" +
				"\t\t\t<h1><span>工作经历</span></h1>\n" +
				"\t\t\t\n" +
				"\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t<div class=\"JlBoxLeft\" style=\"width:710px\">\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>企业名称：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"jzUnit\" type=\"text\" class=\"txt3\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>职位名称：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"zwPosition\" type=\"text\" class=\"txt3\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>工作时间：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<input name=\"ksTime\" type=\"text\" class=\"txt3\" placeholder=\"年/月——年/月\"/>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<div class=\"nametxt\"><span>*</span>工作描述：</div>\n" +
				"\t\t\t\t\t<div class=\"inputtxt\">\n" +
				"\t\t\t\t\t\t<textarea name=\"gzContent\" cols=\"\" rows=\"\" placeholder=\"主要填写自己从事工作的岗位职责，在工作中能力的体现，以及自己取得过哪些成绩。\"></textarea>\n" +
				"\t\t\t\t\t\t<br /><span>最多可输入200汉字。</span>\n" +
				"\t\t\t\t\t</div>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t\t<div class=\"jldiv\">\n" +
				"\t\t\t\t\t<a href=\"javascript:void(0)\" class=\"save\" onclick=\"gongzuo(this)\">保存</a>\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t<div class=\"JlBoxRight\" style=\"width:100px\">\n" +
				"\t\t\t\t<a href=\"\" class=\"del\">删除</a>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t<div class=\"clear\"></div>\n" +
				"\t\t\t<div class=\"addcomeon\">\n" +
				"\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"moregongzuo()\">继续添加工作经历</a>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t</form>";
			$('#gongzuodiv').append(s);
		}
	});

}

function deletejl(){
	var jlid = $('#jlid').val();
	$.ajax({
		type: "POST",
		url: "/user/deletejl",
		dataType: "text",
		data: {jlid:jlid},
		success: function (msg) {
			if (msg == "true") {
				window.alert("删除成功");
				window.location.href = "/user/gopersonaljl";
			}
		}
	});
}

function msresultOk(msg) {
	$.ajax({
		type: "POST",
		url: "/user/msresultOk",
		dataType: "text",
		data: {cxrzId:msg},
		success: function (msg) {
			if (msg == "true") {
				window.alert("接收面试成功！祝您成功");
				window.location.href = window.location;
			}
		}
	});
}

function msresultNo(msg) {
	$.ajax({
		type: "POST",
		url: "/user/msresultNo",
		dataType: "text",
		data: {cxrzId:msg},
		success: function (msg) {
			if (msg == "true") {
				window.alert("拒绝成功！希望您能找到更心仪的职位");
				window.location.href = window.location;
			}
		}
	});
}