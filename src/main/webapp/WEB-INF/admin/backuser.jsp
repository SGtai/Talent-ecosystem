<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/20
  Time: 18:30
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
            <label class="layui-form-label">管理员：</label>
            <div class="layui-input-inline">
                <input id="account" class="layui-input" type="text" name="account"
                       autocomplete="off" placeholder="输入账号">
            </div>
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input id="name" class="layui-input" type="text" name="name"
                       autocomplete="off" placeholder="输入姓名">
            </div>
            <button class="layui-btn" lay-submit lay-filter="searchBackUser"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>
    <div>
        <button style="margin-left: 60%" class="layui-btn layui-btn-normal" id="addBackUser"><i
                class="layui-icon">&#xe624;</i>添加管理员
        </button>
    </div>

    <div>
        <table id="backUser" lay-filter="getBackUser"></table>
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
<script type="text/html" id="addBackUserHtml">
    <form class="layui-form">
        <div class="layui-form-item">
            <label style="margin-left: 20%;margin-top: 2%;font-size: 25px;width: 43%"
                   class="layui-form-label">添加管理员</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号：</label>
            <div class="layui-input-inline">
                <input type="text" name="account" required lay-verify="required" placeholder="请输入账号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码：</label>
            <div class="layui-input-inline">
                <input type="password" name="passwordSure" required lay-verify="required" placeholder="请重复密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button style="margin-left: 10%" class="layui-btn" lay-submit lay-filter="addBackUser">立即添加</button>
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
        var path=$('#Path').val();

        //第一个实例
        table.render({
            elem: '#backUser'
            // , height: 312
            , url: path+'/adminBackUser/table/backUser' //数据接口
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
                {field: 'adid', title: '序列', sort: true, width: 80}
                , {field: 'account', title: '账号'}
                , {field: 'name', title: '姓名'}
                , {field: 'registertime', title: '注册时间', width: 230}
                , {
                    field: 'state', title: '状态', width: 80, templet: function (d) {
                        if (d.state === 0) {
                            return '启用';
                        } else if (d.state === 1) {
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
        form.on('submit(searchBackUser)', function (data) {
            table.reload('backUser', {
                url: path + '/adminBackUser/table/backUser'
                , where: { //设定异步数据接口的额外参数，任意设
                    account: data.field.account,
                    name: data.field.name
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

        //添加管理员
        $('#addBackUser').click(function () {
            layer.open({
                type: 1,//嵌入网页
                content: $('#addBackUserHtml').html(),
                area: ['350px', '400px'],
                title: '添加管理员',

            });
            //重新渲染
            form.render();

            //监听提交
            form.on('submit(addBackUser)', function (data) {
                var data = data.field;
                var flag = 'true';
                if (data.account.length > 10 || data.account.length < 3) {
                    layer.msg('账号只能3~10位之间');
                    flag = 'false';
                }
                if (data.name.length > 10 || data.name.length < 2) {
                    layer.msg('姓名只能2~10位之间');
                    flag = 'false';
                }
                if (data.password.length > 10 || data.password.length < 3) {
                    layer.msg('密码只能3~10位之间');
                    flag = 'false';
                }
                if (data.password != data.passwordSure) {
                    layer.msg('两次密码需一致');
                    flag = 'false';
                }
                if (flag === 'true') {
                    layer.confirm('确定要添加管理员:' + data.account + '吗?', function (index) {
                        $.ajax({
                            type: "POST",
                            url: path + "/adminBackUser/addBackUser",
                            dataType: "text",
                            data: data,
                            success: function (msg) {
                                if (msg === 'true') {
                                    layer.msg('添加成功');
                                    table.reload('backUser');
                                    layer.closeAll();
                                } else if (msg === 'haveAdmin') {
                                    layer.msg('已经存在此管理员');
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

        //启用，禁用，修改密码，删除 管理员
        table.on('tool(getBackUser)', function (obj) {

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
                layer.confirm('确定要' + t + '管理员:' + data.account + '吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: path + "/adminBackUser/updateState",
                        dataType: "text",
                        data: {account: data.account, state: state},
                        success: function (msg) {
                            var i = 0;
                            if (msg === 'true') {
                                layer.msg(t + '成功');
                            } else {
                                layer.msg(t + '失败');
                                i = 1;
                            }
                            if (i === 0) {
                                table.reload('backUser');
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
                layer.confirm('确定要重置管理员:' + data.account + '的密码吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: path + "/adminBackUser/updatePassword",
                        dataType: "text",
                        data: {account: data.account},
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

