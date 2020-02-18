$(function () {

	//打开首页的时候，获取薪资最高的10个招聘信息
	$.ajax(
		{type:"POST", async:false, url:"/", dataType:"text"
			});
});