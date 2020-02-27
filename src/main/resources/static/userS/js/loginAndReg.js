function dologin(){
		var phone = $('#phone').val();
		var password = $('#password').val();
		//ajax
		$.ajax({
			type: "POST",
			url: "/user/login",
			dataType: "text",
			data: {phone:phone,password:password},
			success: function (flag) {
				if (flag === 'true') {
					window.alert('登录成功');
					$("#phone").val('');
					$("#password").val('');
					window.location.href = '/jump/home/index';
				} else if (flag === 'noCode') {
					window.alert('验证码不正确，请重新输入');
				} else if (flag === 'noAccount') {
					window.alert('账号不存在，请重新输入');
					$("#phone").val('');
					$("#password").val('');
				} else if (flag === 'prohibit') {
					window.alert('账号被禁用，请联系管理员');
				} else if (flag === 'delete') {
					window.alert('账号被删除，请重新注册/联系管理员');
				} else {
					window.alert('密码不正确，请重新输入');
					$("#password").val('');
				}
			},
			error: function () {
				window.alert('服务器繁忙');
			}
		});
	}

function regBlur() {
	var phoneReg = $('#phoneReg').val();
	$.ajax({
		type: "POST",
		url: "/user/login",
		dataType: "text",
		data: {phone: phoneReg},
		success: function (msg) {
			if (msg != 'noAccount') {
				window.alert("手机号已被注册");
			}
		}
	});
}

function doreg(){
	var phoneReg = $('#phoneReg').val();
	var passwordReg = $('#passwordReg').val();

	$.ajax({
		type: "POST",
		url: "/user/reg",
		dataType: "text",
		data:{phoneReg: phoneReg, passwordReg: passwordReg},
		success: function (msg) {
			if (msg=='true'){
				window.alert("注册成功");
				window.location.href = "/jump/user/login";
			}
			if(msg=='false'){
				window.alert("出现异常，注册失败");
			}

		}
	});
}


// JavaScript Document

$(document).ready(function () {
	//扫码登录或是用户密码登录切换
	$('.logtype').click(function(){
		if($(this).attr("class")=="logtype on"){
			$(this).removeClass('on');
			$('.normalLogin').css('display','block');
			$('.weixinLogin').css('display','none');
		}else
		{
			$(this).addClass('on');
			$('.normalLogin').css('display','none');
			$('.weixinLogin').css('display','block');
		}
	})

	//自动登录
	$('.CheckBox').click(function(){
		if($(this).attr("class")=="CheckBox Yes"){
			$(this).removeClass('Yes');
		}else
		{
			$(this).addClass('Yes');
		}
	});

	//简历
	$('.sex').click(function(){
		if($(this).attr("class")=="sex on"){
			$('.sex').addClass('on');
			$(this).removeClass('on');
		}else
		{
			$('.sex').removeClass('on');
			$(this).addClass('on');
		}
	});
	//使用帮助
	var _nTimer = 0;
	$('.useHelpcon').mouseover(function () {
		clearTimeout(_nTimer);
		$(".usehelpimg").css("display", "block").stop().animate({ marginLeft: "-100px", opacity: 1 },500, "swing");
	}).mouseout(_back);
	function _back() {
		_nTimer = setTimeout(function () {
			$(".usehelpimg").stop().animate({ marginLeft: "+30px", opacity: 0 }, "400", "swing", function () {
				$(".usehelpimg").hide();
			});
		}, 100);
	}
	/*
	$('.useHelp').mouseover(function(){
	   $(".usehelpimg").css("display", "block").animate({opacity:"1",marginLeft:"-88px"},500);
	})*/



	注册选项卡
	var oLihot = document.getElementById("tabzc").getElementsByTagName("li");
	var oUlhot = document.getElementById("contentzc").getElementsByTagName("ul");
	for(var i = 0; i < oLihot.length; i++)
	{
		oLihot[i].index = i;
		oLihot[i].onclick = function ()
		{
			for(var n = 0; n < oLihot.length; n++)
				oLihot[n].className="";
			this.className = "currentzc";
			for(var n = 0; n < oUlhot.length; n++)
				oUlhot[n].style.display = "none";
			oUlhot[this.index].style.display = "block";
			if(oUlhot[this.index].title == ""){
				$.parser.parse(oUlhot[this.index]);
				oUlhot[this.index].title = "parsed";
			}
		}
	}
});
