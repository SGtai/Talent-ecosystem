<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/20
  Time: 11:52
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

    <div>
        <button style="margin-left: 30%" class="layui-btn layui-btn-normal" id="addPosition"><i
                class="layui-icon">&#xe624;</i>添加行业
        </button>
    </div>

    <div>
        <table id="position" lay-filter="getPosition"></table>
    </div>
</div>


<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>修改
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
</script>
<script type="text/html" id="addPositionHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">行业名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="addPositionName" name="position"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqAddPosition">立即添加</button>
            </div>
        </div>
    </form>

</script>
<script type="text/html" id="updatePositionHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">行业名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="updatePosition" name="updatePosition"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqUpdatePosition">立即修改</button>
            </div>
        </div>
    </form>

</script>
<script type="text/javascript">

    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;


        //第一个实例
        table.render({
            elem: '#position'
            // , height: 312
            , url: '/adminStation/table/position' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'id', title: '序列', sort: true, width: 100}
                , {field: 'position', title: '行业名称'}
                , {field: 'ope', title: '操作', toolbar: '#opeHtml'}
            ]]
        });


        //增加行业
        $('#addPosition').click(function () {
            layer.open({
                type: 1,//嵌入网页
                content: $('#addPositionHtml').html(),
                area: ['350px', '200px'],
                title: '添加行业',

            });
            //重新渲染
            form.render();

            //添加操作
            $('#reqAddPosition').click(function () {
                var ap = $('#addPositionName').val();

                if (ap === '' ) {
                    layer.msg('专业名称不可为空')
                } else if (ap.length > 10 || ap.length < 2) {
                    layer.msg('行业名称不可小于2位,不可超过10位');
                } else {
                    layer.confirm('确定要增加行业:'+ap+'吗?', function (index) {
                        $.ajax({
                            type: "POST",
                            url: "/adminStation/addPosition",
                            dataType: "text",
                            data: {position:ap},
                            success: function (msg) {

                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('position');
                                    layer.closeAll();
                                } else if (msg === 'havePosition') {
                                    layer.msg('已有此行业,请重新添加');
                                } else {
                                    layer.msg('添加失败');
                                }
                            },
                            error: function () {
                                layer.msg('服务器繁忙');
                            }
                        });


                        layer.close(index);
                    });
                }
                return false;
            });


        });

        //修改以及删除
        table.on('tool(getPosition)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
                , position = data.position;

            if (layEvent === 'update') {
                //打开网页
                layer.open({
                    type: 1,//嵌入网页
                    content: $('#updatePositionHtml').html(),
                    area: ['350px', '200px'],
                    title: '修改行业',

                });
                //设置行业名称
                $('#updatePosition').prop('value', position);

                //重新渲染
                form.render();
                //提交修改
                $('#reqUpdatePosition').click(function () {
                    var up = $('#updatePosition').val();
                    if (up === data.position) {
                        layer.msg('请做修改在提交')
                    } else if (up === '') {
                        layer.msg('行业名称不可为空');
                    } else {
                        layer.confirm('确定要对行业进行修改吗?', function (index) {

                            $.ajax({
                                type: "POST",
                                url: "/adminStation/updatePosition",
                                dataType: "text",
                                data: {position:up,initPosition:data.position},
                                success: function (msg) {

                                    if (msg === 'true') {
                                        layer.msg('修改成功');
                                        table.reload('position');
                                        layer.closeAll();
                                    } else if (msg === 'havePosition') {
                                        layer.msg('已有此行业,请重新修改');
                                    } else {
                                        layer.msg('修改失败');
                                    }
                                },
                                error: function () {
                                    layer.msg('服务器繁忙');
                                }
                            });


                            layer.close(index);
                        });
                    }

                    return false;
                });


            }


            if (layEvent === 'delete') {
                layer.confirm('确定要删除行业：' + position + '吗?警告：删除后不可恢复！', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/adminStation/deletePosition",
                        dataType: "text",
                        data: {position: position},
                        success: function (msg) {

                            if (msg === 'true') {
                                layer.msg('删除成功');
                                table.reload('position');
                            } else {
                                layer.msg('删除失败');
                            }
                        },
                        error: function () {
                            layer.msg('服务器繁忙');
                        }
                    });
                    layer.close(index);
                });
            }

        })
    });
</script>
</body>
</html>
