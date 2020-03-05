<%--
  Created by IntelliJ IDEA.
  User: 蔡鹭鹏
  Date: 2020/2/17
  Time: 15:35
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
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="width: 350px;font-size: 28px">菜鸟人才网平台-管理端</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">欢迎你：${sessionScope.admin.name}</li>
            <li class="layui-nav-item"><a href="/admin/exit">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <c:if test="${menus!=null}">
                    <c:forEach items="${menus}" begin="0" var="i">
                        <li class="layui-nav-item">
                            <a class="" href="javascript:;">${i.key}</a>
                            <c:forEach items="${i.value}" begin="0" var="j">
                                <dl class="layui-nav-child">
                                    <dd><a href="${j.menuurl}" target="main_self_frame">${j.sencondmenuname}</a></dd>
                                </dl>
                            </c:forEach>
                        </li>
                    </c:forEach>
                </c:if>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <!--        <div style="padding: 15px;">内容主体区域</div>-->
        <c:if test="${roid!=null}">
            <c:if test="${roid == 1 || roid == 2}">
                <iframe src="/jump/admin/welcome" name="main_self_frame" frameborder="0" class="layadmin-iframe"
                        style="width: 100%"
                        height="100%"></iframe>
            </c:if>

            <c:if test="${roid == 3}">
                <iframe src="" name="main_self_frame" frameborder="0" class="layadmin-iframe"
                        style="width: 100%"
                        height="100%"></iframe>
            </c:if>
            <c:if test="${roid == 4}">
                <iframe src="" name="main_self_frame" frameborder="0" class="layadmin-iframe"
                        style="width: 100%"
                        height="100%"></iframe>
            </c:if>


        </c:if>
    </div>

    <div class="layui-footer">
        &lt;&ndash; 传一科技 &ndash;&gt;
        &lt;&ndash; 组长：刘凯铭  组员：施恭泰、杨德禄、范宇恺、蔡鹭鹏 &ndash;&gt;
    </div>
</div>


<script type="text/javascript" src=<%=layuiPath + "layui.js"%>></script>


<script type="text/javascript">
    // e.preventDefault();：设置a的点击事件不跳转到另一个页面
    // $("iframeMain").attr("src",$(this).attr("href"));：给iframe添加src属性，值为a的href值
    layui.use('element', function () {
        var element = layui.element;
    });

</script>
</body>
</html>
