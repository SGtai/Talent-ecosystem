<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/18
  Time: 17:28
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
    <div class="layui-form">
        <div class="layui-form-item" style="margin-left: 5%">
            <label class="layui-form-label">行业：</label>
            <div class="layui-input-inline">
                <select id="position" name="position" lay-verify="required">
                </select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchStation"><i class="layui-icon">&#xe615;</i>搜索
            </button>
            <button style="margin-left: 5%" class="layui-btn layui-btn-normal" lay-filter="addStation"><i
                    class="layui-icon">&#xe624;</i>添加岗位
            </button>
        </div>
    </div>
    <table id="station" lay-filter="test"></table>
</div>


<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>

<script type="text/javascript">

    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery;

        //ajax
        $.ajax({
            type: "POST",
            url: "/adminStation/choosePosition",
            dataType: "text",
            data: {},
            success: function (msg) {

                // $('#position').empty();
                $('#position').append('<option value="">请选择行业</option>');
                // alert(msg);
                var list = JSON.parse(msg);
                for (var i = 0; i < list.length; i++) {

                    $('#position').append('<option value="' + list[i].id + '">' + list[i].position + '</option>');
                }
                layui.form.render("select");
            },
            error: function () {
                layer.msg('服务器繁忙');
            }
        });


        //第一个实例
        table.render({
            elem: '#station'
            , height: 312
            , url: '/adminStation/table/station' //数据接口
            , page: true //开启分页
            , limit: 5
            , cols: [[ //表头
                {field: 'id', title: '序列', sort: true, width: 100}
                , {field: 'station', title: '岗位名称'}
                , {field: 'position', title: '行业名称', sort: true}
                , {field: 'city', title: '操作'}
            ]]
        });


        //搜索
        form.on('submit(searchStation)', function(data){
            layer.msg("eee");
            return false;
        });


    });
</script>

</body>
</html>
