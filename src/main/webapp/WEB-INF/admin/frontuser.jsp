<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/26
  Time: 23:34
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
            <label class="layui-form-label">手机号：</label>
            <div class="layui-input-inline">
                <input id="phone" class="layui-input" type="text" name="phone"
                        autocomplete="off" placeholder="输入手机号">
            </div>
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input id="name" class="layui-input" type="text" name="name"
                       autocomplete="off" placeholder="输入姓名">
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchFrontUser"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>

    <div>
        <table id="frontUser" lay-filter="getFrontUser"></table>
    </div>
</div>
<input id="Path" type="hidden" value="<%=path%>" />

<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">
    {{# if(d.state === 0 ){ }}
    <button lay-event="prohibit" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        禁用
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改密码
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
    {{# } }}
    {{# if(d.state === 1 ){ }}
    <button lay-event="enable" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        启用
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改密码
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
    {{# } }}
    {{# if(d.state === 2 ){ }}

    {{# } }}

</script>

<script type="text/javascript">

    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;
        var path=$('#Path').val();

        //第一个实例
        table.render({
            elem: '#frontUser'
            // , height: 312
            , url: path + '/adminFrontUser/table/frontUser' //数据接口
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
                {field: 'yhid', title: '序列', sort: true, width: 80}
                // , {field: 'scpicture', title: '用户头像', width: 90,templet:'<div><img  src=path + "{{ d.picture }}"></div>'}
                , {field: 'phone', title: '手机号'}
                , {field: 'name', title: '姓名'}
                , {field: 'regTime', title: '注册时间', width: 230}
                , {
                    field: 'state', title: '状态', width: 80, templet: function (d) {
                        if (d.state == 0) {
                            return '启用';
                        } else if (d.state == 1) {
                            return '禁用';
                        } else {
                            return '删除';
                        }
                    }
                }
                , {field: 'ope', title: '操作', toolbar: '#opeHtml', width: 260}
            ]]
        });

        //搜索
        form.on('submit(searchFrontUser)', function (data) {
            table.reload('frontUser', {
                url: path +  '/adminFrontUser/table/frontUser'
                , where: { //设定异步数据接口的额外参数，任意设
                    phone: data.field.phone,
                    name: data.field.name
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });


        //启用，禁用，修改密码，删除 用户
        table.on('tool(getFrontUser)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
            //禁用
            if (layEvent === 'prohibit' || layEvent === 'enable' || layEvent === 'delete') {
                var state = 0;
                var t = '启用';
                if (layEvent === 'prohibit') {
                    state = 1;
                    t = '禁用';
                }
                if (layEvent === 'delete') {
                    state = 2;
                    t = '删除';
                }
                layer.confirm('确定要' + t + '手机号:' + data.phone + '的用户吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url:  path + "/adminFrontUser/updateState",
                        dataType: "text",
                        data: {phone: data.phone, state: state},
                        success: function (msg) {
                            var i = 0;
                            if (msg === 'true') {
                                layer.msg(t + '成功');
                            } else {
                                layer.msg(t + '失败');
                                i = 1;
                            }
                            if (i === 0) {
                                table.reload('frontUser');
                            }
                        },
                        error: function () {
                            layer.msg('服务器繁忙');
                        }
                    });
                    layer.close(index);
                });
            }
            //修改密码
            if (layEvent === 'update') {
                layer.confirm('确定要重置手机号:' + data.phone + '用户的密码吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: path +  "/adminFrontUser/updatePassword",
                        dataType: "text",
                        data: {phone: data.phone},
                        success: function (msg) {
                            if (msg != '') {
                                layer.msg('密码重置成功，重置密码为：' + msg);
                            } else {
                                layer.msg('密码重置失败');
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


