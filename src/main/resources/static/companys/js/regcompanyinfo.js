var Path=$('#Path').val();
/**
 * 注册功能判断
 */
layui.use(['form', 'layer'], function(){
	var form = layui.form
		,layer = layui.layer;

	//监听提交
	form.on('submit(reg)', function(data){
		var qyAccount=$('#qyAccount').val();
		var qyAddress=$('#qyAddress').val();
		var qyfdMan=$('#qyfdMan').val();
		var regMoney=$('#regMoney').val();
		var qyType=$('#qytype2').val();
		var jyScope=$('#jyScope').val();
		var jyTime=$('#jyTime').val();
				$.ajax(
					{
						type:"POST",
						url:Path+"/company/doRegQyinfo",
						dataType:"text",
						data:{qyAccount:qyAccount,qyAddress:qyAddress,qyfdMan:qyfdMan,regMoney:regMoney,qyType:qyType,jyScope:jyScope,jyTime:jyTime},
						success:function (msg) {
							if (msg==="success"){
								layer.alert("注册成功", { icon: 1, offset: "auto", time:1000 });
							} else{
								layer.alert("注册失败，请重新注册！", { icon: 1, offset: "auto", time:1000 });
							}
						},
						error:function (msg) {
							layer.alert(msg);
						}
					}
				);

		return false;
	});

});