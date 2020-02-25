layui.use(['table', 'layer', 'jquery', 'form'], function () {

	var table = layui.table
		, layer = layui.layer
		, $ = layui.jquery
		, form = layui.form;

	var searchJobText = $('#searchJobText').val();
	var postiontype  = $("#postiontype").val();

	//第一个实例
	table.render({
		elem: '#searchJob'
		// , height: 312
		, url: '/homeS/searchJob' //数据接口
		, page: true //开启分页
		, limit: 10
		, where:{postion:searchJobText,postiontype:postiontype}
		, limits: [10,15,20,25,30]
		, cols: [[ //表头
			{field: 'postion', title: '职位名称'}
			, {field: 'qyName', title: '企业名称'}
			, {field: 'replyRate', title: '企业答复率', sort: true}
			, {field: 'gzAddress', title: '工作地点'}
			, {field: 'salary', title: '薪水'}
			, {field: 'time', title: '刷新时间'}
		]]
			,skin: "line"
	});

	form.on('submit(tijiao)', function(data){

		table.reload('searchJob', {
			url: "/homeS/searchJob"
			,where:data.field
			, page: {
				curr: 1 //重新从第 1 页开始
			}
		});

		return false;
	});

		form.on('submit(searchBtn)', function(data){

			table.reload('searchJob', {
				url: "/homeS/searchJob"
				,where:data.field
				, page: {
					curr: 1 //重新从第 1 页开始
				}
			});

			return false;
		});

// 点击省出现市
	form.on('select(prid)', function (data) {
		var val = data.value;
		$.post(
			"/homeS/getcity",
			{
				"prid": val
			},
			function (msg) {
				var list = JSON.parse(msg);
				$('#ctid').empty();
				$('#ctid').append('<option value ="">' + '请选择' + '</option>');
				for (var i = 0; i < list.length; i++) {
					$('#ctid').append('<option value ="' + list[i].ctid + '">' + list[i].ctname + '</option>');
				}
				form.render();

			}
		);
	});

});
