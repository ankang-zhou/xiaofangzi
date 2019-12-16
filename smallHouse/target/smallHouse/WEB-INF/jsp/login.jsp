<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/13
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width-device-width,initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="sie-edge" />
<%--	<% String path = request.getContextPath();%>--%>
<%--	<link rel="stylesheet" href="<%=path%>/css/style.css"/>--%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
	<title>登录注册页面</title>
	<!--图标库-->
	<script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

</head>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js" type="text/javascript"></script>


<body>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="${pageContext.request.contextPath}/user/addUserInfo" method="post" id="register">
			<h1>第三方按钮注册</h1>
			<div class="social-container"> <a href="#" class="social">
				<ion-icon name="logo-facebook"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-googleplus"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-linkedin"></ion-icon>
			</a> </div>
			<span>或使用您的电子邮箱注册</span>
			<input type="text" placeholder="姓名" name="userNickname" class="userNickname">
			<input type="email" placeholder="邮箱" name="userEamil" class="userEamil">
			<input type="password" placeholder="密码" name="userPassword" class="userPassword">
			<input type="submit" value="注册" id="registerSubmit">
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="${pageContext.request.contextPath}/user/LoginVerify" method="post" id="login">
			<h1>第三方登录</h1>
			<div class="social-container"> <a href="#" class="social">
				<ion-icon name="logo-facebook"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-googleplus"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-linkedin"></ion-icon>
			</a> </div>
			<span>或用邮箱登录</span>
			<input type="email" placeholder="邮箱" name="userEamil" class="loginUserEamil">
			<input type="password" placeholder="密码" name="userPassword" class="loginUserPassword">
			<input type="submit" value="登录" id="loginSubmit">
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>欢迎回来</h1>
				<p>与我们保持联系请登录您的个人信息</p>
				<button class="ghost" id="signIn">登录</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>欢迎光临</h1>
				<p>输入您的个人资料，并与我们一起开始旅程</p>
				<button class="ghost" id="signUp">注册</button>
			</div>
		</div>
	</div>

</div>
</body><script  src="${pageContext.request.contextPath}/static/js/script.js"></script>
<script type="text/javascript">
	$(function () {
		$("#registerSubmit").off().on('click',function(event){
			var flag = true;
			if($(".userNickname").val()==null||$(".userNickname").val()==""){
				alert("请输入昵称");
				flag = false;
			}else if($(".userEamil").val()==null||$(".userEamil").val()==""){
				alert("请输入邮箱");
				flag = false;
			}else if($(".userPassword").val()==null||$(".userPassword").val()==""){
				alert("请输入密码");
				flag = false;
			}
			if(!flag){
				event.preventDefault();
			}
		});
		$(".userEamil").blur(function () {
			if ($(".userEamil").val()!=null&&$(".userEamil").val()!=""){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/EmailVerify",
					type:"POST",
					data:$(".userEamil").serialize(),
					dataType:"JSON",
					success:function (data) {
						if (data!="0"){
							$(".userEamil").val("");
							alert("该邮箱已被注册")
						}
					}
				})
			}

		})
		$("#loginSubmit").off().on('click',function(event){
			var flag = true;
			if($(".loginUserEamil").val()==null||$(".loginUserEamil").val()==""){
				alert("请输入邮箱");
				flag = false;
			}else if($(".loginUserPassword").val()==null||$(".loginUserPassword").val()==""){
				alert("请输入密码");
				flag = false;
			}
			if(!flag){
				event.preventDefault();
			}
		});
	})
</script>
</html>
