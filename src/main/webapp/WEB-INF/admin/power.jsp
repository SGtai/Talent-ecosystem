<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/29
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String layuiPath = application.getContextPath() + "/layui/";
    String jsPath = application.getContextPath() + "/adminS/js/";
    String cssPath = application.getContextPath() + "/adminS/css/";
    String path = application.getContextPath() + "/";
    String zTreePath = application.getContextPath() + "/adminS/ztree/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>菜鸟人才网平台管理端</title>
    <link rel="stylesheet" href=<%=layuiPath+"css/layui.css"%>>
    <script type="text/javascript" src=<%=layuiPath + "jquery-3.4.1.js"%>></script>
    <link rel="stylesheet" href=<%=zTreePath + "css/metroStyle/metroStyle.css"%> rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src=<%=zTreePath + "js/jquery.ztree.all.min.js"%>></script>

</head>
<body class="layui-layout-body">


<form class="layui-form" action="" lay-filter="frm">

    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select name="role" id="role" lay-filter="rolemenu">
                <option value="1" selected="">超级管理员</option>
                <option value="2">普通管理员</option>
                <option value="3">企业</option>
                <option value="4">高校</option>
                <option value="5">测试</option>
            </select>
        </div>
    </div>

    <div class="content_wrap" style="padding-left: 70px">
        <div class="zTreeDemoBackground left" style="height:470px;width:300px;overflow:auto">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
    <br>
    <div class="layui-form-item" style="padding-left: 25px">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
        </div>
    </div>
</form>



<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/javascript">


    // setting是初始化ztree的组件
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",//节点的id
                pIdKey: "pid",//节点的父节点id
                rootPId: 0
            }
        },
    };



    // 页面加载后马上获取后台数据
    $(document).ready(function () {
        var rid = $("#role").val();
        $.ajax({
            url:"/adminMenu/initMenuChange",
            data: {"rid":rid},
            type: "post",
            dataType: "json",
            success: function (data) {

                //获取数据并且初始化树节点
                var zNodes=eval(data);
                $.fn.zTree.init($("#treeDemo"), setting, zNodes);

                // 展开全部节点
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                treeObj.expandAll(true);

                //循环遍历数据，并且将checked的数据勾选
                for (var i = 0; i < data.length ; i++) {
                    if(data[i].checked === "1"){
                        // 回显选中的数据　　　
                        treeObj.checkNode(treeObj.getNodeByParam("id", data[i].id), true);
                    }
                }
            }
        });

        //多条件查询
        layui.use(['layer', 'form'], function () {
            var layer = layui.layer //弹层
                , form = layui.form //form表单

            //绑定的按钮是submit 监听提交 lay-filter="search"
            form.on('submit(demo1)', function (data) {
                var rid = data.field.role;

                //获取所有选中的节点
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObj.getChangeCheckedNodes();
                var arrayObj = [];
                for (var i = 0; i < nodes.length ; i++) {
                    arrayObj.push(nodes[i].id)
                }
                alert(arrayObj);
                $.ajax({
                    url:"/adminMenu/changeMenu",
                    data: {"rid":rid,"checkList":JSON.stringify(arrayObj)},
                    type: "post",
                    dataType: "json",
                    traditional: true,
                    success: function (data) {
                        if(data===1){
                            layer.msg("修改成功！")
                        }else {
                            layer.msg("修改失败！")
                        }
                    }
                    ,error:function () {
                        layer.alert("服务器正忙.....");
                    }
                });
                return false;//false：阻止表单跳转  true：表单跳转
            });


            //绑定的按钮是select 监听提交 lay-filter="search"
            form.on('select(rolemenu)', function (data) {
                var rid = $("#role").val();

                $.ajax({
                    url:"/adminMenu/initMenuChange",
                    data: {"rid":rid},
                    type: "post",
                    dataType: "json",
                    success: function (data) {

                        //获取数据并且初始化树节点
                        var zNodes=eval(data);
                        $.fn.zTree.init($("#treeDemo"), setting, zNodes);

                        // 展开全部节点
                        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                        treeObj.expandAll(true);

                        //循环遍历数据，并且将checked的数据勾选
                        for (var i = 0; i < data.length ; i++) {
                            if(data[i].checked === "1"){
                                // 回显选中的数据　　　
                                treeObj.checkNode(treeObj.getNodeByParam("id", data[i].id), true);
                            }
                        }
                    }
                });
            });
        });
    });





</script>
</body>
</html>
