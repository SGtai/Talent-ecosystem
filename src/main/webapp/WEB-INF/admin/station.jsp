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
    String path = application.getContextPath();

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
            <label class="layui-form-label">行业：</label>
            <div class="layui-input-inline">
                <select id="position" name="position" lay-filter="position"></select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchStation"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>
    <div>
        <button style="margin-left: 60%" class="layui-btn layui-btn-normal" id="addStation"><i
                class="layui-icon">&#xe624;</i>添加岗位
        </button>
    </div>

    <div>
        <table id="station" lay-filter="getStation"></table>
    </div>
</div>

<input id="Path" type="hidden" value="<%=path%>" />

<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>修改
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
</script>
<script type="text/html" id="addStationHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">岗位名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="addStationName" name="station"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 6%">
            <label class="layui-form-label">专业名称:</label>
            <div class="layui-input-inline">
                <select id="addPosition" name="position" lay-filter="position"></select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqAddStation">立即添加</button>
            </div>
        </div>
    </form>

</script>
<script type="text/html" id="updateStationHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">岗位名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="updateStation" name="station"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 6%">
            <label class="layui-form-label">专业名称:</label>
            <div class="layui-input-inline">
                <select id="ofPosition" name="position" lay-filter="position"></select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqUpdateStation">立即修改</button>
            </div>
        </div>
    </form>

</script>
<script type="text/javascript">

    var path=$('#Path').val();
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;

        var poidList;

        //ajax
        $.ajax({
            type: "POST",
            url: path + "/adminStation/choosePosition",
            dataType: "text",
            data: {},
            success: function (msg) {

                // $('#position').empty();
                $('#position').append('<option value="">请选择行业</option>');
                // alert(msg);
                var list = JSON.parse(msg);
                poidList = list;
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
            // , height: 312
            , url:  path + '/adminStation/table/station' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'id', title: '序列', sort: true, width: 100}
                , {field: 'station', title: '岗位名称'}
                , {field: 'position', title: '行业名称', sort: true}
                , {field: 'ope', title: '操作', toolbar: '#opeHtml'}
            ]]
        });


        //获取下拉框的值
        var position = "";
        // 获取下拉框数据
        form.on('select(position)', function (data) {
            position = data.value;
        });
        //搜索
        form.on('submit(searchStation)', function () {
            table.reload('station', {
                url:  path + '/adminStation/table/station'
                , where: { //设定异步数据接口的额外参数，任意设
                    poid: position
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

        //增加岗位
        $('#addStation').click(function () {
            layer.open({
                type: 1,//嵌入网页
                content: $('#addStationHtml').html(),
                area: ['350px', '300px'],
                title: '添加岗位',

            });
            // -----------------------这个行业列表感觉需要去数据库查完回来判断/先放着--------------------
            //设置行业列表
            $('#addPosition').append('<option value="">请选择行业</option>');
            for (var i = 0; i < poidList.length; i++) {
                $('#addPosition').append('<option value="' + poidList[i].id + '">' + poidList[i].position + '</option>');
            }
            //重新渲染
            form.render();

            //添加操作
            $('#reqAddStation').click(function () {
                var us = $('#addStationName').val();
                var op = $('#addPosition').val();

                if (us === '' || op === '') {
                    layer.msg('岗位名称/专业名称 不可为空')
                } else if (us.length > 10 || us.length < 2) {
                    layer.msg('岗位名称不可小于2位,不可超过10位');
                } else {
                    layer.confirm('确定要增加岗位:'+us+'吗?', function (index) {

                        $.ajax({
                            type: "POST",
                            url:  path + "/adminStation/addStation",
                            dataType: "text",
                            data: {poid: op, station: us},
                            success: function (msg) {

                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('station');
                                    layer.closeAll();
                                } else if (msg === 'haveStation') {
                                    layer.msg('该行业已有此岗位名,请重新添加');
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
        table.on('tool(getStation)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
                , poid = data.poid
                , station = data.station;

            if (layEvent === 'update') {
                //打开网页
                layer.open({
                    type: 1,//嵌入网页
                    content: $('#updateStationHtml').html(),
                    area: ['350px', '300px'],
                    title: '修改岗位',

                });
                //设置岗位名称
                $('#updateStation').prop('value', station);
                // -----------------------这个行业列表感觉需要去数据库查完回来判断/先放着--------------------
                //设置行业列表
                for (var i = 0; i < poidList.length; i++) {
                    $('#ofPosition').append('<option value="' + poidList[i].id + '">' + poidList[i].position + '</option>');
                }
                // 遍历行业select
                $("#ofPosition").each(function () {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function () {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.poid) {
                            // 进行回显
                            $(this).attr("selected", "selected");
                        }
                    });
                })
                //重新渲染
                form.render();
                //提交修改
                $('#reqUpdateStation').click(function () {
                    var us = $('#updateStation').val();
                    var op = $('#ofPosition').val();
                    console.log(op);
                    if (op === data.poid && us === data.station) {
                        layer.msg('请做修改在提交')
                    } else if (us === '') {
                        layer.msg('岗位名称不可为空');
                    } else {

                        layer.confirm('确定要对岗位进行修改吗?', function (index) {

                            $.ajax({
                                type: "POST",
                                url:  path + "/adminStation/updateStation",
                                dataType: "text",
                                data: {id:data.poid,poid: op, station: us, initStation: data.station},
                                success: function (msg) {

                                    if (msg === 'true') {
                                        layer.msg('修改成功');
                                        table.reload('station');
                                        layer.closeAll();
                                    } else if (msg === 'haveStation') {
                                        layer.msg('该行业已有此岗位名,请重新修改');
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
                layer.confirm('确定要删除岗位：' + station + '吗?警告：删除后不可恢复！', function (index) {
                    $.ajax({
                        type: "POST",
                        url:  path + "/adminStation/deleteStation",
                        dataType: "text",
                        data: {poid: poid, station: station,stid:data.stid},
                        success: function (msg) {

                            if (msg === 'true') {
                                layer.msg('删除成功');
                                table.reload('station');
                            } else if (msg === 'haveJob'){
                                layer.msg('该岗位下面有企业发布的招聘信息，暂不可删除');
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
