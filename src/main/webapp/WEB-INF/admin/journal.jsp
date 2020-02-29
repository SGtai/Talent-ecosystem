<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/27
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String layuiPath = application.getContextPath() + "/layui/";
    String jsPath = application.getContextPath() + "/adminS/js/";
    String cssPath = application.getContextPath() + "/adminS/css/";
    String path = application.getContextPath() + "/";

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>菜鸟人才网平台管理端</title>
    <link rel="stylesheet" href=<%=layuiPath+"css/layui.css"%>>
    <script type="text/javascript" src=<%=layuiPath + "jquery-3.4.1.js"%>></script>

</head>
<body class="layui-layout-body">

<div style="width: 80%;margin-top: 5%;margin-left: 10%">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-left: 5%">
            <label class="layui-form-label">操作人：</label>
            <div class="layui-input-inline">
                <input id="account" class="layui-input" type="text" name="account"
                       autocomplete="off" placeholder="输入账号">
            </div>
            <label class="layui-form-label">操作类型：</label>
            <div class="layui-input-inline">
                <select id="type" name="type" lay-filter="type"></select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchJournal"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>


    <div>
        <table id="journal" lay-filter="getJournal"></table>
    </div>
</div>


<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/javascript">

    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;

        $('#type').empty();
        $.ajax({
            type: "POST",
            url: "/adminJournal/getJournal",
            dataType: "text",
            success: function (msg) {
                $('#type').append('<option value="">请选择参数类型</option>');
                var list = JSON.parse(msg);
                for (var i = 0; i < list.length; i++) {
                    $('#type').append('<option value="' + list[i].type + '">' + list[i].type + '</option>');
                }
                layui.form.render("select");
            },
            error: function () {
                layer.msg('服务器繁忙');
            }
        });

        //第一个实例
        table.render({
            elem: '#journal'
            // , height: 312
            , url: '/adminJournal/table/journal' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5,10]
            //返回整个数据
            // , parseData: function (res) { //res 即为原始返回的数据
            //     return {
            //         "code": res.code, //解析接口状态
            //         "msg": res.msg, //解析提示文本
            //         "count": res.count, //解析数据长度
            //         "data": res.data //解析数据列表
            //     };
            // }
            , cols: [[ //表头
                {field: 'joid', title: '序列',width: 75}
                , {field: 'account', title: '操作人账号'}
                , {field: 'name', title: '操作人姓名'}
                , {field: 'event', title: '操作事件'}
                , {field: 'type', title: '操作类型'}
                , {field: 'date', title: '操作时间', width: 230}
            ]]
        });
        //获取下拉框的值
        var type = "";
        // 获取下拉框数据
        form.on('select(type)', function (data) {
            type = data.value;
        });

        //搜索
        form.on('submit(searchJournal)', function (data) {
            table.reload('journal', {
                url: '/adminJournal/table/journal'
                , where: { //设定异步数据接口的额外参数，任意设
                    account: data.field.account,
                    type:type
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });


    });
</script>
</body>
</html>

