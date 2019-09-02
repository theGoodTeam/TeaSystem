<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;background-color: #3992d0;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>

<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>

<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  });
});
</script>

</head>
<body>
<form action="register_player" method="post">
<dl class="admin_login">
 <dt>
  <strong>不二VOTE</strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" placeholder="账号" name="player_name" class="login_txtbx"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码"name="player_password" class="login_txtbx"/>
 </dd>

 <dd>
  <input type="submit" value="立即注册" class="submit_btn"/>
 </dd>
 </dl>
</form>

</body>
<script type="text/javascript">
	$(".submit_btn").bind('click',function(){
		alert("00");
		var index = top.layer.msg('登录中，请稍候',{icon: 16,time:false,shade:0.8});
		form.submit();
		
	})
</script>
</html>