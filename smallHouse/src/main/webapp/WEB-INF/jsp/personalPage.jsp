<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/20
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/personagePage.css" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js" ></script>
    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<header>

</header>
<div id="divmain">
    <div id="divleft">
        <ul id="ul">
            <li><a href="#">个人资料</a></li>
            <li><a href="#">我的关注</a></li>
            <li><a href="#">我的粉丝</a></li>
        </ul>
    </div>
    <div id="divright">
        <div id="top">
            <p>个人资料</p>
            <hr />
        </div>
        <div id="left">
            <div id="divimg"><img src="img/img1.png" width="80px" height="80px"/></div>
            <div id="diva"><a href="#">修改头像</a></div>
        </div>
        <div id="right">
            <div id="right_top">
                <p id="pid">ID：${userInfo.userEamil}</p>
                <p>关注：0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粉丝：0</p>
                <hr />
            </div>
            <div id="right_bottom">
                <button id="amendBtn">修改信息</button>
                <input type="hidden" value="${userInfo.userId}">
                <p>昵称：${userInfo.userNickname}</p>
                <p>邮箱：${userInfo.userEamil}</p>
                <p>姓名：${userInfo.userName}</p>
                <p>年纪：${userInfo.userAge}</p>
                <p>性别：${userInfo.userSex}</p>
                <p>头像：${userInfo.userHead}</p>
                <p>地址：${userInfo.userAddress}</p>
                <p>职业：${userInfo.userProfession}</p>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#amendBtn").click(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.open({
                    title: '在线调试',
                    type:2,
                    content: '${pageContext.request.contextPath}/user/SkipAmend?id='
                });
            })


    });
</script>
</html>