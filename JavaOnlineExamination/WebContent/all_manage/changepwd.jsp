<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.sql.*,java.io.*,common.*,user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<%
/* //获取session中的user信息
User user = (User)session.getAttribute("user1");
String truename = user.getuTrueName();
String utel = user.getUsername(); */
%>
	<div id="pageAll">
		<div class="page ">
			<!-- 修改密码页面样式 -->
			<div class="bacen">
				<div class="bbD">
					您的真实姓名：【】</div>
				<div class="bbD">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的电话：【】</div>
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;输入旧密码：<input type="password" class="input3"
						onblur="checkpwd1()" id="pwd1" /> <img class="imga"
						src="img/ok.png" /><img class="imgb" src="img/no.png" />
				</div>
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3"
						onblur="checkpwd2()" id="pwd2" /> <img class="imga"
						src="img/ok.png" /><img class="imgb" src="img/no.png" />
				</div>
				<div class="bbD">
					再次确认密码：<input type="password" class="input3" onblur="checkpwd3()"
						id="pwd3" /> <img class="imga" src="img/ok.png" /><img
						class="imgb" src="img/no.png" />
				</div>
				<div class="bbD">
					<p class="bbDP">
						<button class="btn_ok btn_yes" href="#">提交</button>
						<a class="btn_ok btn_no" href="#">取消</a>
					</p>
				</div>
			</div>

			<!-- 修改密码页面样式end -->
		</div>
	</div>
</body>

</html>