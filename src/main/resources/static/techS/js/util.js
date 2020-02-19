/*
 *AJAX封装方法
 * 考虑到使用情况
 * 客户端提交操作几乎都为post 返回数据以json为传输基础 所以封装方法里直接使用 post 和 text类型
 * 另外不同业务的ajax 只有路径、数据、成功方法不同，所以以参数形式传入
 */
function f(nodes) {
	for (var i = 0; i < nodes.length; i ++) {
		if (nodes[i].nodeType == 3 && /^\s+$/.test(nodes[i].nodeValue)) {
//得到空白节点之后，移到父节点上，删除子节点
			nodes[i].parentNode.removeChild(nodes[i]);
		}
	}
	return nodes;
}
function filterSpaceNode(nodes) {
	for (var i = 0; i < nodes.length; i ++) {
		if (nodes[i].nodeType == 3 && /^\s+$/.test(nodes[i].nodeValue)) {
//得到空白节点之后，移到父节点上，删除子节点
			nodes[i].parentNode.removeChild(nodes[i]);
		}
	}
	return nodes;
}
/*
 *AJAX封装方法
 * 考虑到使用情况
 * 客户端提交操作几乎都为post 返回数据以json为传输基础 所以封装方法里直接使用 post 和 text类型
 * 另外不同业务的ajax 只有路径、数据、成功方法不同，所以以参数形式传入
 */
function f(nodes) {
	for (var i = 0; i < nodes.length; i ++) {
		if (nodes[i].nodeType == 3 && /^\s+$/.test(nodes[i].nodeValue)) {
//得到空白节点之后，移到父节点上，删除子节点
			nodes[i].parentNode.removeChild(nodes[i]);
		}
	}
	return nodes;
}
function myajaxS(urlPath,sendData,successFunction)
{
	$.ajax({
		type:"POST",
		url:urlPath,
		dataType:"text",
		data:sendData,
		success:successFunction,
		error:function () {
			alert("服务器正忙");
		}
	});
}

function myajax(urlPath,sendData,successFunction)
{
	$.ajax({
		type:"POST",
		url:urlPath,
		dataType:"json",
		data:sendData,
		success:successFunction,
		error:function () {
			layui.use("layer", function () {
				var layer = layui.layer;
				layer.msg('服务器正忙', {icon: 2});
			})
		}
	});
}