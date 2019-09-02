<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="zh">
	<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>后台登录</title>

	<link rel="stylesheet" href="style.css" type="text/css" />

	</head>

	<body>
		<div id="container">
			<form action="/JavaOnlineExamination/Login_servlet" method="post">
				<div class="login"><strong>在线考试-后台管理系统</strong></div>
				<div class="username-text">用户名</div>
				<div class="password-text">密码</div>
				<div class="username-field">
					<input type="text" name="account" value="admin"  
					onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'admin';}"/>
				</div>
				<div class="password-field">
					<input type="password" name="password" value="123456" 
					 onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '123456';}"/>
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" checked="checked" /><label for="remember-me">记住密码 </label>
				<div class="forgot-usr-pwd">忘记了 <a href="../test.jsp">账号</a> 或者 <a href="../test.jsp">密码</a>?</div>
				<input type="submit" name="ok" value="GO" />
			</form>
		</div>
		<div id="footer">
			不是管理员？点击跳转到 <a href="../Login.jsp" >普通用户</a>
		</div>
	</body>
</html>
