layui.use(['table', 'layer', 'jquery', 'form'], function () {

	var table = layui.table
		, layer = layui.layer
		, $ = layui.jquery
		, form = layui.form;

	var searchJobText = $('#searchJobText').val();
	var postiontype  = $("#postiontype").val();
	var path = $("#path").val();
	//第一个实例
	table.render({
		elem: '#searchJob'
		// , height: 312
		, url: path+'homeS/searchJob' //数据接口
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
			, {field: 'chakan', title: '',toolbar: '<div><a class="layui-btn layui-btn-sm background-style" lay-event="chakan">查看</a></div>'}
			, {field: 'shoucang', title: '',toolbar: '<div><a class="layui-btn layui-btn-sm background-style" lay-event="shoucang">关注</a></div>'}
			, {field: 'jl', title: '',toolbar: '<div><a class="layui-btn layui-btn-sm background-style" lay-event="jl">投递简历</a></div>'}
		]]
			,skin: "line"
	});

	form.on('submit(tijiao)', function(data){

		table.reload('searchJob', {
			url: path+"homeS/searchJob"
			,where:data.field
			, page: {
				curr: 1 //重新从第 1 页开始
			}
		});

		return false;
	});

		form.on('submit(searchBtn)', function(data){

			table.reload('searchJob', {
				url: path+"homeS/searchJob"
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

	table.on('tool(searchJob)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
			, layEvent = obj.event; //获得 lay-event 对应的值

		var qyid = data.qyid;
		var zpxxid = data.zpxxid;

		if (layEvent === 'chakan') {
			window.location.href = "/user/jobinfo?id1=" + qyid + "&id2=" + zpxxid
		}
		if (layEvent === 'shoucang') {
			$.ajax({
				type: "POST",
				url: path+"user/shoucang",
				dataType: "text",
				data:{zpxxid:zpxxid},
				success: function (msg1) {
					if (msg1 == "noshoucang") {
						window.alert("这份招聘信息已经关注过了哦");
					}
					if (msg1 == "true") {
						window.alert("关注成功");
					}
				}});
		}

		if (layEvent === 'jl') {

			//发送ajax获取用户简历列表
			$.ajax({
				type: "POST",
				url: path+"user/getjllist",
				dataType: "text",
				success: function (msg1) {
					var msg = eval(msg1);
					$('#jlselect').empty();
					for(var i=0;i<msg.length;i++){
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
							layer.confirm('确定向此家公司投递此份简历？', function (index) {
									$.ajax({
										type: "POST",
										url: path+"user/toudi",
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

		}
	})
	});
