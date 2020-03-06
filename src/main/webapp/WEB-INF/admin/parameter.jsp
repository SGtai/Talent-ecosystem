<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/27
  Time: 19:45
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
            <label class="layui-form-label">参数名称：</label>
            <div class="layui-input-inline">
                <input id="name" class="layui-input" type="text" name="name"
                       autocomplete="off" placeholder="输入参数名称">
            </div>
            <label class="layui-form-label">参数类型：</label>
            <div class="layui-input-inline">
                <select id="type" name="type" lay-filter="type"></select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchParameter"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>
    <div>
        <button style="margin-left: 60%" class="layui-btn layui-btn-normal" id="addParameter"><i
                class="layui-icon">&#xe624;</i>添加参数
        </button>
    </div>

    <div>
        <table id="parameter" lay-filter="getParameter"></table>
    </div>
</div>

<input id="Path" type="hidden" value="<%=path%>" />
<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">

    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改
    </button>

</script>
<script type="text/html" id="addParameterHtml">
    <form class="layui-form">
        <div class="layui-form-item">
            <label style="margin-left: 20%;margin-top: 2%;font-size: 25px;width: 43%"
                   class="layui-form-label">添加参数</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数类型：</label>
            <div class="layui-input-inline">
                <select id="addType" name="type" lay-verify="required" lay-filter="type"></select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数值：</label>
            <div class="layui-input-inline">
                <input type="text" name="value" lay-verify="required" placeholder="请输入参数值"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button style="margin-left: 10%" class="layui-btn" lay-submit lay-filter="addParameter">立即添加</button>
            </div>
        </div>

    </form>
</script>
<script type="text/html" id="updateParameterHtml">
    <form class="layui-form">
        <div class="layui-form-item">
            <label style="margin-left: 20%;margin-top: 2%;font-size: 25px;width: 43%"
                   class="layui-form-label">修改参数</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数类型：</label>
            <div class="layui-input-inline">
                <select id="upType" name="upType" lay-verify="required" lay-filter="type"></select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数名称：</label>
            <div class="layui-input-inline">
                <input id="upName" type="text" name="upName" required lay-verify="required" placeholder="请输入姓名"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数值：</label>
            <div class="layui-input-inline">
                <input id="upValue" type="text" name="value" required lay-verify="required" placeholder="请输入参数值"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button style="margin-left: 10%" class="layui-btn" lay-submit lay-filter="updateParameter">立即修改</button>
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

        var typeList = new Array();
        $('#type').empty();
        $.ajax({
            type: "POST",
            url: path + "/adminParameter/getParameter",
            dataType: "text",
            success: function (msg) {
                $('#type').append('<option value="">请选择参数类型</option>');
                var list = JSON.parse(msg);
                typeList = list;
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
            elem: '#parameter'
            // , height: 312
            , url: path + '/adminParameter/table/parameter' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
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
                {field: 'id', title: '序列', sort: true, width: 80}
                , {field: 'name', title: '参数名'}
                , {field: 'type', title: '参数类型'}
                , {field: 'value', title: '参数值', width: 230}
                , {field: 'ope', title: '操作', toolbar: '#opeHtml', width: 260}
            ]]
        });

        //获取下拉框的值
        var type = "";
        // 获取下拉框数据
        form.on('select(type)', function (data) {
            type = data.value;
        });

        //搜索
        form.on('submit(searchParameter)', function (data) {
            table.reload('parameter', {
                url: path + '/adminParameter/table/parameter'
                , where:  //设定异步数据接口的额外参数，任意设
                data.field
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });


        //添加参数
        $('#addParameter').click(function () {

            layer.open({
                type: 1,//嵌入网页
                content: $('#addParameterHtml').html(),
                area: ['350px', '400px'],
                title: '添加参数',

            });

            $('#addType').append('<option value="">请选择参数类型</option>');

            for (var i = 0; i < typeList.length; i++) {
                $('#addType').append('<option value="' + typeList[i].type + '">' + typeList[i].type + '</option>');
            }
            // layui.form.render("select");


            //重新渲染
            form.render();


            //监听提交
            form.on('submit(addParameter)', function (data) {
                var data = data.field;

                if (data.name.length < 2 || data.name.length > 10) {
                    layer.msg("参数名称需要在2到10位之间");
                } else if (!/^\d{2,10}$/.test(data.value)) {
                    layer.msg('参数值只能位纯数字并且只能2到10位之间');
                } else {
                    layer.confirm('确定要添加参数:' + data.name + '吗?', function (index) {
                        $.ajax({
                            type: "POST",
                            url: path + "/adminParameter/addParameter",
                            dataType: "text",
                            data: data,
                            success: function (msg) {
                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('parameter');
                                    layer.closeAll();
                                } else if (msg === 'haveParameter') {
                                    layer.msg('该参数类型已有此参数名称,请重新修改');
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


        table.on('tool(getParameter)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
                , paid = data.paid;
            //修改
            if (layEvent === 'update') {
                layer.open({
                    type: 1,//嵌入网页
                    content: $('#updateParameterHtml').html(),
                    area: ['350px', '400px'],
                    title: '添加参数',
                });

                //设置参数名称
                $('#upName').prop('value', data.name);
                //设置参数值
                $('#upValue').prop('value', data.value);


                // -----------------------这个参数类型列表感觉需要去数据库查完回来判断/先放着--------------------
                //设置参数类型
                for (var i = 0; i < typeList.length; i++) {
                    $('#upType').append('<option value="' + typeList[i].type + '">' + typeList[i].type + '</option>');
                }
                // 遍历参数类型select
                $("#upType").each(function () {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function () {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.type) {
                            // 进行回显
                            $(this).attr("selected", "selected");
                        }
                    });
                })

                //重新渲染
                form.render();
                var un = $('#upName').val();
                var ut = $('#upType').val();
                var uv = $('#upValue').val();
                form.on('submit(updateParameter)', function (data) {

                    if (data.field.upName === un && data.field.upType === ut && data.field.value === uv) {
                        layer.msg("请做出修改在提交");
                    } else {
                        data.field.name = un;
                        data.field.type = ut;
                        data.field.paid = paid;
                        layer.confirm('确定要对参数进行修改吗?', function (index) {

                            $.ajax({
                                type: "POST",
                                url: path + "/adminParameter/updateParameter",
                                dataType: "text",
                                data: data.field,
                                success: function (msg) {

                                    if (msg === 'true') {
                                        layer.msg('修改成功');
                                        table.reload('parameter');
                                        layer.closeAll();
                                    } else if (msg === 'haveParameter') {
                                        layer.msg('该参数类型已有此参数名称,请重新修改');
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
        })
    });
</script>
</body>
</html>

