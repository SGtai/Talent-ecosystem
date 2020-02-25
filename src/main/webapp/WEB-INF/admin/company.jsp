<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/22
  Time: 17:42
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
<div style="width: 96%;margin-top: 5%;margin-left: 2%">
    <form class="layui-form" style="margin-left: 15%">
        <div class="layui-form-item" >
            <label class="layui-form-label">企业名称：</label>
            <div class="layui-input-inline">
                <input id="qyName" class="layui-input" type="text" name="qyName"
                       autocomplete="off" placeholder="输入企业名称">
            </div>
            <label class="layui-form-label">企业类型：</label>
            <div class="layui-input-inline">
                <select id="qyType" name="qyType" lay-filter="qyType">
                    <option value="">请选择公司类型</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限责任公司">股份有限责任公司</option>
                    <option value="个人独资企业">个人独资企业</option>
                    <option value="合伙企业">合伙企业</option>
                </select>
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline">
                    <select id="state" name="state" lay-filter="state"></select>
                </div>
            </div>
        </div>
        <div class="layui-form-item" >

            <label class="layui-form-label">省份：</label>
            <div class="layui-input-inline">
                <select id="prid" name="prid" lay-filter="prid"></select>
            </div>
            <label class="layui-form-label">城市：</label>
            <div class="layui-input-inline">
                <select id="ctid" name="ctid" lay-filter="ctid"></select>
            </div>

            <button class="layui-btn" lay-submit lay-filter="searchCompany"><i class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>

    <div>
        <table id="company" lay-filter="getCompany"></table>
    </div>
</div>


<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">
    {{# if(d.state == 0 ){ }}
    <button lay-event="see" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe63c;</i>
        查看
    </button>
    <button lay-event="prohibit" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        冻结
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改密码
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
    {{# } }}
    {{# if(d.state == 1 ){ }}
    <button lay-event="see" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe63c;</i>
        查看
    </button>
    <button lay-event="enable" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        启用
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改密码
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>黑名单
    </button>
    {{# } }}
    {{# if(d.state == 2 ){ }}

    {{# } }}
</script>
<script type="text/javascript">
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;


        //第一个实例
        table.render({
            elem: '#company'
            // , height: 312
            , url: '/adminCompany/table/company' //数据接口
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
                {field: 'id', title: '序列',  width: 75}
                , {field: 'qyName', title: '企业名称'}
                , {field: 'qyfdMan', title: '企业法人', width: 90}
                , {field: 'qyType', title: '公司类型'}
                , {field: 'ctid', title: '所在城市', width: 90}
                , {field: 'regTime', title: '注册时间', width: 170}
                , {
                    field: 'state', title: '状态', width: 75, templet: function (d) {
                        if (d.state == 0) {
                            return '在营';
                        } else if (d.state == 1) {
                            return '冻结';
                        } else {
                            return '黑名单';
                        }
                    }
                }
                , {field: 'ope', title: '操作', toolbar: '#opeHtml', width: 310}
            ]]
        });


        //获取下拉框的值
        var city = "";
        var qyType = "";
        var state = "";
        // 获取下拉框数据
        form.on('select(city)', function (data) {
            city = data.value;
        });
        form.on('select(qyType)', function (data) {
            qyType = data.value;
        });
        form.on('select(state)', function (data) {
            state = data.value;
        });

        //搜索
        form.on('submit(searchCompany)', function (data) {
            table.reload('company', {
                url: '/adminCompany/table/company'
                , where: //设定异步数据接口的额外参数，任意设
                   data.field
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });
        //在营，冻结，修改密码，拉黑 公司
        table.on('tool(getCompany)', function (obj) {

            var layEvent = obj.event
                , data = obj.data
            //禁用
            if (layEvent === 'prohibit' || layEvent === 'enable' || layEvent === 'delete') {
                var state = 0;
                var t = '取消冻结';
                if (layEvent === 'prohibit') {
                    state = 1;
                    t = '冻结';
                }
                if (layEvent === 'delete') {
                    state = 2;
                    t = '拉入黑名单';
                }
                layer.confirm('确定要将：' + data.qyName + '' + t + '吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/adminBackUser/updateState",
                        dataType: "text",
                        data: {account: data.qyAccount, state: state},
                        success: function (msg) {
                            var i = 0;
                            if (msg === 'true') {
                                layer.msg(t + '成功');
                            } else {
                                layer.msg(t + '失败');
                                i = 1;
                            }
                            if (i === 0) {
                                table.reload('company');
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
                layer.confirm('确定要重置:' + data.qyName + '的密码吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/adminBackUser/updatePassword",
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
