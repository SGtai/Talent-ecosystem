
	//打开首页的时候，获取薪资最高的10个招聘信息
	//推荐岗位及广告
	$.ajax(
		{type:"POST",
			async:false,
			url:"/homeS/getTenHJob",
			dataType:"text",
			success:function (msg) {
			  window.onload;
			}});
