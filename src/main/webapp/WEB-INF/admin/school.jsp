<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/24
  Time: 23:45
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
<div style="width: 96%;margin-top: 5%;margin-left: 2%">
    <form class="layui-form" style="margin-left:10%">
        <div class="layui-form-item">
            <label class="layui-form-label">学校名称：</label>
            <div class="layui-input-inline">
                <input id="scName" class="layui-input" type="text" name="scName"
                       autocomplete="off" placeholder="输入学校名称">
            </div>
            <label class="layui-form-label">类型：</label>
            <div class="layui-input-inline">
                <select id="type" name="type" lay-filter="state">
                    <option value="">请选择学校类型</option>
                    <option value="普通高等教育">普通高等教育</option>
                    <option value="成人高等教育">成人高等教育</option>
                    <option value="高教自学考试">高教自学考试</option>
                    <option value="电大开放教育">电大开放教育</option>
                    <option value="远程网络教育">远程网络教育</option>
                </select>
            </div>
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-inline">
                <select id="state" name="state" lay-filter="state">
                    <option value="">请选择学校状态</option>
                    <option value="0">在业</option>
                    <option value="1">冻结</option>
                    <option value="2">黑名单</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">省份：</label>
            <div class="layui-input-inline">
                <select id="prid" name="prid" lay-filter="province"></select>
            </div>
            <label class="layui-form-label">城市：</label>
            <div class="layui-input-inline">
                <select id="ctid" name="ctid" lay-filter="ctid"></select>
            </div>

            <button style="margin-left: 5%" class="layui-btn" lay-submit lay-filter="searchSchool"><i
                    class="layui-icon">&#xe615;</i>搜索
            </button>
        </div>
    </form>

    <div>
        <table id="school" lay-filter="getSchool"></table>
    </div>
</div>
<input id="Path" type="hidden" value="<%=path%>" />

<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>
<script type="text/html" id="opeHtml">
    {{# if(d.state == 0 ){ }}
    <button lay-event="see" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i
            class="layui-icon">&#xe63c;</i>
        查看
    </button>
    <button lay-event="prohibit" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        冻结
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon">&#xe620;</i>
        修改密码
    </button>
    <button lay-event="delete" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>黑名单
    </button>
    {{# } }}
    {{# if(d.state == 1 ){ }}
    <button lay-event="see" type="button" class="layui-btn layui-btn-xs layui-btn-radius"><i
            class="layui-icon">&#xe63c;</i>
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
<script type="text/html" id="seeSchool">

    <div>
        <h1 align="center">学校信息</h1>
    </div>
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">学校名称：</label>
        <div class="layui-input-inline">
            <label id="getScName" class="layui-form-label"
                   style="width: 180px;text-align: left;"></label>
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校头像：</label>
        <div class="layui-input-inline">
            <img style="width: 50px;height: 50px" class="layui-nav-img" id="getScpicture" src="" alt="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用代码：</label>
        <div class="layui-input-inline">
            <label id="getCredit" class="layui-form-label" style="width: 180px;text-align: left;"></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校地址：</label>
        <div class="layui-input-inline">
            <label id="getScAddress" class="layui-form-label" style="width: 240px;text-align: left;"></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 85px">法定代表人:</label>
        <div class="layui-input-inline">
            <label id="getScfdMan" class="layui-form-label" style="width: 180px;text-align: left;"></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校类型：</label>
        <div class="layui-inline">
            <label id="getType" class="layui-form-label" style="width: 180px;text-align: left;"></label>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">学校简介：</label>
        <div class="layui-input-inline" style="width: 250px">
            <textarea readonly id="getScAbout" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校资料：</label>
        <div class="layui-input-inline" style="width: 250px">
            <textarea readonly id="getScData" class="layui-textarea"></textarea>
        </div>
    </div>

</script>
<script type="text/javascript">


    var path=$('#Path').val();
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form;


        $('#prid').empty();
        $('#ctid').empty();
        $('#ctid').append('<option value="">请选择城市</option>');
        $.ajax({
            type: "POST",
            url: path + "/adminCompany/getProvince",
            dataType: "text",
            success: function (msg) {
                $('#prid').append('<option value="">请选择省份</option>');
                var list = JSON.parse(msg);
                for (var i = 0; i < list.length; i++) {
                    $('#prid').append('<option value="' + list[i].prid + '">' + list[i].name + '</option>');
                }
                layui.form.render("select");
            },
            error: function () {
                layer.msg('服务器繁忙');
            }
        });
        form.on('select(province)', function (data) {

            $('#ctid').empty();
            $('#ctid').append('<option value="">请选择城市</option>');
            if (data.value === '') {
                form.render();
            } else {
                $.ajax({
                    type: "POST",
                    url: path + "/adminCompany/getCity",
                    dataType: "text",
                    data: {prid: data.value},
                    success: function (msg) {
                        var list = JSON.parse(msg);
                        for (var i = 0; i < list.length; i++) {
                            $('#ctid').append('<option value="' + list[i].ctid + '">' + list[i].ctname + '</option>');
                        }
                        layui.form.render("select");
                    },
                    error: function () {
                        layer.msg('服务器繁忙');
                    }
                });
            }
        });


        var p = "1223";
        //第一个实例
        table.render({
            elem: '#school'
            // , height: 312
            , url: path + '/adminSchool/table/school' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            ,where: {scState:"1"}
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
                {field: 'id', title: '序列', width: 70}
                , {field: 'scpicture', title: '学校头像', width: 90,templet:'<div><img  src=path + "{{ d.scpicture }}"></div>'}
                , {field: 'scName', title: '学校名称', width: 170}
                , {field: 'scfdMan', title: '学校法人', width: 90}
                , {field: 'type', title: '学校类型', width: 90}
                , {field: 'prid', title: '所在省份', width: 90}
                , {field: 'ctid', title: '所在城市', width: 90}
                , {field: 'regTime', title: '注册时间', width: 160}
                , {
                    field: 'state', title: '状态', width: 75, templet: function (d) {
                        if (d.state == 0) {
                            return '在业';
                        } else if (d.state == 1) {
                            return '冻结';
                        } else {
                            return '黑名单';
                        }
                    }
                }
                , {field: 'ope', title: '操作', toolbar: '#opeHtml', width: 330}
            ]]
        });

        //获取下拉框的值
        var city = "",
            state = "",
            prid = "",
            type = "";
        // 获取下拉框数据
        form.on('select(city)', function (data) {
            city = data.value;
        });
        form.on('select(state)', function (data) {
            state = data.value;
        });
        form.on('select(type)', function (data) {
            type = data.value;
        });
        form.on('select(prid)', function (data) {
            prid = data.value;
        });


        //搜索
        form.on('submit(searchSchool)', function (data) {
            table.reload('school', {
                url: path + '/adminSchool/table/school'
                , where: //设定异步数据接口的额外参数，任意设
                data.field
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });
        //在营，冻结，修改密码，拉黑 学校
        table.on('tool(getSchool)', function (obj) {

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
                layer.confirm('确定要将：' + data.scName + '' + t + '吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url:path +  "/adminSchool/updateState",
                        dataType: "text",
                        data: {account: data.scAccount, state: state},
                        success: function (msg) {
                            var i = 0;
                            if (msg === 'true') {
                                layer.msg(t + '成功');
                            } else {
                                layer.msg(t + '失败');
                                i = 1;
                            }
                            if (i === 0) {
                                table.reload('school');
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
                layer.confirm('确定要重置:' + data.scName + '的密码吗?', function (index) {
                    $.ajax({
                        type: "POST",
                        url: path + "/adminSchool/updatePassword",
                        dataType: "text",
                        data: {account: data.scAccount},
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

            //查看学校信息
            if (layEvent === 'see') {

                layer.open({
                    type: 1,//嵌入网页
                    content: $('#seeSchool').html(),
                    area: ['400px', '620px'],
                    title: '学校信息',

                });
                form.render();
                $('#getScName').html(data.scName);
                $('#getScAbout').html(data.scAbout);
                $('#getScAddress').html(data.scAddress);
                $('#getScData').html(data.scdata);
                $('#getScfdMan').html(data.scfdMan);
                $('#getCredit').html(data.xinyongDaima);
                $('#getType').html(data.type);
                $('#getScpicture').attr("src",path + data.scpicture);
                //
                // $('#getQyName').html(data.qyName);
                // $('#getQyData').html(data.qyData);
                // $('#getQyAddress').html(data.qyAddress);
                // $('#getQyfdMan').html(data.qyfdMan);
                // $('#getRegMoney').html(data.regMoney);
                // $('#getQyType').html(data.qyType);
                // $('#getJyScope').html(data.jyScope);
                // $('#getJyTime').html(data.jyTime);
            }
        })
    });
</script>


</body>
</html>

