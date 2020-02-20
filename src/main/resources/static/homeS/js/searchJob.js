layui.use(['table', 'layer', 'jquery', 'form'], function () {
	var table = layui.table
		, layer = layui.layer
		, $ = layui.jquery
		, form = layui.form;

	//第一个实例
	table.render({
		elem: '#searchJob'
		// , height: 312
		, url: '/home/searchJob' //数据接口
		, page: true //开启分页
		, limit: 5
		, limits: [5]
		, cols: [[ //表头
			{field: 'postion', title: '职位名称'}
			, {field: 'qyName', title: '企业名称'}
			, {field: 'replyRate', title: '企业答复率', sort: true}
			, {field: 'gzAddress', title: '工作地点'}
			, {field: 'salary', title: '薪水'}
			, {field: 'time', title: '刷新时间'}
		]]
	});
});