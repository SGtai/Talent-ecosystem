// JavaScript Document
//首页小广告图轮换
$(function () {
        var left = $("#left");
        var right = $("#right");
        var obj = $(".adBox0 ul");
        var w = obj.find("li").innerWidth();

        left.click(function () {
            obj.find("li:last").prependTo(obj);
            obj.css("margin-left", -w);
            obj.animate({ "margin-left": 0 });
        });

        right.click(function () {
            obj.animate({ "margin-left": -w }, function () {
                obj.find("li:first").appendTo(obj);
                obj.css("margin-left", "0");
            });
        });
        var moving = setInterval(function () { right.click() }, 5000);
        obj.hover(function () {
            clearInterval(moving);
        }, function () {
            moving = setInterval(function () { right.click() }, 5000);
        })
 });
 
 

$(document).ready(function () {
  //首页右侧登录方式
  $('.loginA').click(function(){
     $('.smlogin').css('display','block');
	 $('.loginB').removeClass('select');

	 $(this).addClass('select');
	 $('.ContentA').css('display','block');
	 $('.ContentB').css('display','none');

  })
  $('.loginB').click(function(){
	 $('.smlogin').css('display','none');
     $('.loginA').removeClass('select');

	 $(this).addClass('select');
	 $('.ContentB').css('display','block');
	 $('.ContentA').css('display','none');

  })
  //首页右侧登录方式接受用户协议
  $('.chebox').click(function(){
	  if($(this).attr("class")=="chebox yes"){
		   $(this).removeClass('yes');
	  }else
	  {
		  $(this).addClass('yes');
	  }
  });
  //二维码登录
  $('.smlogin').click(function(){
     $('.erweima').css('display','block');
  });
  $('.erweima .close').click(function(){
     $('.erweima').css('display','none');
  })

});

function tuichu() {
	$.ajax({
		type: "POST",
		url: "/user/tuichu",
		async:false,
		dataType: "text",
		success: function (flag) {
			window.location.href=window.location;
		}
	});
}