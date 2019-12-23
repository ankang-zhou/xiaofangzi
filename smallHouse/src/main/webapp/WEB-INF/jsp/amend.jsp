<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/20
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/amend.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
</head>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js" ></script>
<script type="text/javascript">
    $(function  () {
        layui.use('form', function(){
            var layer = layui.layer;
            var form = layui.form;
            //监听提交
            form.on('submit(login)', function(data){
                if ($(".userNickname").val()==null||$(".userNickname").val()==""){
                    alert("昵称不能为空")
                    return false;
                }else {
                    alert("修改成功")
                    layer.closeAll('iframe');
                }
            });
        });
    })

</script>
<body>
<div id="amend">
    <form action="/user/UpdateUserInfo" method="post" class="layui-form">
        <input type="hidden" name="userId" value="${user.userId}">
        昵称：<input type="text" name="userNickname" class="userNickname" value="${user.userNickname}" /><br />
        邮箱：<input type="text" name="userEamil" class="userEamil" value="${user.userEamil}" readonly/><br />
        姓名：<input type="text" name="userName" class="userName" value="${user.userName}" /><br />
        年纪：<input type="text" name="userAge" class="userAge" value="${user.userAge}" /><br />
        性别：<input type="text" name="userSex" class="userSex" value="${user.userSex}" /><br />
        头像：<input type="text" name="userHead" class="userHead" value="${user.userHead}" /><br />
        地址：<input type="text" name="userAddress" class="userAddress" value="${user.userAddress}" /><br />
        职业：<input type="text" name="userProfession" class="userProfession" value="${user.userProfession}" /><br />
        <button class="layui-btn" lay-submit id="amendbtn" lay-filter="login">修改</button>
    </form>
</div>
</body>
</html>
