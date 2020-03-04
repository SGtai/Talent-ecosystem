// JavaScript Document
$(document).ready(function () {
   //导航
   $('.navItem.other').hover(function(){
		$(this).find("#TopNavMorePopup").stop(true,true).slideDown();
	},function(){
		$(this).find("#TopNavMorePopup").stop(true,true).slideUp();
    });
	
	//侧边栏二级导航
	$('.NavLeftBox.twoNav').click(function(){
	    if($(this).attr("class")=="NavLeftBox twoNav on"){
			$(this).removeClass('on');
		    $(this).find('span.up.down').removeClass('down');
			$(this).next('ul').css('display','block');
		}
		else{
		   $(this).addClass('on');
		   $(this).find('span.up').addClass('down');
		   $(this).next('ul').css('display','none');
		} 
	})
	
	//简历状态  已公开 已隐藏
	$('.statusjl').click(function(){
	   if($(this).attr("class")=="statusjl on"){
	   	// 隐藏
		   var jlid = $('#jlid').val();
		   $.ajax({
			   type: "POST",
			   asyn: false,
			   url: "/user/closejl",
			   data: {jlid:jlid},
			   success: function (msg) {
				   if (msg == "true") {
					   window.alert("简历隐藏成功");
				   }
			   }
		   });
		   $(this).removeClass('on');

		}else{
	   	// 公开
		   var jlid = $('#jlid').val();
		   $.ajax({
			   type: "POST",
			   url: "/user/openjl",
			   asyn: false,
			   data: {jlid:jlid},
			   success: function (msg) {
				   if (msg == "true") {
				   	    window.alert("简历推送成功");
				   }

			   }
		   });
		   $(this).addClass('on');
		}
	})
	
	//隐藏姓名
	$('.check1').click(function(){
	   if($(this).attr("class")=="check1 on"){
	      $(this).addClass('on');
		  $(this).removeClass('on');
	   }else
	   {
		  $(this).removeClass('on');
		  $(this).addClass('on');
	   }
	})
	
	//性别
	$('.sex').click(function(){
	   if($(this).attr("class")=="sex on"){
	      $('.sex').addClass('on');
		  $(this).removeClass('on');
	   }else
	   {
		  $('.sex').removeClass('on');
		  $(this).addClass('on');
	   }
	})
	
	//性别
	$('.typeJob').click(function(){
	   if($(this).attr("class")=="typeJob on"){
	      $('.typeJob').addClass('on');
		  $(this).removeClass('on');
	   }else
	   {
		  $('.typeJob').removeClass('on');
		  $(this).addClass('on');
	   }
	})
	
	
	//填写更详细的工作经历
	$('.jobmoreicon').click(function(){
	   if($(this).attr("class")=="jobmoreicon on"){
		  $(this).removeClass('on');
		  $(this).parent().find('.qitaBox').css('display','none');
	   }else
	   {
		  $(this).addClass('on');
		  $(this).parent().find('.qitaBox').css('display','block');
	   }
	})
	
	//技能标签
	$('.jnAdd').click(function(){
	   $(this).css('display','none');
	   $(this).parent().parent().find('.jnBox').css('display','block');
	})
	$('.jnBox .btnBOX a.quxiao').click(function(){
	   $(this).parent().parent().css('display','none');
	   $(this).parent().parent().parent().find('.addcomeon a.jnAdd').css('display','block');
	})
	
	
	//职位搜索搜索条件展开隐藏
  $('.search2 .xzdiv .imgshow').click(function(){
     $(this).css('display','none');
	 $(this).parent().find('.imghidden').css('display','block');
     $(this).parent().parent().find('.xzdivC').css('height','auto');
  })
  $('.search2 .xzdiv .imghidden').click(function(){
     $(this).css('display','none');
	 $(this).parent().find('.imgshow').css('display','block');
     $(this).parent().parent().find('.xzdivC').css('height','33px');
  })
	//职位搜索  更多选项
  $('.search3').click(function(){
     $('.xzdiv.hidden').toggle();
	 if($(this).find("span").attr("class")=="down up"){
		   $(this).find("span").removeClass('up');
	  }else
	  {
		  $(this).find("span").addClass('up');
	  }
  })
  //列表摘要
  $('.seachlist .tj1 span.list').click(function(){
      $('.seachlist .tj1').removeClass('on');
	  $(this).addClass('on');
	  $('.seachlist .tj1 span.zhaoyao').removeClass('on');
	  $('table.listtab tr.xxdetail').addClass('none')
  })
  $('.seachlist .tj1 span.zhaoyao').click(function(){
      $('.seachlist .tj1').addClass('on');
	  $(this).addClass('on');
	  $('.seachlist .tj1 span.list').removeClass('on');
	  $('table.listtab tr.xxdetail').removeClass('none');
  })
  
  
  
  //个人中心-帮助中心
  $('.quesBox a').click(function(){
     $('.quesBox').removeClass('show');
	 $(this).parent().addClass('show');
  })
  
  
  // //申请的职位  选项卡
  // var oLihot = document.getElementById("tabsqzw").getElementsByTagName("li");
  // var oUlhot = document.getElementById("contentsqzw").getElementsByTagName("ul");
  // for(var i = 0; i < oLihot.length; i++)
  // {
	// 	oLihot[i].index = i;
	// 	oLihot[i].onclick = function ()
  //       {
  //          for(var n = 0; n < oLihot.length; n++)
	//           oLihot[n].className="";
	// 		  this.className = "currentsqzw";
	// 		  for(var n = 0; n < oUlhot.length; n++)
	// 			 oUlhot[n].style.display = "none";
	// 			 oUlhot[this.index].style.display = "block";
	// 			 if(oUlhot[this.index].title == ""){
	// 				 $.parser.parse(oUlhot[this.index]);
	// 				 oUlhot[this.index].title = "parsed";
	// 			 }
	//    }
  //  }

   
   
})

function creatjl(){
	var count = $('#jlcount').val();
	if(count == 4){
		window.alert("简历已满，请删除或更新简历")
	}else{
		window.location.href = "/user/gojl";
	}

}

function tuichu2() {
	layui.use(['layer', 'jquery', 'form'], function () {
		var layer = layui.layer;

		layer.confirm('确定退出用户登录吗？', function (index) {
			window.location.href = "/user/tuichu2";
			layer.close(index);
		});

	});
}

	function toudi(){
		layui.use(['layer', 'jquery', 'form'], function () {
			var layer = layui.layer
				, $ = layui.jquery
				, form = layui.form;

			var qyid = $('#qyid').val();
			var zpxxid = $('#zpxxid').val();

				$.ajax({
					type: "POST",
					url: "/user/getjllist",
					dataType: "text",
					success: function (msg1) {
						var msg = eval(msg1);
						$('#jlselect').empty();
						for(var i=0;i < msg.length;i++){
							$('#jlselect').append('<option value ="'+msg[i].jlId+'">' + msg[i].jlname + '</option>');
						}
						form.render();
						layer.open({
							type: 1
							,id: 'layerDemo'
							,content:$('#jllist')
							,btn:  ['取消', '确定投递']
							,btn2: function(index, layero){
								var jlid=$('#jlselect option:selected').val();
								layer.confirm('确定向此职位投递此份简历？', function (index) {
									$.ajax({
										type: "POST",
										url: "/user/toudi",
										dataType: "text",
										data:{jlid:jlid,qyid:qyid,zpxxid:zpxxid},
										success: function (msg1) {
											if (msg1 == "true"){
												window.alert("投递成功，静等回复把")
											}
											if (msg1 == "notoudi"){
												window.alert("投递失败，您已投递过该职位了")
											}
										}});
									layer.close(index);
								});

							}
							,btnAlign: 'c' //按钮居中
							,shade: 0 //不显示遮罩
							,yes: function(){
								layer.closeAll();
							}
						});
					}
				});
	})

};