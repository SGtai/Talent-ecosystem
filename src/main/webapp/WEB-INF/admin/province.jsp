<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/28
  Time: 21:54
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
        <button style="margin-left: 30%" class="layui-btn layui-btn-normal" id="addProvince"><i
                class="layui-icon">&#xe624;</i>添加省份
        </button>
    </div>

    <div>
        <table id="province" lay-filter="getProvince"></table>
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
<script type="text/html" id="addProvinceHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">省份名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="addProvinceName" name="province"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqAddProvince">立即添加</button>
            </div>
        </div>
    </form>

</script>
<script type="text/html" id="updateProvinceHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">省份名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="updateProvince" name="updateProvince"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqUpdateProvince">立即修改</button>
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
            elem: '#province'
            // , height: 312
            , url: '/adminCity/table/province' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'id', title: '序列', sort: true, width: 100}
                , {field: 'prname', title: '省份名称'}
                , {field: 'ope', title: '操作', toolbar: '#opeHtml'}
            ]]
        });


        //增加省份
        $('#addProvince').click(function () {
            layer.open({
                type: 1,//嵌入网页
                content: $('#addProvinceHtml').html(),
                area: ['350px', '200px'],
                title: '添加省份',

            });
            //重新渲染
            form.render();

            //添加操作
            $('#reqAddProvince').click(function () {
                var ap = $('#addProvinceName').val();

                if (ap === '') {
                    layer.msg('省份名称不可为空')
                } else if (ap.length > 10 || ap.length < 2) {
                    layer.msg('身份名称不可小于2位,不可超过10位');
                } else {
                    layer.confirm('确定要增加省份:' + ap + '吗?', function (index) {
                        $.ajax({
                            type: "POST",
                            url: "/adminCity/addProvince",
                            dataType: "text",
                            data: {prname: ap},
                            success: function (msg) {

                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('province');
                                    layer.closeAll();
                                } else if (msg === 'haveProvince') {
                                    layer.msg('已有此省份,请重新添加');
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
        table.on('tool(getProvince)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
                , prname = data.prname;

            if (layEvent === 'update') {
                //打开网页
                layer.open({
                    type: 1,//嵌入网页
                    content: $('#updateProvinceHtml').html(),
                    area: ['350px', '200px'],
                    title: '修改省份',

                });
                //设置省份名称
                $('#updateProvince').prop('value', prname);

                //重新渲染
                form.render();
                //提交修改
                $('#reqUpdateProvince').click(function () {
                    var up = $('#updateProvince').val();
                    if (up === data.prname) {
                        layer.msg('请做修改在提交')
                    } else if (up === '') {
                        layer.msg('省份名称不可为空');
                    } else {
                        layer.confirm('确定要对省份进行修改吗?', function (index) {

                            $.ajax({
                                type: "POST",
                                url: "/adminCity/updateProvince",
                                dataType: "text",
                                data: {prname: up, name: data.prname},
                                success: function (msg) {

                                    if (msg === 'true') {
                                        layer.msg('修改成功');
                                        table.reload('province');
                                        layer.closeAll();
                                    } else if (msg === 'haveProvince') {
                                        layer.msg('已有此省份,请重新修改');
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
                layer.confirm('确定要删除省份：' + prname + '吗?警告：删除后不可恢复！', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/adminCity/deleteProvince",
                        dataType: "text",
                        data: {prname: prname, prid: data.prid},
                        success: function (msg) {

                            if (msg === 'true') {
                                layer.msg('删除成功');
                                table.reload('province');
                            } else if (msg === 'haveCity') {
                                layer.msg('改省份下面有城市，不可删除');
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
