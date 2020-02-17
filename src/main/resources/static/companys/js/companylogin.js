layui.use('form', function(){
	var form = layui.form;
	form.render();
	//监听提交
	form.on('submit(formDemo)', function(data){
		layer.msg(JSON.stringify(data.field));
		if (true) {

			var account = $('#account').val();
			var password = $('#password').val();
			var card=$('#card').val();

			$.ajax(
				{
					type: "POST",
					url: "/company/doReg",
					dataType: "json",
					//发送的数据（同时也将数据发送出去）
					data: {qyAccount: account,password:password,qyData:card},
					success: function (msg) {
						var res = msg.toString();
						if (res == 'true'){
							alert('登录成功');
							window.location.href="/jump/front/back";
						}
						if(res == 'nopwd'){
							layer.msg('密码错误');
						}
						if(res == 'noname'){
							layer.msg('用户名错误');
						}
						if(res == 'nostate'){
							layer.msg('账户被禁用,请联系管理员');
						}
						if(res == 'del'){
							layer.msg('账户被删除，请重新注册');
						}
					},
					error: function (msg) {
						alert("服务器正忙。。。。"+msg);
					}
				}
			);
			return false;
		}})

});
