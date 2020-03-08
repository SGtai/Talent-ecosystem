<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/28
  Time: 22:03
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
            <label class="layui-form-label">省份：</label>
            <div class="layui-input-inline">
                <select id="province" name="province" lay-filter="province"></select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchCity"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>
    <div>
        <button style="margin-left: 60%" class="layui-btn layui-btn-normal" id="addCity"><i
                class="layui-icon">&#xe624;</i>添加城市
        </button>
    </div>

    <div>
        <table id="city" lay-filter="getCity"></table>
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
<script type="text/html" id="addCityHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="addCityName" name="city"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 6%">
            <label class="layui-form-label">省份名称:</label>
            <div class="layui-input-inline">
                <select id="addProvince" name="province" lay-filter="province"></select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqAddCity">立即添加</button>
            </div>
        </div>
    </form>

</script>
<script type="text/html" id="updateCityHtml">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 3%">
            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="updateCity" name="city"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 6%">
            <label class="layui-form-label">省份名称:</label>
            <div class="layui-input-inline">
                <select id="ofProvince" name="province" lay-filter="province"></select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10%">
            <div class="layui-input-block">
                <button class="layui-btn" id="reqUpdateCity">立即修改</button>
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

        var poidList
        var path=$('#Path').val();
        //ajax
        $.ajax({
            type: "POST",
            url: path + "/adminCity/chooseProvince",
            dataType: "text",
            data: {},
            success: function (msg) {

                // $('#position').empty();
                $('#province').append('<option value="">请选择省份</option>');
                // alert(msg);
                var list = JSON.parse(msg);
                poidList = list;
                for (var i = 0; i < list.length; i++) {
                    $('#province').append('<option value="' + list[i].prid + '">' + list[i].prname + '</option>');
                }
                layui.form.render("select");
            },
            error: function () {
                layer.msg('服务器繁忙');
            }
        });


        //第一个实例
        table.render({
            elem: '#city'
            // , height: 312
            , url:  path + '/adminCity/table/city' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'id', title: '序列', sort: true, width: 100}
                , {field: 'ctname', title: '城市名称'}
                , {field: 'prname', title: '省份名称', sort: true}
                , {field: 'ope', title: '操作', toolbar: '#opeHtml'}
            ]]
        });


        //获取下拉框的值
        var prid = "";
        // 获取下拉框数据
        form.on('select(province)', function (data) {
            prid = data.value;
        });
        //搜索
        form.on('submit(searchCity)', function () {
            table.reload('city', {
                url:  path + '/adminCity/table/city'
                , where: { //设定异步数据接口的额外参数，任意设
                    prid: prid
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

        //增加城市
        $('#addCity').click(function () {
            layer.open({
                type: 1,//嵌入网页
                content: $('#addCityHtml').html(),
                area: ['350px', '300px'],
                title: '添加城市',

            });
            // -----------------------这个省份列表感觉需要去数据库查完回来判断/先放着--------------------
            //设置省份列表
            $('#addProvince').append('<option value="">请选择省份</option>');
            for (var i = 0; i < poidList.length; i++) {
                $('#addProvince').append('<option value="' + poidList[i].prid + '">' + poidList[i].prname + '</option>');
            }
            //重新渲染
            form.render();

            //添加操作
            $('#reqAddCity').click(function () {
                var us = $('#addCityName').val();
                var op = $('#addProvince').val();

                if (us === '' || op === '') {
                    layer.msg('城市名称/省份名称 不可为空')
                } else if (us.length > 10 || us.length < 2) {
                    layer.msg('城市名称不可小于2位,不可超过10位');
                } else {
                    layer.confirm('确定要增加城市:'+us+'吗?', function (index) {

                        $.ajax({
                            type: "POST",
                            url:  path + "/adminCity/addCity",
                            dataType: "text",
                            data: {prid: op, ctname: us},
                            success: function (msg) {

                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('city');
                                    layer.closeAll();
                                } else if (msg === 'haveCity') {
                                    layer.msg('该省份已有此城市名,请重新添加');
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
        table.on('tool(getCity)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
                , prid = data.prid
                , ctname = data.ctname;

            if (layEvent === 'update') {
                //打开网页
                layer.open({
                    type: 1,//嵌入网页
                    content: $('#updateCityHtml').html(),
                    area: ['350px', '300px'],
                    title: '修改城市',

                });
                //设置城市名称
                $('#updateCity').prop('value', ctname);
                // -----------------------这个城市列表感觉需要去数据库查完回来判断/先放着--------------------
                //设置城市列表
                for (var i = 0; i < poidList.length; i++) {
                    $('#ofProvince').append('<option value="' + poidList[i].prid + '">' + poidList[i].prname + '</option>');
                }
                // 遍历行业select
                $("#ofProvince").each(function () {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function () {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.prid) {
                            // 进行回显
                            $(this).attr("selected", "selected");
                        }
                    });
                })
                //重新渲染
                form.render();
                //提交修改
                $('#reqUpdateCity').click(function () {
                    var us = $('#updateCity').val();
                    var op = $('#ofProvince').val();
                    console.log(op);
                    if (op === data.prid && us === data.ctname) {
                        layer.msg('请做修改在提交')
                    } else if (us === '') {
                        layer.msg('城市名称不可为空');
                    } else {

                        layer.confirm('确定要对城市进行修改吗?', function (index) {

                            $.ajax({
                                type: "POST",
                                url:  path + "/adminCity/updateCity",
                                dataType: "text",
                                data: {ctid:data.prid,prid: op, ctname: us, name: data.ctname},
                                success: function (msg) {

                                    if (msg === 'true') {
                                        layer.msg('修改成功');
                                        table.reload('city');
                                        layer.closeAll();
                                    } else if (msg === 'haveCity') {
                                        layer.msg('该省份已有此城市名,请重新修改');
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
                layer.confirm('确定要删除城市：' + ctname + '吗?警告：删除后不可恢复！', function (index) {
                    $.ajax({
                        type: "POST",
                        url: path +  "/adminCity/deleteCity",
                        dataType: "text",
                        data: {prid: prid, ctname: ctname,ctid:data.ctid},
                        success: function (msg) {

                            if (msg === 'true') {
                                layer.msg('删除成功');
                                table.reload('city');
                            }else {
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
